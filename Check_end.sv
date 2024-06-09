module Check_end(
	input [9:0] x_cnt,
	input [9:0] y_cnt,
	input [9:0] x_pin,
	input [9:0] y_pin,
	output [7:0] r_data,
	output [7:0] g_data,
	output [7:0] b_data,
    input [7:0] bg_r_pixel,
    input [7:0] bg_g_pixel,
    input [7:0] bg_b_pixel
);
localparam X_WIDTH = 300;
localparam Y_WIDTH = 100;
localparam [0:99][299:0] picture = {
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000110000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000011111111111111000000000000000000000000010000000000000000001000000000000000000001110000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000011000000000000000000000001100000000000000111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000100000000000010010000000000000000100100000000000000000000000001100000000000011111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000001000000000000110000000000010010000000000000000000010000000000000000000000000010000000000011111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000001000000000000101000000000010010000000000000000000001000000000000000000000000001000000000011111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000001000000000000100100000000100010000000000000001000001000000000000000000000000001000000000001111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000001000000000000100010000001000010000000000000010000000100000000000000000000000000100000000001111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000001000000000000100001100011000010000000000000010000000100000000000000000000000000010000000001111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000111000001000000000000100000000000000010000000000011110000000010000000000000000000000000010000000000111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000001000111001000000000000010000000000000010000000000001001111100010000000000000000000000000001000000000111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000001010000000000000010000000000000010000000000001000000010010000000000000000000000000001000000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000010000000000000010000000000000010000000000010000000000001000000000000000000000000000100000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000010000000000000010000000000000010000000000010000000000001000000000000000000000000000100000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000010000000000000010000000000000010000000000100000000000000100000000000000000000000000010000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000001000000010000100000000000000010000000000100000000000000100000111000000000000000000010000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000001000000010000100000000000000010000000000100000000000000100000100110000000000000000010000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000001000000001000100000000000000010000000000100000000000000100001000001100000000000000010000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000001100000001000100000000000000010000000000100000000000000010001000010010000000000000010000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000011111111111000000000101000000000000000010000000000000000000000000010001000010001000000000000010000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000000000000000001000001000111000000000010000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000010000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000010000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000011000000000001100000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000110000000110000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000001110011000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000001000010000010000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000001000001100100000000000000001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000100000010100000000000000000000001111000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000100000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000010000000100000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000001000001000000000000000000000000100000000100000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000111001000000000000000000000000100000000100000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000111000000000011100000000000100000000010000000000000000011111100000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000001111000000000000011110000000100000000010000000000000000010000011000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000111110001000000000000000001000000100000000010000000010000000100000000110000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000001000000001000000000000000000000000100000000001000000010000001000000000010000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000011111111000000000000000000000000000000000001000000000001000000010000001000000000010000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000010000000000000001000000000000100000010000000100000000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000001000000000000001000000000000100000010000000010000000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000111100000000001000000000000000000001000000010000000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000011000000001000000000000000000001000000001000000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000001000000000000010000010000000001000000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000111100000000000000001000010000000000010000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000011100000000000001000100000000000010000001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000000000001100001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000011100000000000000010001000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000011100001000000000001101100000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000010010000100000000000100010000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000010001000010000000000100010000000110000000100000000000001000000001100000001000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000001001000001000000001000010000011001100000010000000000000100000000100000011100000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000101000000100000001100001000010001100001111000000000000110000000010000010010001000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000011000000010000000100001000010001000010000111000000000010000000010000010001000100010001111001000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000001000000001000000110001000010001000010000000000000011110000011100000001000100011100001000101000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000001110000001000000101101000010001000010000000000000010000000010000000000110100001100000100010000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000001001000001000000100010000000000100001000000000000001000000010000000000001100000100000100010000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000001000001110000000000000000000000100001000000000000001000000010000000001000100000100000010010000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000110000000000000000000000000000000100000100000000000000100000011000000000111010000100000001010000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000011000000000000000000000000000000000100000010000000000000000000000000000000000000000000000001001000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000100000001100000000000000000000000000000000000000000000000001000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000011111111111111100000000000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000011111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111100000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111,
300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
};
always_comb begin
	if((x_pin <= x_cnt && x_cnt <= x_pin + X_WIDTH) && (y_pin <= y_cnt && y_cnt <= y_pin + Y_WIDTH)) begin
        if(picture[(y_cnt - y_pin)][((x_cnt - x_pin))] == 0) begin
            r_data = 8'b00000000;
            g_data = 8'b00000000;
            b_data = 8'b00000000;
        end
        else begin
            r_data = bg_r_pixel;
            g_data = bg_g_pixel;
            b_data = bg_b_pixel;
        end
	end
	else begin
		r_data = bg_r_pixel;
        g_data = bg_g_pixel;
        b_data = bg_b_pixel;
	end
end
endmodule