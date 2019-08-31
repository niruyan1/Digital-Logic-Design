module qcount(clk,T,Q,R);
	input clk,T,R;
	output reg [7:0]Q;
	always@(posedge clk,negedge R)
	begin
	if (R==0)
	Q<=1'b0;
	else if(T)
	Q<=Q+1;
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

module part2(en,clk,clr,HEX0,HEX1);
	input en,clk,clr;
	output [6:0] HEX0,HEX1;
	wire [7:0] Q;
	
	qcount qcnt1(clk,en,Q,clr);
	
	disp disp1(Q[7:4],HEX1);
	disp disp0(Q[3:0],HEX0);
	
endmodule 