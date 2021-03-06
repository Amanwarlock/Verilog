/*
@source : https://www.youtube.com/watch?v=uLqIHN-0Kao&list=PLJ5C_6qdAvBELELTSPgzYkQg3HgclQh-5&index=10

##. Structural level implementation of 16x1 mux;
	- It can be implemented by breaking the design into 5 4x2 mux

*/

module mux_16x1 #(parameter DATA_WIDTH=16, SEL_WIDTH=4)(
			input [DATA_WIDTH-1:0] A_in,
			input [SEL_WIDTH-1:0] sel,
			output out
		);

	wire [3:0] temp;

	mux_4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_1(.a_in(A_in[3:0]), .sel(sel[1:0]), .out(temp[0])); // STAGE-1;	
	mux_4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_2(.a_in(A_in[7:4]), .sel(sel[1:0]), .out(temp[1])); // STAGE-2;
	mux_4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_3(.a_in(A_in[11:8]), .sel(sel[1:0]), .out(temp[2])); // STAGE-3;
	mux_4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_4(.a_in(A_in[15:12]), .sel(sel[1:0]), .out(temp[3])); // STAGE-4;
	mux_4x2 #(.DATA_WIDTH(4),.SEL_WIDTH(2)) mu_5(.a_in(temp), .sel(sel[3:2]), .out(out)); // STAGE-4;

endmodule