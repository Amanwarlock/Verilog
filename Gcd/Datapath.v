
module Datapath #(
	parameter WIDTH = 4
)(
	input clk,
	input clr,
	input x_load,
	input y_load,
	input x_select,
	input y_select,
	input [WIDTH-1:0] x,
	input [WIDTH-1:0] y,
	output eq,
	output lt
);

wire [WIDTH-1:0] x_minus_y, y_minus_x;

reg xld, yld;

wire x_temp, y_temp;

reg [WIDTH-1:0] x_reg, y_reg;

Mux8x1 mux_x(.clk(clk), .sel(x_select), .a_in({x,x_minus_y}),.y(x_temp));
Mux8x1 mux_y(.clk(clk), .sel(y_select), .a_in({y,y_minus_x}),.y(y_temp));

always @(x_select, y_select ) begin
	if(x_load) x_reg = x_temp;
	if(y_load) y_reg = y_temp;
end

twoN_bitcomparator comp#(.N(4))();

endmodule