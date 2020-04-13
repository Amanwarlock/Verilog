



module Mux_256x1 (
			input [255:0] a_in,
			input [7:0] sel,
			output out
		);

	wire [1:0] w;
	
	Mux_128x1 m1(.sel(sel[6:0]), .a_in(a_in[127:0]), .out(w[0]));
	Mux_128x1 m2(.sel(sel[6:0]), .a_in(a_in[255:128]), .out(w[1]));
	Mux_128x1 m3(.sel({6'b0, sel[7]}), .a_in({126'b0, w}), .out(out));
	

endmodule