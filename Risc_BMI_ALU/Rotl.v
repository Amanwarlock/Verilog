`timescale 1ns/1ns

module Rotl #(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input enable,
	input [DATA_WIDTH-1:0] a_in,
	input [DATA_WIDTH-1:0] shift_in,
	output [DATA_WIDTH-1:0] a_out
);

parameter WIDTH = DATA_WIDTH - 1;


genvar i;

Mux256x1 #(.DATA_WIDTH(DATA_WIDTH), .SEL_WIDTH(8)) mux_1(.clk(clk), .enable(enable), .sel(WIDTH - shift_in[7:0]), .a_in(a_in), .y(a_out[DATA_WIDTH-1]));
Mux256x1 #(.DATA_WIDTH(DATA_WIDTH), .SEL_WIDTH(8)) mux_2(.clk(clk), .enable(enable), .sel(WIDTH - shift_in[7:0]), .a_in({a_in[DATA_WIDTH-2:0],a_in[DATA_WIDTH-1]}), .y(a_out[DATA_WIDTH-2]));


generate for(i = 3; i <= DATA_WIDTH; i = i + 1) begin : loop
	
	Mux256x1 #(.DATA_WIDTH(DATA_WIDTH), .SEL_WIDTH(8)) mux_3(.clk(clk), .enable(enable), .sel(WIDTH - shift_in[7:0]), .a_in({a_in[DATA_WIDTH-i:0],a_in[DATA_WIDTH-1: DATA_WIDTH-i+1]}), .y(a_out[DATA_WIDTH-i]));

end

endgenerate


endmodule
