
module Mux2x1(
	input clk,
	input sel,
	input [1:0] a_in,
	output reg y
);

always @(clk or sel or a_in) begin
	case(sel) 
		0: y = a_in[0];
		1: y = a_in[1];
	endcase
end

endmodule