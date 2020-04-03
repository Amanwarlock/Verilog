module Mux256x1 #(
	parameter DATA_WIDTH = 256, SEL_WIDTH = 8
)(
	input clk,
	input [SEL_WIDTH-1:0] sel,
	input [DATA_WIDTH-1:0] a_in,
	output [DATA_WIDTH-1:0] y
);

wire [15:0] w;

Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_1(.clk(clk), .A_in(a_in[15:0]), .sel(sel[7:4]), .out(w[0]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_2(.clk(clk), .A_in(a_in[31:16]), .sel(sel[7:4]), .out(w[1]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_3(.clk(clk), .A_in(a_in[47:32]), .sel(sel[7:4]), .out(w[2]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_4(.clk(clk), .A_in(a_in[63:48]), .sel(sel[7:4]), .out(w[3]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_5(.clk(clk), .A_in(a_in[79:64]), .sel(sel[7:4]), .out(w[4]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_6(.clk(clk), .A_in(a_in[95:80]), .sel(sel[7:4]), .out(w[5]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_7(.clk(clk), .A_in(a_in[111:96]), .sel(sel[7:4]), .out(w[6]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_8(.clk(clk), .A_in(a_in[127:112]), .sel(sel[7:4]), .out(w[7]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_9(.clk(clk), .A_in(a_in[143:128]), .sel(sel[7:4]), .out(w[8]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_10(.clk(clk), .A_in(a_in[159:144]), .sel(sel[7:4]), .out(w[9]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_11(.clk(clk), .A_in(a_in[175:160]), .sel(sel[7:4]), .out(w[10]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_12(.clk(clk), .A_in(a_in[191:176]), .sel(sel[7:4]), .out(w[11]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_13(.clk(clk), .A_in(a_in[207:192]), .sel(sel[7:4]), .out(w[12]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_14(.clk(clk), .A_in(a_in[223:208]), .sel(sel[7:4]), .out(w[13]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_15(.clk(clk), .A_in(a_in[239:224]), .sel(sel[7:4]), .out(w[14]));
Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_16(.clk(clk), .A_in(a_in[255:240]), .sel(sel[7:4]), .out(w[15]));

Mux16x1 #(.DATA_WIDTH(16), .SEL_WIDTH(4)) mux_17(.clk(clk), .A_in(w), .sel(sel[3:0]), .out(y));

endmodule
