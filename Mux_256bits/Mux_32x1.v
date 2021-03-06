

module Mux_32x1 (
			input clk,	
			input [31:0] a_in,
			input [4:0] sel,
			output out
		);

	wire [1:0] w;
	
	Mux_16x1 m1(.clk(clk), .sel(sel[3:0]), .a_in(a_in[15:0]), .out(w[0]));
	Mux_16x1 m2(.clk(clk), .sel(sel[3:0]), .a_in(a_in[31:16]), .out(w[1]));
	Mux_16x1 m3(.clk(clk), .sel({3'b0, sel[4]}), .a_in({14'b0, w}), .out(out));
	

endmodule
