

` timescale 1ns/1ns

module Mux_16x1_tb();
	parameter DATA_WIDTH = 16, SEL_WIDTH = 4;
	reg clk;
	reg [SEL_WIDTH-1:0] sel;
	reg [DATA_WIDTH-1:0] in;
	wire out;

	Mux_16x1 #(.DATA_WIDTH(DATA_WIDTH), .SEL_WIDTH(SEL_WIDTH)) mux(.clk(clk), .in(in), .sel(sel), .out(out));

	initial begin
		clk = 0;
		$monitor($time , " Select = %b, Input = %b, Result = %b , Wire = %b ", sel, in, out, mux.w);
		#5 sel = 4'b0000; in = 16'b0000_0000_0101_1001;
		#5 sel = 4'b0001;
		#5 sel = 4'b0010;
		#5 sel = 4'b0011;
		#5 sel = 4'b0100;
		#5 sel = 4'b0101;
		#5 sel = 4'b0110;
		#5 sel = 4'b0111;
		#5 sel = 4'b1000;
		#5 sel = 4'b1100;
		#5 $finish;
	end
	
	always #5 clk = ~clk;

endmodule