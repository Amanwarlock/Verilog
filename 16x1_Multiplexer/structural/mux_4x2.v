
/*
	##. Implementation of 4x2 mux
*/

module mux_4x2 #(parameter DATA_WIDTH=4, SEL_WIDTH=2)(
			input [DATA_WIDTH-1:0] a_in,
			input [SEL_WIDTH-1:0] sel,
			output out
		);

	wire [1:0] t;

	mux_2x1 #(.DATA_WIDTH(2)) mu_1(.a_in(a_in[1:0]), .sel(sel[0]),.out(t[0])); // STAGE-1
	mux_2x1 #(.DATA_WIDTH(2)) mu_2(.a_in(a_in[3:2]), .sel(sel[0]),.out(t[1])); // STAGE-2
	mux_2x1 #(.DATA_WIDTH(2)) mu_3(.a_in(t), .sel(sel[1]),.out(out)); // STAGE-3

endmodule