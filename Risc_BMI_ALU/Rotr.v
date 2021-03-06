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

//assign a_out = a_in >> shift_in;
  Mux_256x1  mux_1(.clk(clk), .sel(shift_in[7:0]), .a_in(a_in), .out(a_out[0]));
  Mux_256x1  mux_2(.clk(clk), .sel(shift_in[7:0]), .a_in({a_in[0], a_in[DATA_WIDTH-1: 1]}), .out(a_out[1]));

generate for (i = 2; i < DATA_WIDTH; i = i + 1 ) begin: loop

	Mux_256x1 mux_3(.clk(clk), .sel(shift_in[7:0]), .a_in({a_in[i-1: 0], a_in[DATA_WIDTH-1:i]}), .out(a_out[i]));

end
endgenerate

endmodule
