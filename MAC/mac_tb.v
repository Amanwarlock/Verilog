module mac_tb();

parameter DATA_WIDTH = 16, ACC_WIDTH = 40, MUL_WIDTH = 32;

reg clk, rst;
reg [DATA_WIDTH-1: 0] a_in, b_in;
wire[MUL_WIDTH-1: 0] mul_out;
wire [ACC_WIDTH-1: 0] acc_out;

MAC #(
	.DATA_WIDTH(DATA_WIDTH),
	.MUL_WIDTH(MUL_WIDTH),
	.ACC_WIDTH(ACC_WIDTH)) 
    mac(
	.clk(clk),
	.rst(rst),
	.A_in(a_in),
	.B_in(b_in),
	.mul_out(mul_out),
	.acc_out(acc_out)
    );

always #20 clk = ~clk;

initial begin
	clk = 0;
	rst = 1'b0; a_in = 16'b0000_0000_0000_0010; b_in = 16'b0000_0000_0000_0010;
	#10
	$display("Clk = %d, RST = %d, A = %d, B = %d, Mul = %d, Acc = %d", clk, rst, a_in, b_in, mul_out, acc_out);
end

endmodule
