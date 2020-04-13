
module Mux8x1(
	input clk,
	input sel,
	input [7:0] a,
	output reg [3:0] y
);

	wire [1:0] w;

	always @(sel) begin
		case(sel)
			0: y = a[3:0];
			1: y = a[7:4];
		endcase
	end

endmodule