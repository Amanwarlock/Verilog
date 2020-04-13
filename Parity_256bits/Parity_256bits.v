
module Parity_256bits #(
	parameter WIDTH = 256
)(
	input clk,
	input enable,
	input [WIDTH-1:0] p_in,
	output reg [WIDTH-1:0] parity
);

integer i;
reg p;

always @(clk) begin
	 p = 0;
	for(i = 0; i < WIDTH; i = i+1) begin
		if(enable) p = p ^ p_in[i];
		if(enable) parity <= p;
	end
end

endmodule