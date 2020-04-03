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


genvar i;

wire [15:0] w;

generate for(i = 255; i <= 0; i = i - 16) begin : loop
	Mux16x1 #(.DATA_WIDTH(16),.SEL_WIDTH(4)) mux(.clk(clk),.A_in(a_in[i: i-16]),.sel(shift_in),.out(w));
end

endgenerate



endmodule
