module Mux256x1 #(
	parameter DATA_WIDTH = 256, SEL_WIDTH = 8
)(
	input clk,
	input enable,
	input [SEL_WIDTH-1:0] sel,
	input [DATA_WIDTH-1:0] a_in,
	output reg y
);

always @(clk,sel,a_in) begin
	if(enable === 1'b1) begin
		y = a_in[sel];
	end
	
end


endmodule
