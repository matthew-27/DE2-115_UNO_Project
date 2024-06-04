module red_zero(
    input [7:0] addr,
    output [239:0] data
);
parameter [0:149][239:0] picture = {
    240'b111011111111010111100010101110011010101110101101101011011010110110101101101011011010111010101110101011101010111010101110101011011010110110101101101011011010110110101110101011101010111010101110101011011010101110111101111001001110110111101011,
240'b111111011101111110111101111000011111010111110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111010111011000101101001101111011110011,
240'b111000001100001111111010111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100101011011111100111,
240'b101110011111000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110001010111000,
240'b110000101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110101101,
240'b110101101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110101,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110111,
240'b110110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110110,
240'b110011101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110010,
240'b101110011111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111010010101101,
240'b110001111101101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100100111010000,
240'b111101001100001011011101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101110011111100000011110010,
240'b111110011111001010111110101100001011111011000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111011101110110000110010011111011011110111,
240'b111011111111010111100011101110101010110010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010110010111110111001011110111011101011,
240'b111111011101111110111101111000011111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011011000101101001101111011110011,
240'b111000001100001111111010111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100101011011111100111,
240'b101110011111000111111111111000001001111010001100100011001000110010001100100011001000110010001100100011001000110010001100100011001000110010001100100011001000110010001100100011001000110010001010100010001010011111101110111111111110001010111000,
240'b110000101111111111100111011011100100110101010000010100000101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000100111001101010100001000101000110000010111110001111110110101101,
240'b110101101111111110110111010100000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100001111111111010111101010111110101111111111110110101,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100011111100101101101101101101110010001111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110010111011001100100110010101111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110110101010101010100110011001111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110110101100001010101110011001111111110110111,
240'b110110011111111110101011010100010101010101010011010100010101000101010001010100000101000101010011010101000101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110110101100001010101110011001111111110110111,
240'b110110011111111110101011010100000101001001101001100011011001101110011000100011100111110001101000010101110101000101010010010101010101010101010101010101010101010101010101010101010100111110100110110111010101100001010101110011001111111110110111,
240'b110110011111111110101010010100001001001011100100111111111111111111111111111111111111100111101001110010011001110001101100010100110101001001010101010101010101010101010101010101010101000010010111110000110101011101010101110011001111111110110111,
240'b110110011111111110100111100010101111100011111111111111111111111111111111111111111111111111111111111111111111111111101011101100000110110101010001010100110101010101010101010101010101010101011011010111110101010001010110110011001111111110110111,
240'b110110011111111110111010110111001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100010011110010110110101001001010101010101010101010101010100010100110101010001010110110011001111111110110111,
240'b110110011111111111011101111110101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110010000110100101010001010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111111101101111111101111111111111111111111111111111111111111111111111111111111111111111111111111001111101010111011101111111111111111111111111101110001110011010100010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111111101110111111101111111111111111111111111111111111111111111111111111111111111111111111111010011101100110011010111100000011111111111111111111111111100010011100010101000001010101010101010101010001010110110011001111111110110111,
240'b110110011111111111101100111111101111111111111111111111111111111111111111111111111111111111111111111111111001100001001110010100000101111111001101111111111111111111111111110111000110010101010010010101010101010001010110110011001111111110110111,
240'b110110011111111111100111111111101111111111111111111111111111111111111111111111111111111111111111111111111001101001010001010101010100111101101000111000011111111111111111111111111100010101011000010101000101010001010110110011001111111110110111,
240'b110110011111111111011001111101111111111111111111111111111111111111111111111111111111111111111111111111111001101001001111011001110110111101001110110000001111111111111111111111111111111110011101010100000101010001010110110011001111111110110111,
240'b110110011111111111000110111011001111111111111111111111111111111111111111111111111111111111111111111111111001101001001101011110001101011001101101101111011111111111111111111111111111111111101110011011100101000101010110110011001111111110110111,
240'b110110011111111110110011110101111111111111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111101011010110110100011111111111111111111111111111111111111111101110100101000101010110110011001111111110110111,
240'b110110011111111110101001101101011111111111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111001111111111111111111111111111111111111111111101000111000001010010110011001111111110110111,
240'b110110011111111110100110100010001111110111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111010111001010001110011001111111110110111,
240'b110110011111111110101001011000011110010011111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111110001101100000110010101111111110110111,
240'b110110011111111110101011010011101010110111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111110110000100110001111111111110110111,
240'b110110011111111110101011010011100111001011101111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111110101110110001101111111110110111,
240'b110110011111111110101011010100010101001010101111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111010001110011001111111110110111,
240'b110110011111111110101011010100010101001001101001111000111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111100111110110001111111110110111,
240'b110110011111111110101011010100010101010101010000100011011111100111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111110110111000101111111110110111,
240'b110110011111111110101011010100010101010101010100010101011010110011111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111111010111010101111111110110111,
240'b110110011111111110101011010100010101010101010101010100110101101011000001111111111111111111111111111111111001100001001001011100101111010111111111111111111111111111111111111111111111111111111111111111111111111111111011111011011111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101001001011111110000111111111111111111111111111100111110101010101111101111101011111111111111111111111111111111111111111111111111111111111111111111111111111011111011111111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010010010111011011011011111101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111010111010001111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010100110101011010011010111011001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100100110101011111111110110111,
240'b110110011111111110101011010100010101010001010001010101000101010101010101010101010101010001010001011100011011111011110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100000110001111111111110110111,
240'b110110011111111110101011010100000101111110010100011010100101001101010101010101010101010101010101010100100101010001111011101110011110101111111111111111111111111111111111111111111111111111111111111111111011101001011010110010111111111110110111,
240'b110110011111111110101011010011100110110111101010100001100101000101010101010101010101010101010101010101010101010001010001010100110110100010001010101100101100110011011101111001011110011011010011100101100101100001010100110011001111111110110111,
240'b110110011111111110101011010011100110110111101000100001010101000101010101010101010101010101010101010101010101010101010101010101010101001101010001010100010101010101011110011000110110010001011000010100010101001101010110110011001111111110110111,
240'b110110011111111110101011010011100110110111101000100001010101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010011010100110101001101010100010101010101010001010110110011001111111110110111,
240'b110110011111111110101011010011010110110111101000100001010101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111110101011010100100110110011100111100001010101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111110100111011111011011001011101000100001000101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111110101010011100101111000111111111100000110101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010101110011011111111110110110,
240'b110011101111111111001011010100101000110011010100011110000101000101010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101000101100001111001111111111110110010,
240'b101110011111110111111010101000000101100101010111010110000101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101100110000110111001111111111111010010101101,
240'b110001111101101111111111111111111110001011011001110110101101101011011010110110101101101011011010110110101101101011011010110110101101101011011010110110101101101011011010110110101101101011011010110110011110100011111111111111111100100111010000,
240'b111101001100001011011101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101110011111100000011110010,
240'b111110011111001010111110101100001011111011000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111011101110110000110010011111011011110111,
240'b111011111111010111100010101110011010101110101101101011011010110110101101101011011010111010101110101011101010111010101110101011011010110110101101101011011010110110101110101011101010111010101110101011011010101110111101111001001110110111101011,
240'b111111011101111110111101111000011111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011110110111101101111011011011000101101001101111011110011,
240'b111000001100001111111010111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100101011011111100111,
240'b101110011111000111111111111000001001111010001100100011001000110010001100100011001000110010001100100011001000110010001100100011001000110010001100100011001000110010001100100011001000110010001010100010001010011111101110111111111110001010111000,
240'b110000101111111111100111011011100100110101010000010100000101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000100111001101010100001000101000110000010111110001111110110101101,
240'b110101101111111110110111010100000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100001111111111010111101010111110101111111111110110101,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100011111100101101101101101101110010001111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110010111011001100100110010101111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110110101010101010100110011001111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110110101100001010101110011001111111110110111,
240'b110110011111111110101011010100010101010101010011010100010101000101010001010100000101000101010011010101000101010101010101010101010101010101010101010101010101010101010101010101010100111110100101110110110101100001010101110011001111111110110111,
240'b110110011111111110101011010100000101001001101001100011011001101110011000100011100111110001101000010101110101000101010010010101010101010101010101010101010101010101010101010101010100111110100110110111010101100001010101110011001111111110110111,
240'b110110011111111110101010010100001001001011100100111111111111111111111111111111111111100111101001110010011001110001101100010100110101001001010101010101010101010101010101010101010101000010010111110000110101011101010101110011001111111110110111,
240'b110110011111111110100111100010101111100011111111111111111111111111111111111111111111111111111111111111111111111111101011101100000110110101010001010100110101010101010101010101010101010101011011010111110101010001010110110011001111111110110111,
240'b110110011111111110111010110111001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100010011110010110110101001001010101010101010101010101010100010100110101010001010110110011001111111110110111,
240'b110110011111111111011101111110101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110010000110100101010001010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111111101101111111101111111111111111111111111111111111111111111111111111111111111111111111111111001111101010111011101111111111111111111111111101110001110011010100010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111111101110111111101111111111111111111111111111111111111111111111111111111111111111111111111010011101100110011010111100000011111111111111111111111111100010011100010101000001010101010101010101010001010110110011001111111110110111,
240'b110110011111111111101100111111101111111111111111111111111111111111111111111111111111111111111111111111111001100001001110010100000101111111001101111111111111111111111111110111000110010101010010010101010101010001010110110011001111111110110111,
240'b110110011111111111100111111111101111111111111111111111111111111111111111111111111111111111111111111111111001101001010001010101010100111101101000111000011111111111111111111111111100010101011000010101000101010001010110110011001111111110110111,
240'b110110011111111111011001111101111111111111111111111111111111111111111111111111111111111111111111111111111001101001001111011001110110111101001110110000001111111111111111111111111111111110011101010100000101010001010110110011001111111110110111,
240'b110110011111111111000110111011001111111111111111111111111111111111111111111111111111111111111111111111111001101001001101011110001101011001101101101111011111111111111111111111111111111111101110011011100101000101010110110011001111111110110111,
240'b110110011111111110110011110101111111111111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111101011010110110100011111111111111111111111111111111111111111101110100101000101010110110011001111111110110111,
240'b110110011111111110101001101101011111111111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111001111111111111111111111111111111111111111111101000111000001010010110011001111111110110111,
240'b110110011111111110100110100010001111110111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111010111001010001110011001111111110110111,
240'b110110011111111110101001011000011110010011111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111110001101100000110010101111111110110111,
240'b110110011111111110101011010011101010110111111111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111110110000100110001111111111110110111,
240'b110110011111111110101011010011100111001011101111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111110101110110001101111111110110111,
240'b110110011111111110101011010100010101001010101111111111111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111010001110011001111111110110111,
240'b110110011111111110101011010100010101001001101001111000111111111111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111100111110110001111111110110111,
240'b110110011111111110101011010100010101010101010000100011011111100111111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111110110111000101111111110110111,
240'b110110011111111110101011010100010101010101010100010101011010110011111111111111111111111111111111111111111001101001001101011101011111010111111111111111111111111111111111111111111111111111111111111111111111111111111010111010101111111110110111,
240'b110110011111111110101011010100010101010101010101010100110101101011000001111111111111111111111111111111111001100001001001011100101111010111111111111111111111111111111111111111111111111111111111111111111111111111111011111011011111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101001001011111110000111111111111111111111111111100111110101010101111101111101011111111111111111111111111111111111111111111111111111111111111111111111111111011111011111111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010010010111011011011011111101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111010111010001111111110110111,
240'b110110011111111110101011010100010101010101010101010101010101010101010101010100110101011010011010111011001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100100110101011111111110110111,
240'b110110011111111110101011010100010101010001010001010101000101010101010101010101010101010001010001011100011011111011110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100000110001111111111110110111,
240'b110110011111111110101011010100000101111110010100011010100101001101010101010101010101010101010101010100100101010001111011101110011110101111111111111111111111111111111111111111111111111111111111111111111011101001011010110010111111111110110111,
240'b110110011111111110101011010011100110110111101010100001100101000101010101010101010101010101010101010101010101010001010001010100110110100010001010101100101100110011011101111001011110011011010011100101100101100001010100110011001111111110110111,
240'b110110011111111110101011010011100110110111101000100001010101000101010101010101010101010101010101010101010101010101010101010101010101001101010001010100010101010101011110011000110110010001011000010100010101001101010110110011001111111110110111,
240'b110110011111111110101011010011100110110111101000100001010101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010011010100110101001101010100010101010101010001010110110011001111111110110111,
240'b110110011111111110101011010011010110110111101000100001010101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111110101011010100100110110011100111100001010101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111110100111011111011011001011101000100001000101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010110110011001111111110110111,
240'b110110011111111110101010011100101111000111111111100000110101000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010001010101110011011111111110110110,
240'b110011101111111111001011010100101000110011010100011110000101000101010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101000101100001111001111111111110110010,
240'b101110011111110111111010101000000101100101010111010110000101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101110101011101010111010101100110000110111001111111111111010010101101,
240'b110001111101101111111111111111111110001011011001110110101101101011011010110110101101101011011010110110101101101011011010110110101101101011011010110110101101101011011010110110101101101011011010110110011110100011111111111111111100100111010000,
240'b111101001100001011011101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101110011111100000011110010,
240'b111110011111001010111110101100001011111011000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111011101110110000110010011111011011110111,
    };
    assign data = picture[addr];
endmodule