import sys
import os
from PIL import Image

PIXELS_PER_BYTE = 2  # 4 bits per pixel -> 2 pixels per byte
MAX_VALUE = 15

def crush_bitmap(input_path, output_path):
    # Open the image and get dimensions
    with Image.open(input_path) as img:
        width, height = img.size
        pixels = list(img.getdata())

    binary_data = bytearray()

    # Process row by row
    for y in range(height):
        row_start = y * width

        # Process in chunks of 2 pixels horizontally
        for x in range(0, width, PIXELS_PER_BYTE):
            byte_value = 0

            # Pack 2 pixels into 1 byte (left pixel in the high nibble)
            for slot in range(PIXELS_PER_BYTE):
                px = x + slot

                # Pad with 0 if the row width is odd
                if px >= width:
                    continue

                pixel = pixels[row_start + px]

                # Handle RGB(A) tuples (use first channel) and single-value pixels
                value = pixel[0] if isinstance(pixel, tuple) else pixel

                if value < 0 or value > MAX_VALUE:
                    print(f"Error: pixel at ({px}, {y}) has value {value}; only 0-{MAX_VALUE} are allowed.")
                    sys.exit(1)

                shift = 4 - (slot * 4)  # 4, 0
                byte_value |= (value << shift)

            binary_data.append(byte_value)

    # Write the packed data to the output binary file
    with open(output_path, "wb") as f:
        f.write(binary_data)

    # Packed row width in bytes (e.g., 160 for a 320px wide image)
    packed_width = (width + PIXELS_PER_BYTE - 1) // PIXELS_PER_BYTE
    print(f"Successfully crushed {width}x{height} image to a {packed_width}x{height} byte file: {output_path}")

if __name__ == "__main__":
    # Check if the filename argument was provided
    if len(sys.argv) < 2:
        print("Error: Missing input image path.")
        print("Usage: python crush.py <path_to_image>")
        sys.exit(1)

    input_file = sys.argv[1]

    # Verify the file actually exists
    if not os.path.exists(input_file):
        print(f"Error: The file '{input_file}' does not exist.")
        sys.exit(1)

    # Generate an output name automatically (e.g., image.png -> image.bin)
    base_name, _ = os.path.splitext(input_file)
    output_file = f"{base_name}.bin"

    crush_bitmap(input_file, output_file)