
module mux_tb();
parameter DATA_WIDTH = 16, SEL_WIDTH=4;

reg [DATA_WIDTH-1:0] a;
reg [SEL_WIDTH-1:0] sel;
wire result;

mux_16x1 #(.DATA_WIDTH(DATA_WIDTH),.SEL_WIDTH(SEL_WIDTH)) mu(.A_in(a), .sel(sel), .out(result));

initial begin
	$monitor($time, " A=%d, A_bin=%b, Sel=%d, Result=%d ", a,a,sel,result);
	#10 a=16'h3f0a; sel=4'd0;
	#10 sel=4'd8;
	#10 $finish;
end

endmodule