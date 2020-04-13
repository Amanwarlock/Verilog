

` timescale 1ns/1ns

module Mux_64x1 #(
	parameter DATA_WIDTH = 64, SEL_WIDTH = 6
)(
	input clk,
	input [DATA_WIDTH-1:0] in,
	input [SEL_WIDTH-1: 0] sel,
	output out
);
	wire [3:0] w;
	
	Mux_16x1 #(.DATA_WIDTH(16),.SEL_WIDTH(4)) mux_1(.clk(clk),.sel(sel[3:0]), .in(in[15:0]), .out(w[0])); // Stage-1	
	Mux_16x1 #(.DATA_WIDTH(16),.SEL_WIDTH(4)) mux_2(.clk(clk),.sel(sel[3:0]), .in(in[31:16]), .out(w[1])); // Stage-2
	Mux_16x1 #(.DATA_WIDTH(16),.SEL_WIDTH(4)) mux_3(.clk(clk),.sel(sel[3:0]), .in(in[47:32]), .out(w[2])); // Stage-3
	Mux_16x1 #(.DATA_WIDTH(16),.SEL_WIDTH(4)) mux_4(.clk(clk),.sel(sel[3:0]), .in(in[63:48]), .out(w[3])); // Stage-4

	Mux_16x1 #(.DATA_WIDTH(16),.SEL_WIDTH(4)) mux_result(.clk(clk),.sel({2'b00,sel[5:4]}), .in(w), .out(out)); // Stage-4

endmodule
