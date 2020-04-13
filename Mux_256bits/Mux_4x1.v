
module Mux_4x1 (
			input [3:0] a_in,
			input [1:0] sel,
			output out
		);

	wire [1:0] w;
	
	Mux_2x1 m1(.sel(sel[0]), .a_in(a_in[1:0]), .out(w[0]));
	Mux_2x1 m2(.sel(sel[0]), .a_in(a_in[3:2]), .out(w[1]));
	Mux_2x1 m3(.sel(sel[1]), .a_in(w), .out(out));
	

endmodule
