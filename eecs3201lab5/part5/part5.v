module D_FF(clk,D,Q,en);
	input clk,en;
	input [7:0]D;
	output reg [7:0]Q=8'd0;
	always@(posedge clk)
	if(en)
		Q<=D;
endmodule

module disp (num,HEX);
	input [3:0]num;
	output [6:0] HEX;
	
	assign HEX[0]=(num[3]|~num[2]|num[1]|num[0])&(num[3]|num[2]|num[1]|~num[0]);
	assign HEX[1]=(num[3]|~num[2]|num[1]|~num[0])&(num[3]|~num[2]|~num[1]|num[0])&(~num[3]|~num[2]|num[1]|num[0])&(~num[3]|~num[2]|~num[1]|num[0])&(~num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[2]=(num[3]|num[2]|~num[1]|num[0])&(~num[3]|~num[2]|num[1]|num[0])&(~num[3]|~num[2]|~num[1]|num[0])&(~num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[3]=(num[3]|num[2]|num[1]|~num[0])&(num[3]|~num[2]|num[1]|num[0])&(num[3]|~num[2]|~num[1]|~num[0])&(~num[3]|num[2]|num[1]|~num[0])&(~num[3]|num[2]|~num[1]|num[0])&(~num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[4]=(num[3]|num[2]|num[1]|~num[0])&(num[3]|num[2]|~num[1]|~num[0])&(num[3]|~num[2]|num[1]|num[0])&(num[3]|~num[2]|num[1]|~num[0])&(num[3]|~num[2]|~num[1]|~num[0])&(~num[3]|num[2]|num[1]|~num[0]);
	assign HEX[5]=(num[3]|num[2]|num[1]|~num[0])&(num[3]|num[2]|~num[1]|num[0])&(num[3]|num[2]|~num[1]|~num[0])&(num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[6]=(num[3]|num[2]|num[1]|num[0])&(num[3]|num[2]|num[1]|~num[0])&(num[3]|~num[2]|~num[1]|~num[0])&(~num[3]|~num[2]|num[1]|num[0])&(~num[3]|~num[2]|num[1]|~num[0]);
endmodule 


module part5(clk,SW,LEDR,HEX3,HEX2,HEX1,HEX0);
	input clk;
	input [9:0]SW;
	output [15:0]LEDR;
	output [6:0]HEX3,HEX2,HEX1,HEX0;
	wire [15:0]out;
	wire [7:0]A,B;
	D_FF df1(clk,SW[7:0],A,SW[8]);
	D_FF df2(clk,SW[7:0],B,SW[9]);
	assign out=A*B;
	assign LEDR=out;
	disp disp1(out[3:0],HEX0);
	disp disp2(out[7:4],HEX1);
	disp disp3(out[11:8],HEX2);
	disp disp4(out[15:12],HEX3);

endmodule 