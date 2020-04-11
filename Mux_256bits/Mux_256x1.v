

` timescale 1ns/1ns

module Mux_256x1 #(
	parameter DATA_WIDTH = 256, SEL_WIDTH = 8
)(
	input clk,
	input [DATA_WIDTH-1:0] in,
	input [SEL_WIDTH-1: 0] sel,
	output out
);
	wire [3:0] w;
	
	
	Mux_64x1 #(.DATA_WIDTH(64),.SEL_WIDTH(6)) mux_1(.clk(clk),.sel(sel[5:0]), .in(in[63:0]), .out(w[0])); // Stage-1	
	Mux_64x1 #(.DATA_WIDTH(64),.SEL_WIDTH(6)) mux_2(.clk(clk),.sel(sel[5:0]), .in(in[127:64]), .out(w[1])); // Stage-2
	Mux_64x1 #(.DATA_WIDTH(64),.SEL_WIDTH(6)) mux_3(.clk(clk),.sel(sel[5:0]), .in(in[191:128]), .out(w[2])); // Stage-3
	Mux_64x1 #(.DATA_WIDTH(64),.SEL_WIDTH(6)) mux_4(.clk(clk),.sel(sel[5:0]), .in(in[255:192]), .out(w[3])); // Stage-4

	Mux_64x1 #(.DATA_WIDTH(64),.SEL_WIDTH(6)) mux_result(.clk(clk),.sel({2'b0000,sel[7:6]}), .in({{60{1'b0}},w}), .out(out)); // Stage-4
	
	
	//assign out = in[sel];

endmodule