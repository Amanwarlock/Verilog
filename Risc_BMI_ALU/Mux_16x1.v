

module Mux_16x1 (
			input clk,			
			input [15:0] a_in,
			input [3:0] sel,
			output out
		);

	wire [1:0] w;
	wire [3:0] t;
	
	/*
	Mux_8x1 m1(.clk(clk), .sel(sel[2:0]), .a_in(a_in[7:0]), .out(w[0]));
	Mux_8x1 m2(.clk(clk), .sel(sel[2:0]), .a_in(a_in[15:8]), .out(w[1]));
	Mux_8x1 m3(.clk(clk), .sel({2'b00, sel[3]}), .a_in({6'b0, w}), .out(out));
	*/
	Mux_4x1 m1(.clk(clk), .sel(sel[1:0]), .a_in(a_in[3:0]), .out(t[0]));
	Mux_4x1 m2(.clk(clk), .sel(sel[1:0]), .a_in(a_in[7:4]), .out(t[1]));
	Mux_4x1 m3(.clk(clk), .sel(sel[1:0]), .a_in(a_in[11:8]), .out(t[2]));
	Mux_4x1 m4(.clk(clk), .sel(sel[1:0]), .a_in(a_in[15:12]), .out(t[3]));

	Mux_4x1 m5(.clk(clk), .sel(sel[3:2]), .a_in(t), .out(out));

endmodule
