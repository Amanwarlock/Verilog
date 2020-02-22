
module MAC #(	parameter DATA_WIDTH = 16, 
		parameter ACC_WIDTH = 40,
		parameter MUL_WIDTH = 32 )
	  (
		input [DATA_WIDTH-1: 0] A_in,
		input [DATA_WIDTH-1: 0] B_in,
		output [MUL_WIDTH-1: 0] mul_out,
		output [ACC_WIDTH-1: 0] acc_out,
		input clk,
		input rst
	  );


Multiplier #(
		.DATA_WIDTH(DATA_WIDTH),
		.MUL_WIDTH(MUL_WIDTH)
	   )mul(
		.clk(clk),
		.rst(rst),
		.A_in(A_in),
		.B_in(B_in),
		.mul_out(mul_out)
	   );

/*Accumulator #(
		.DATA_WIDTH(DATA_WIDTH),
		.ACC_WIDTH(ACC_WIDTH),
		.MUL_WIDTH(MUL_WIDTH)
	     )acc(
		.clk(clk),
		.rst(rst),
		.mul_in(mul_out),
		.acc_in(acc_out),
		.acc_out(acc_out)
		);
*/
endmodule