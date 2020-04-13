
` timescale 1ns/1ns

module Mux_16x1 #(
	parameter DATA_WIDTH = 16, SEL_WIDTH = 4
)(
	input clk,
	input [DATA_WIDTH-1:0] in,
	input [SEL_WIDTH-1: 0] sel,
	output out
);
	wire [3:0] w;
	
	Mux_4x1 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mux_1(.clk(clk),.sel(sel[1:0]), .in(in[3:0]), .out(w[0])); // Stage-1	
	Mux_4x1 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mux_2(.clk(clk),.sel(sel[1:0]), .in(in[7:4]), .out(w[1])); // Stage-2
	Mux_4x1 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mux_3(.clk(clk),.sel(sel[1:0]), .in(in[11:8]), .out(w[2])); // Stage-3
	Mux_4x1 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mux_4(.clk(clk),.sel(sel[1:0]), .in(in[15:12]), .out(w[3])); // Stage-4

	Mux_4x1 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mux_result(.clk(clk),.sel(sel[3:2]), .in(w), .out(out)); // Stage-4

endmodule

