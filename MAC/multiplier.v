
module Multiplier #(
			parameter DATA_WIDTH = 16,
			parameter MUL_WIDTH = 32
		  )(
			input clk,
			input rst,
			input [DATA_WIDTH-1: 0] A_in,
			input [DATA_WIDTH-1: 0] B_in,
			output [MUL_WIDTH-1: 0] mul_out
		  );

reg [MUL_WIDTH-1: 0] mul_result;

always@(posedge clk) begin
	mul_result = A_in * B_in;
	$display("MUL UNIT ----- : CLK = %d, A = %d, B = %d, MUL Res = %d",clk,A_in, B_in, mul_result );
end

assign mul_out = mul_result;

endmodule