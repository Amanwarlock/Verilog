` timescale 1ns/1ns

module Mux_4x1 #(
	parameter DATA_WIDTH = 4, SEL_WIDTH = 2
)(
	input clk,
	input [DATA_WIDTH-1:0] in,
	input [SEL_WIDTH-1: 0] sel,
	output out
);
	wire [1:0] w;
	
	Mux_2x1 #(.DATA_WIDTH(2),.SEL_WIDTH(1)) mux_1(.clk(clk),.sel(sel[0]), .in(in[1:0]), .out(w[0])); // Stage-1	
	Mux_2x1 #(.DATA_WIDTH(2),.SEL_WIDTH(1)) mux_2(.clk(clk),.sel(sel[0]), .in(in[3:2]), .out(w[1])); // Stage-2
	Mux_2x1 #(.DATA_WIDTH(2),.SEL_WIDTH(1)) mux_3(.clk(clk),.sel(sel[1]), .in(w), .out(out)); // Stage-3

endmodule


