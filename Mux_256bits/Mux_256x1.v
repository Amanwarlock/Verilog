



module Mux_256x1 (
			input clk,
			input [255:0] a_in,
			input [7:0] sel,
			output out
		);

	wire [1:0] w;
	wire [3:0] t;
	
	/*	
	Mux_128x1 m1(.clk(clk), .sel(sel[6:0]), .a_in(a_in[127:0]), .out(w[0]));
	Mux_128x1 m2(.clk(clk), .sel(sel[6:0]), .a_in(a_in[255:128]), .out(w[1]));
	Mux_128x1 m3(.clk(clk), .sel({6'b0, sel[7]}), .a_in({126'b0, w}), .out(out));
	*/
	
	Mux_64x1 m1(.clk(clk), .sel(sel[5:0]), .a_in(a_in[63:0]), .out(t[0]));
	Mux_64x1 m2(.clk(clk), .sel(sel[5:0]), .a_in(a_in[127:64]), .out(t[1]));
	Mux_64x1 m3(.clk(clk), .sel(sel[5:0]), .a_in(a_in[191:128]), .out(t[2]));
	Mux_64x1 m4(.clk(clk), .sel(sel[5:0]), .a_in(a_in[255:192]), .out(t[3]));

	Mux_64x1 m5(.clk(clk), .sel({4'b0, sel[7:6]}), .a_in({60'b0,t}), .out(out));
	

endmodule