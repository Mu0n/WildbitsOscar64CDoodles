import sys
import os
from PIL import Image

def crush_bitmap(input_path, output_path):
    # Open the image and get dimensions
    with Image.open(input_path) as img:
        width, height = img.size
        pixels = list(img.getdata())
        
    binary_data = bytearray()
    
    # Process row by row
    for y in range(height):
        row_start = y * width
        
        # Process in chunks of 8 pixels horizontally
        for x in range(0, width, 8):
            byte_value = 0
            
            # Pack 8 pixels into 1 byte (MSB left, LSB right)
            for bit_index in range(8):
                pixel_index = row_start + x + bit_index
                
                if pixel_index < row_start + width:
                    pixel = pixels[pixel_index]
                    
                    # Handle both RGB tuples and single-value pixels
                    if isinstance(pixel, tuple):
                        is_non_zero = any(channel > 0 for channel in pixel)
                    else:
                        is_non_zero = pixel > 0
                    
                    if is_non_zero:
                        byte_value |= (1 << (7 - bit_index))
            
            binary_data.append(byte_value)
            
    # Write the packed bits to the output binary file
    with open(output_path, "wb") as f:
        f.write(binary_data)
    
    # Dynamically prints the true packed byte width (e.g., 40 for a 320px wide image)
    packed_width = width // 8
    print(f"Successfully crushed {width}x{height} image to a {packed_width}x{height} byte file: {output_path}")

if __name__ == "__main__":
    # Check if the filename argument was provided
    if len(sys.argv) < 2:
        print("Error: Missing input image path.")
        print("Usage: python script.py <path_to_image>")
        sys.exit(1)
        
    # Fixed: Correctly targeting the first script argument
    input_file = sys.argv[1]
    
    # Verify the file actually exists
    if not os.path.exists(input_file):
        print(f"Error: The file '{input_file}' does not exist.")
        sys.exit(1)
        
    # Generate an output name automatically (e.g., image.bmp -> image.bin)
    base_name, _ = os.path.splitext(input_file)
    output_file = f"{base_name}.bin"
    
    crush_bitmap(input_file, output_file)
