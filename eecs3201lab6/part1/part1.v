module D_FF(clk,D,Q);
	input clk,D;
	output reg Q;
	always@(posedge clk)
		Q<=D;
endmodule

module part1 (SW,KEY,LEDG,LEDR);
	input [1:0]SW;
	input KEY;
	output LEDG;
	output [7:0] LEDR;
	wire [7:0] Y;
	
	D_FF d1(~KEY,LEDR[0],Y[0]);
	D_FF d2(~KEY,LEDR[1],Y[1]);
	D_FF d3(~KEY,LEDR[2],Y[2]);
	D_FF d4(~KEY,LEDR[3],Y[3]);
	D_FF d5(~KEY,LEDR[4],Y[4]);
	D_FF d6(~KEY,LEDR[5],Y[5]);
	D_FF d7(~KEY,LEDR[6],Y[6]);
	D_FF d8(~KEY,LEDR[7],Y[7]);
	
	
	assign LEDR[0]=((Y[0]&SW[1])|(Y[6]&SW[1]))|(~SW[0]);
	assign LEDR[1]=((Y[0]&~SW[1])|(Y[5]&~SW[1]))&SW[0];
	assign LEDR[2]=((Y[1]&~SW[1])|(Y[7]&~SW[1]))&SW[0];
	assign LEDR[3]=((Y[2]&~SW[1]))&SW[0];
	assign LEDR[4]=((Y[3]&~SW[1])|(Y[4]&~SW[1]))&SW[0];
	assign LEDR[5]=((Y[1]&SW[1])|(Y[2]&SW[1])|(Y[3]&SW[1])|(Y[4]&SW[1])|(Y[7]&SW[1]))&SW[0];
	assign LEDR[6]=((Y[5]&SW[1]))&SW[0];
	assign LEDR[7]=((Y[6]&~SW[1]))&SW[0];

	assign LEDG=Y[4]|Y[7];

endmodule 