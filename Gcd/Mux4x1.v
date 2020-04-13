
module Mux4x1(
	input clk,
	input [1:0] sel,
	input [3:0] a_in,
	output y
);

wire w1, w2;

Mux2x1 mux1(.clk(clk), .sel(sel[0]), .a_in(a_in[1:0]), .y(w1));
Mux2x1 mux2(.clk(clk), .sel(sel[0]), .a_in(a_in[3:2]), .y(w2));

Mux2x1 mux3(.clk(clk), .sel(sel[1]), .a_in({w1,w2}), .y(y));

endmodule