module Bitreverse #(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1: 0] a_in,
	output [DATA_WIDTH-1: 0] a_rev
);

genvar j;
parameter WIDTH = DATA_WIDTH - 1;

generate for(j = 0; j < DATA_WIDTH; j = j + 1) begin: loop
	assign a_rev[WIDTH-j] = a_in[j];
end
endgenerate


endmodule
