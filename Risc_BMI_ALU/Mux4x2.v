module Mux4x2 #(
	parameter DATA_WIDTH=4, SEL_WIDTH=2
	)(
		input clk,
		input [DATA_WIDTH-1:0] a_in,
		input [SEL_WIDTH-1:0] sel,
		output out
		);

	wire [1:0] t;

	Mux2x1 #(.DATA_WIDTH(2)) mu_1(.clk(clk),.a_in(a_in[1:0]), .sel(sel[0]),.out(t[0])); // STAGE-1
	Mux2x1 #(.DATA_WIDTH(2)) mu_2(.clk(clk),.a_in(a_in[3:2]), .sel(sel[0]),.out(t[1])); // STAGE-2
	Mux2x1 #(.DATA_WIDTH(2)) mu_3(.clk(clk),.a_in(t), .sel(sel[1]),.out(out)); // STAGE-3

endmodule
