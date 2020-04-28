


module Mux_64x1 (
			input clk,	
			input [63:0] a_in,
			input [5:0] sel,
			output out
		);

	wire [1:0] w;
	wire [3:0] t;
	
	/*
	Mux_32x1 m1(.clk(clk), .sel(sel[4:0]), .a_in(a_in[31:0]), .out(w[0]));
	Mux_32x1 m2(.clk(clk), .sel(sel[4:0]), .a_in(a_in[63:32]), .out(w[1]));
	Mux_32x1 m3(.clk(clk), .sel({4'b00, sel[5]}), .a_in({30'b0, w}), .out(out));
	*/
	
	Mux_16x1 m1(.clk(clk), .sel(sel[3:0]), .a_in(a_in[15:0]), .out(t[0]));
	Mux_16x1 m2(.clk(clk), .sel(sel[3:0]), .a_in(a_in[31:16]), .out(t[1]));
	Mux_16x1 m3(.clk(clk), .sel(sel[3:0]), .a_in(a_in[47:32]), .out(t[2]));
	Mux_16x1 m4(.clk(clk), .sel(sel[3:0]), .a_in(a_in[63:48]), .out(t[3]));

	Mux_16x1 m5(.clk(clk), .sel({2'b0,sel[5:4]}), .a_in({12'b0, t}), .out(out));

endmodule
