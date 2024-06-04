module blue_seven(
	input [7:0] addr,
	output [239:0] data
);
parameter [0:149][239:0] picture = {
	240'b111111111111101011011011100111001010011111000001110000111100001111000011110000111100001111000010110000101100001011000010110000101100001111000011110000111100001111000011110000101100001011000011101111111010000010101111111101011111111111111111,
	240'b111111111111000010111010110010011110001011100100111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001001110000011000100110011101111110111111111,
	240'b111111001100000111100000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100111101000011111111,
	240'b110100011101010111111111111101011011111010100100101000111010001110100011101000111010001110100011101000111010001110100011101000111010001110100011101000111010001110100010100111111001111110011110101000011100011111111100111111111100100111010010,
	240'b100110011111100111111100100110000101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000001011000011110100111111101111111011111110111011010110110111111111110100010010011,
	240'b101000111111111111100011010111010101001101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001101110111011011111001011110000111101111100101101110100111101111111000110011101,
	240'b101101011111111111011000010101010101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001101100011111010001010101001110011101111001101100101101000111100011111001010110010,
	240'b101101101111111111011000010101100101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010010101111001011111001001100011110111001011001101000111100011111001010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010000100001011110011101100111010100010100111101100111111100101111001010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010011010111101110000010010110010100000101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101010001010011010100000101000001010000010100000101000101010011010101000101010101010101010101010101010101010101010101010101010101010101010100001011000111001100010101000101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101000001011111100000111001100010010101100010100111101001100110010101010101000001010010010101010101010101010101010101010101010101010101010100010111101111101100011100000100111101100111111100101111001010110011,
	240'b101101101111111111011000010100100111101111010111111111011111111111111111111111111111011111101000110010001001101001101011010100100101001001010101010101010101010101010101010101000101101011001000100100000100111001100111111100101111001010110011,
	240'b101101101111111111010101011100101110100111111111111111111111111111111111111111111111111111111111111111111111111111101100101100100110110101010001010101000101010101010101010101010101010101011110010111010101001001100111111100101111001010110011,
	240'b101101101111111111010110101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110101010011010010101110101001001010101010101010101010101010011010101000101001001100111111100101111001010110011,
	240'b101101101111111111101011111011001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000100110001101010001010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111110111111011111110111111111111111111111111111111111111111111111100101110101111101011111010111110101111101011111010111110101111101100111100101101001101101100010100010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111110111111101111111011111111111111111111111111111111111111111100110110110000101100101011001010110010101100101011001010110010101100011011101101111010011011100011010100101000101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111011111001111110011111111111111111111111111111111111111111100011100100111001010010010011100100110101001101010011010101000001010001011001011110110111111111110100010101111101010011010101010101001001100111111100101111001010110011,
	240'b101101101111111011110001111100011111111111111111111111111111111111111111100101000100111001100010100011011000111110001110100011110111011001010001011001111110110111111111111111111011011001010100010101000101001001100111111100101111001010110011,
	240'b101101101111111111100100111001011111111111111111111111111111111111111111101111000101000001100110111010111111111111111111111111111011100101001110011001111110110111111111111111111111101010001011010100000101001001100111111100101111001010110011,
	240'b101101101111111111011001110100111111111111111111111111111111111111111111111010100110011001001111101110101111111111111111111111111011010101001001011000111110110011111111111111111111111111011111011000010101000001100111111100101111001010110011,
	240'b101101101111111111010100101100011111111111111111111111111111111111111111111111101001000101001011100001011111110011111111111111111110001010111001110000101111100011111111111111111111111111111111101000100100111001100111111100101111001010110011,
	240'b101101101111111111010011100011001111110111111111111111111111111111111111111111111100011101010011010111101110000111111111111111111111111111111111111111111111111111111111111111111111111111111111111000110101111101100101111100101111001010110011,
	240'b101101101111111111010110011001101110100111111111111111111111111111111111111111111111000101101101010011101010111011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111001000001100010111100101111001010110011,
	240'b101101101111111111011000010100111011110011111111111111111111111111111111111111111111111110011100010010110111101111111001111111111111111111111111111111111111111111111111111111111111111111111111111111111100011001100111111100011111001010110011,
	240'b101101101111111111011000010100010111111111111010111111111111111111111111111111111111111111010001010101100101100111010111111111111111111111111111111111111111111111111111111111111111111111111111111111111110101101111100111011111111001010110011,
	240'b101101101111111111011000010101000101011111001101111111111111111111111111111111111111111111110110011101010100110010100011111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110011011111011011111001010110011,
	240'b101101101111111111011000010101100101000010000000111110011111111111111111111111111111111111111111101001110100110001110010111101001111111111111111111111111111111111111111111111111111111111111111111111111111111110111110111011011111001010110011,
	240'b101101101111111111011000010101100101010001010100101110011111111111111111111111111111111111111111110110110101101101010101110011101111111111111111111111111111111111111111111111111111111111111111111111111111111111010111111100001111000110110011,
	240'b101101101111111111011000010101100101010001010010011001101110001011111111111111111111111111111111111110100111111001001011100110001111111111111111111111111111111111111111111111111111111111111111111111111111111111100111111101111111000110110011,
	240'b101101101111111111011000010101100101010001010101010100000111111111110010111111111111111111111111111111111011001001001101011010001110111011111111111111111111111111111111111111111111111111111111111111111111111111110010111110111111000010110011,
	240'b101101101111111111011000010101100101010001010101010101010101000110010010111101111111111111111111111111111110010001100101010110001100011011111111111111111111111111111111111111111111111111111111111111111111111111110111111111101111000010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010001010001100101011111010111111111111111111111110111011101110100111110100111111111111111111111111111111111111111111111111111111111111111111111111111111000111111101111000010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010101010100010100101000011111101000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101000111101101111000010110011,
	240'b101101101111111111011000010101100101010001010100010101000101010101010101010101010101000001110000110010011111111011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111100111011011111001010110011,
	240'b101101101111111111011000010101100101010001011001010101010101010101010101010101010101010101010001010110011001000011011000111111011111111111111111111111111111111111111111111111111111111111111111111111111101111101111001111011111111001010110011,
	240'b101101101111111111011000010101010101001110100100100111010101001001010101010101010101010101010101010101000101000001011101100010101100001011101001111110111111111111111111111111111111111111111111110111100111011001100011111100101111001010110011,
	240'b101101101111111111011000010101100100111110011010111000100101111001010011010101010101010101010101010101010101010101010011010100000101010001100110100000101001100110101101101101111011011010011000011001010100111101100111111100101111001010110011,
	240'b101101101111111111011000010101100101001001100111111010001000010101010000010101010101010101010101010101010101010101010101010101010101010001010011010100000101000001010010010100110101001001010000010100110101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101010001010010110000101011110001010010010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101000001001111100010111110011001100100010100110101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111111010111010111001000101001100000010111011110001010001111010100000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111111010110011001101110111110001101010111101100001011000111010100110101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100110111100101111001010110011,
	240'b101010011111111111011100011010101110111111110010111010101111011011011101010110110101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101000101101110111101101111000110100100,
	240'b100101001111110011110111100010111000011110010011100100111001001110000011010100110101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000100111110100100111111111110101110001110,
	240'b110001001101111011111111111010101001101010000010100000111000001110000100100010001000100110001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001010111011110110111111111101000011000011,
	240'b111110001011111111101110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000001100011111111011,
	240'b111101101110011110111111110111011110111111101111111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011111110111011010010101111001110111011110110,
	240'b111011011111101011110000100111001001000010101011101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101101101010001000100110100101111010011111000111101110,
	240'b111111111111101011011011100111001010011111000001110000111100001111000011110000111100001111000010110000101100001011000010110000101100001111000011110000111100001111000011110000101100001011000011101111111010000010101111111101011111111111111111,
	240'b111111111111000010111010110010011110001011100100111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001001110000011000100110011101111110111111111,
	240'b111111001100000111100000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100111101000011111111,
	240'b110100011101010111111111111101011011111010100100101000111010001110100011101000111010001110100011101000111010001110100011101000111010001110100011101000111010001110100010100111111001111110011110101000011100011111111100111111111100100111010010,
	240'b100110011111100111111100100110000101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000101010001010100010101000001011000011110100111111101111111011111110111011010110110111111111110100010010011,
	240'b101000111111111111100011010111010101001101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001101110111011011111001011110000111101111100101101110100111101111111000110011101,
	240'b101101011111111111011000010101010101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001101100011111010001010101001110011101111001101100101101000111100011111001010110010,
	240'b101101101111111111011000010101100101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010010101111001011111001001100011110111001011001101000111100011111001010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010000100001011110011101100111010100010100111101100111111100101111001010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010011010111101110000010010110010100000101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101010001010011010100000101000001010000010100000101000101010011010101000101010101010101010101010101010101010101010101010101010101010101010100001011000111001100010101000101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101000001011111100000111001100010010101100010100111101001100110010101010101000001010010010101010101010101010101010101010101010101010101010100010111101111101100011100000100111101100111111100101111001010110011,
	240'b101101101111111111011000010100100111101111010111111111011111111111111111111111111111011111101000110010001001101001101011010100100101001001010101010101010101010101010101010101000101101011001000100100000100111001100111111100101111001010110011,
	240'b101101101111111111010101011100101110100111111111111111111111111111111111111111111111111111111111111111111111111111101100101100100110110101010001010101000101010101010101010101010101010101011110010111010101001001100111111100101111001010110011,
	240'b101101101111111111010110101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110101010011010010101110101001001010101010101010101010101010011010101000101001001100111111100101111001010110011,
	240'b101101101111111111101011111011001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000100110001101010001010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111110111111011111110111111111111111111111111111111111111111111111100101110101111101011111010111110101111101011111010111110101111101100111100101101001101101100010100010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111110111111101111111011111111111111111111111111111111111111111100110110110000101100101011001010110010101100101011001010110010101100011011101101111010011011100011010100101000101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111011111001111110011111111111111111111111111111111111111111100011100100111001010010010011100100110101001101010011010101000001010001011001011110110111111111110100010101111101010011010101010101001001100111111100101111001010110011,
	240'b101101101111111011110001111100011111111111111111111111111111111111111111100101000100111001100010100011011000111110001110100011110111011001010001011001111110110111111111111111111011011001010100010101000101001001100111111100101111001010110011,
	240'b101101101111111111100100111001011111111111111111111111111111111111111111101111000101000001100110111010111111111111111111111111111011100101001110011001111110110111111111111111111111101010001011010100000101001001100111111100101111001010110011,
	240'b101101101111111111011001110100111111111111111111111111111111111111111111111010100110011001001111101110101111111111111111111111111011010101001001011000111110110011111111111111111111111111011111011000010101000001100111111100101111001010110011,
	240'b101101101111111111010100101100011111111111111111111111111111111111111111111111101001000101001011100001011111110011111111111111111110001010111001110000101111100011111111111111111111111111111111101000100100111001100111111100101111001010110011,
	240'b101101101111111111010011100011001111110111111111111111111111111111111111111111111100011101010011010111101110000111111111111111111111111111111111111111111111111111111111111111111111111111111111111000110101111101100101111100101111001010110011,
	240'b101101101111111111010110011001101110100111111111111111111111111111111111111111111111000101101101010011101010111011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111001000001100010111100101111001010110011,
	240'b101101101111111111011000010100111011110011111111111111111111111111111111111111111111111110011100010010110111101111111001111111111111111111111111111111111111111111111111111111111111111111111111111111111100011001100111111100011111001010110011,
	240'b101101101111111111011000010100010111111111111010111111111111111111111111111111111111111111010001010101100101100111010111111111111111111111111111111111111111111111111111111111111111111111111111111111111110101101111100111011111111001010110011,
	240'b101101101111111111011000010101000101011111001101111111111111111111111111111111111111111111110110011101010100110010100011111111111111111111111111111111111111111111111111111111111111111111111111111111111111110110011011111011011111001010110011,
	240'b101101101111111111011000010101100101000010000000111110011111111111111111111111111111111111111111101001110100110001110010111101001111111111111111111111111111111111111111111111111111111111111111111111111111111110111110111011011111001010110011,
	240'b101101101111111111011000010101100101010001010100101110011111111111111111111111111111111111111111110110110101101101010101110011101111111111111111111111111111111111111111111111111111111111111111111111111111111111010111111100001111000110110011,
	240'b101101101111111111011000010101100101010001010010011001101110001011111111111111111111111111111111111110100111111001001011100110001111111111111111111111111111111111111111111111111111111111111111111111111111111111100111111101111111000110110011,
	240'b101101101111111111011000010101100101010001010101010100000111111111110010111111111111111111111111111111111011001001001101011010001110111011111111111111111111111111111111111111111111111111111111111111111111111111110010111110111111000010110011,
	240'b101101101111111111011000010101100101010001010101010101010101000110010010111101111111111111111111111111111110010001100101010110001100011011111111111111111111111111111111111111111111111111111111111111111111111111110111111111101111000010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010001010001100101011111010111111111111111111111110111011101110100111110100111111111111111111111111111111111111111111111111111111111111111111111111111111000111111101111000010110011,
	240'b101101101111111111011000010101100101010001010101010101010101010101010100010100101000011111101000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101000111101101111000010110011,
	240'b101101101111111111011000010101100101010001010100010101000101010101010101010101010101000001110000110010011111111011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111100111011011111001010110011,
	240'b101101101111111111011000010101100101010001011001010101010101010101010101010101010101010101010001010110011001000011011000111111011111111111111111111111111111111111111111111111111111111111111111111111111101111101111001111011111111001010110011,
	240'b101101101111111111011000010101010101001110100100100111010101001001010101010101010101010101010101010101000101000001011101100010101100001011101001111110111111111111111111111111111111111111111111110111100111011001100011111100101111001010110011,
	240'b101101101111111111011000010101100100111110011010111000100101111001010011010101010101010101010101010101010101010101010011010100000101010001100110100000101001100110101101101101111011011010011000011001010100111101100111111100101111001010110011,
	240'b101101101111111111011000010101100101001001100111111010001000010101010000010101010101010101010101010101010101010101010101010101010101010001010011010100000101000001010010010100110101001001010000010100110101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101010001010010110000101011110001010010010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111111011000010101100101000001001111100010111110011001100100010100110101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111111010111010111001000101001100000010111011110001010001111010100000101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100111111100101111001010110011,
	240'b101101101111111111010110011001101110111110001101010111101100001011000111010100110101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101001001100110111100101111001010110011,
	240'b101010011111111111011100011010101110111111110010111010101111011011011101010110110101010001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101000101101110111101101111000110100100,
	240'b100101001111110011110111100010111000011110010011100100111001001110000011010100110101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000101000001010000010100000100111110100100111111111110101110001110,
	240'b110001001101111011111111111010101001101010000010100000111000001110000100100010001000100110001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001010111011110110111111111101000011000011,
	240'b111110001011111111101110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000001100011111111011,
	240'b111101101110011110111111110111011110111111101111111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011111110111011010010101111001110111011110110,
	240'b111011011111101011110000100111001001000010101011101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101101101010001000100110100101111010011111000111101110,
	240'b111111111111101011011011100111001010011111000001110000111100001111000011110000111100001111000010110000101100001011000010110000101100001111000011110000111100001111000011110000101100001011000011101111111010000010101111111101011111111111111111,
	240'b111111111111000010111010110010011110001011100100111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001011110010111100101111001001110000011000100110011101111110111111111,
	240'b111111001100000111100000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100111101000011111111,
	240'b110100011101010111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100100111010010,
	240'b100110011111100011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110100010010011,
	240'b101000111111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110011101,
	240'b101101011111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110010,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110111110110011,
	240'b101101101111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000010110011,
	240'b101010011111110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000010100100,
	240'b100101001111101111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110101110001110,
	240'b110001001101111011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111101000011000011,
	240'b111110001011111111101110111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000001100011111111011,
	240'b111101101110011110111111110111011110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110110111010010101111001110111011110110,
	240'b111011011111101011110000100111001001000010101011101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101100101011001010110010101101101010001000100110100101111010011111000111101110,
};
assign data = picture[addr];
endmodule