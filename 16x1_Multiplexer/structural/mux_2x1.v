
/*
	##. Implementation of 2x1 mux

*/

module mux_2x1 #(parameter DATA_WIDTH=2)(
			input [DATA_WIDTH-1:0] a_in,
			input sel,
			output out
		);

	assign out = a_in[sel];

endmodule