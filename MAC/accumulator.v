
module Accumulator #(
			parameter DATA_WIDTH = 16,
			parameter ACC_WIDTH = 40,
			parameter MUL_WIDTH =32
		     )
		    (
			input clk,
			input rst,
			input [ACC_WIDTH-1:0] acc_in,
			input [MUL_WIDTH-1:0] mul_in,
			output [ACC_WIDTH-1:0] acc_out
		    );

reg [ACC_WIDTH-1:0] acc_input;
reg [ACC_WIDTH-1:0] acc_result;

assign acc_out = acc_result;

always@(posedge clk) begin
	
	case(rst)
		0: acc_input = acc_in;
		1: acc_input = 0;
		default: acc_input = acc_in;
	endcase
	
	acc_result <= acc_input + mul_in;
	
	$display("ACC UNIT ----- : CLK = %d, ACC = %d, MUL = %d, ACC Res = %d",clk,acc_input, mul_in, acc_result );

end


endmodule