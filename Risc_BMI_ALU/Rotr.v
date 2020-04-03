`timescale 1ns/1ns

module Rotr #(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] a_in,
	input [DATA_WIDTH-1:0] shift_in, // consider only 8-bits
	output [DATA_WIDTH-1:0] a_out
);

genvar i;

Mux256x1 #(.DATA_WIDTH(DATA_WIDTH), .SEL_WIDTH(8)) mux(.clk(clk), .sel(shift_in[7:0]), .a_in(a_in), .y(a_out[0]));

/*generate for (i = 1; i < DATA_WIDTH; i = i + 1 ) begin: loop

	Mux256x1 #(.DATA_WIDTH(DATA_WIDTH), .SEL_WIDTH(8)) mux_1(.clk(clk), .sel(shift_in[7:0]), .a_in({a_in[i-1: 0], a_in[DATA_WIDTH-1:i]}), .y(a_out[i]));

end
endgenerate*/

endmodule
