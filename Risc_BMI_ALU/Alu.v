
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
	output[DATA_WIDTH-1: 0] Alu_out
);

parameter PARITY = 2'b00, ROTR = 2'b01, ROTL = 2'b10, POPCOUNT = 2'b11;

wire [DATA_WIDTH-1:0] result;

reg parity_enable;

reg [DATA_WIDTH-1:0] parity_in;

always @(clk,opcode) begin 
	case(opcode)
		PARITY: begin
			parity_enable = 1'b1;
			parity_in = A_in;
		end
	endcase
end

Parity #(.DATA_WIDTH(DATA_WIDTH)) parity(.clk(clk), .enable(parity_enable), .p_in(parity_in), .p_out(result));

assign Alu_out = result;

endmodule