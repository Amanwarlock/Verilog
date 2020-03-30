
`timescale 1ns/1ns
/*
	256-bits
*/
module Alu #(
	parameter DATA_WIDTH = 256
)(
	input clk,
	input [1:0] opcode,
	input [DATA_WIDTH-1: 0] A_in,
	input [DATA_WIDTH-1: 0] B_in,
	input [DATA_WIDTH-1: 0] Alu_out
);

endmodule