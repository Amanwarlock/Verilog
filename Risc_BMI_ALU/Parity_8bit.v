module Parity_8bit(
	input clk,
	input [7:0] a,
	output reg[7:0] out
);

reg [7:0] t1,t2,t3,t4;

always @(clk or a) begin
	
	t1 = a[0]^a[1];
	t2 = a[2]^a[3];
	t3 = a[4]^a[5];
	t4 = a[6]^a[7];
	
	out = t1 ^ t2 ^ t3 ^ t4;
	//$monitor($time , "Input = %b, Out = %d", a, out);
end

endmodule
