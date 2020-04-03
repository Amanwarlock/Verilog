module Mux16x1 #(
	parameter DATA_WIDTH=16, 
	SEL_WIDTH=4
)(
	input clk,	
	input [DATA_WIDTH-1:0] A_in,
	input [SEL_WIDTH-1:0] sel,
	output out
);

	wire [3:0] temp;

	Mux4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_1(.clk(clk),.a_in(A_in[3:0]), .sel(sel[1:0]), .out(temp[0])); // STAGE-1;	
	Mux4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_2(.clk(clk),.a_in(A_in[7:4]), .sel(sel[1:0]), .out(temp[1])); // STAGE-2;
	Mux4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_3(.clk(clk),.a_in(A_in[11:8]), .sel(sel[1:0]), .out(temp[2])); // STAGE-3;
	Mux4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_4(.clk(clk),.a_in(A_in[15:12]), .sel(sel[1:0]), .out(temp[3])); // STAGE-4;
	Mux4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_5(.clk(clk),.a_in(temp), .sel(sel[3:2]), .out(out)); // STAGE-4;

endmodule