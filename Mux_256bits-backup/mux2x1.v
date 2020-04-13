
module mux2x1(
	input clk,
	input sel,
	input  a_in,
	input  b_in,
	output reg y
);

always @(clk or sel) begin
	case(sel) 
		0: y = a_in;
		1: y = b_in;
	endcase
end

endmodule