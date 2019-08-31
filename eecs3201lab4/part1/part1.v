module T_FF(clk,T,Q,R);
	input clk,T,R;
	output reg Q;
	always@(posedge clk,negedge R)
	begin
	if (R==0)
	Q<=1'b0;
	else if(T)
	Q<=!Q;
	end
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

module part1(en,clk,clr,HEX0,HEX1);
	input en,clk,clr;
	output [6:0] HEX0,HEX1;
	wire [7:0] Q;
	wire [6:0] qs;
	
	T_FF t1(~clk,en,Q[0],clr);
	assign qs[0]=en&Q[0];
	
	T_FF t2(~clk,qs[0],Q[1],clr);
	assign qs[1]=qs[0]&Q[1];
	
	T_FF t3(~clk,qs[1],Q[2],clr);
	assign qs[2]=qs[1]&Q[2];
	
	T_FF t4(~clk,qs[2],Q[3],clr);
	assign qs[3]=qs[2]&Q[3];
	
	T_FF t5(~clk,qs[3],Q[4],clr);
	assign qs[4]=qs[3]&Q[4];
	
	T_FF t6(~clk,qs[4],Q[5],clr);
	assign qs[5]=qs[4]&Q[5];
	
	T_FF t7(~clk,qs[5],Q[6],clr);
	assign qs[6]=qs[5]&Q[6];
	
	T_FF t8(~clk,qs[6],Q[7],clr);
	
	disp disp1(Q[7:4],HEX1);
	disp disp0(Q[3:0],HEX0);
	
endmodule 