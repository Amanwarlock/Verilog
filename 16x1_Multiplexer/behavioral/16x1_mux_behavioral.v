
/*
## 16:1 Mux Behavioral level implementation
	- input is 16 lines.
	- output is 1 line.
	- select is 4 lines which is given by log2 inputlines

	16bit - 1011_0000_1111_0011
*/


module mux_16x1 #(parameter DATA_WIDTH=16,SEL_WIDTH=4)(
			input [DATA_WIDTH-1:0] a_in,
			input [SEL_WIDTH-1:0] sel,
			output out
		);

	assign out = a_in[sel]; // sel can be 0000 (0th index), 0001 (1 index)...etc

endmodule