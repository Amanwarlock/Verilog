


module Mux_128x1 (
			input [127:0] a_in,
			input [6:0] sel,
			output out
		);

	wire [1:0] w;
	
	Mux_64x1 m1(.sel(sel[5:0]), .a_in(a_in[63:0]), .out(w[0]));
	Mux_64x1 m2(.sel(sel[5:0]), .a_in(a_in[127:64]), .out(w[1]));
	Mux_64x1 m3(.sel({5'b0, sel[6]}), .a_in({62'b0, w}), .out(out));
	

endmodule
