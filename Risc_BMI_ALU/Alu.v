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

wire [DATA_WIDTH-1:0] parity_out, popcount_out, rotr_out, rotl_out;

reg parity_enable, popcount_enable, rotl_enable, rotr_enable;

reg [DATA_WIDTH-1:0] result, parity_in, popcount_in, rotl_in, rotr_in;

always @(clk) begin 
	case(opcode)
		PARITY: begin
			parity_enable = 1'b1;
			parity_in = A_in;
		end
		ROTR: begin
			rotr_enable = 1'b1;
			rotr_in = A_in;
		end
		ROTL: begin
			rotl_enable = 1'b1;
			rotl_in = A_in;
		end
		POPCOUNT: begin
			  popcount_enable = 1'b1;
			  popcount_in = A_in;
		end
		
	endcase
end

Parity #(.DATA_WIDTH(DATA_WIDTH)) parity(.clk(clk), .enable(parity_enable), .p_in(parity_in), .p_out(parity_out));
Rotr #(.DATA_WIDTH(DATA_WIDTH)) rotr(.clk(clk), .enable(rotr_enable), .a_in(rotr_in), .shift_in(B_in), .a_out(rotr_out));
Rotl #(.DATA_WIDTH(DATA_WIDTH)) rotl(.clk(clk), .enable(rotl_enable), .a_in(rotl_in), .shift_in(B_in), .a_out(rotl_out));
Popcount #(.DATA_WIDTH(DATA_WIDTH)) popcount(.clk(clk), .enable(popcount_enable), .pop_in(popcount_in), .pop_out(popcount_out));

always @(parity_out,rotr_out,rotl_out,popcount_out) begin
	case(opcode) 
		PARITY: result = parity_out;
		ROTR: result = rotr_out;
		ROTL: result = rotl_out;
		POPCOUNT: result = popcount_out;
	endcase
end

assign Alu_out = result;


endmodule