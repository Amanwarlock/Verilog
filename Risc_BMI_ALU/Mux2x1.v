module Mux2x1 #(
	parameter DATA_WIDTH=2
)(
	input clk,
	input [DATA_WIDTH-1:0] a_in,
	input sel,
	output out
);
	wire t1,t2,t3;
	//assign out = a_in[sel];
	//always @(clk) begin
		not g1(t1,sel);
		and g2(t2,a_in[0],t1);
		and g3(t3,a_in[1],sel);
		or g4(out,t2,t3);
	//end

endmodule
