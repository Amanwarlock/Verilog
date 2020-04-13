
module Mux_256x1_tb();

reg [7:0] sel;
reg [255:0] a_in;
wire y;

Mux_256x1 mu(.sel(sel), .a_in(a_in), .out(y));

initial begin
	$monitor($time, " Select = %b, Input = %b, Result = %b ", sel, a_in, y);
	#5 sel = 8'b000; a_in = 255'b1010_0011;
	#5 sel = 8'b001;
	#5 sel = 8'b010;
	#5 sel = 8'b011;
	#5 sel = 8'b100;
	#5 sel = 8'b101;
	#5 sel = 8'b110;
	#5 sel = 8'b111;
	#5 sel = 8'b1000;
	#5 sel = 8'b1001;
	#5 sel = 8'b1010;
	#5 sel = 8'b1100;
	#5 sel = 8'b1101;
	#5 sel = 8'b1111;
	#5 $finish;
end

endmodule;
