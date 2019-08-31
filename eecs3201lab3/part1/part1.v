module mux2to1(a,b,c,s);
	input a,b,c;
	output s;
	assign s=(~c&a)|(c&b);
endmodule 

module D_FF(clk,D,Q);
	input clk,D;
	output reg Q;
	always@(posedge clk)
		Q<=D;
endmodule

module circuit1(right,left,lleft,d,loadn,clk,q);
	input right,left,lleft,d,loadn,clk;
	output q;
	wire w1,w2;
	mux2to1 mux1(right,left,lleft,w1);
	mux2to1 mux2(d,w1,loadn,w2);
	D_FF dff1(clk,w2,q);
endmodule

module part1(clk,ploadn,rright,datain,qout);
	input clk,ploadn,rright;
	input[7:0]datain;
	output[7:0] qout;
	circuit1 c1(qout[6],qout[0],rright,datain[7],ploadn,clk,qout[7]);
	circuit1 c2(qout[5],qout[7],rright,datain[6],ploadn,clk,qout[6]);
	circuit1 c3(qout[4],qout[6],rright,datain[5],ploadn,clk,qout[5]);
	circuit1 c4(qout[3],qout[5],rright,datain[4],ploadn,clk,qout[4]);
	circuit1 c5(qout[2],qout[4],rright,datain[3],ploadn,clk,qout[3]);
	circuit1 c6(qout[1],qout[3],rright,datain[2],ploadn,clk,qout[2]);
	circuit1 c7(qout[0],qout[2],rright,datain[1],ploadn,clk,qout[1]);
	circuit1 c8(qout[7],qout[1],rright,datain[0],ploadn,clk,qout[0]);
endmodule	
/*
module mainq;
	reg [7:0] datin;
	reg pload,right;
	wire [7:0]q;
	reg clk;
	part1 pqwer1(clk,pload,right,datin,q);
	
	initial
	begin 
	datin=8'b10000000;
	pload=0;
	right=0;
	#5;
	clk=1;
	$monitor("%b %b\n", q,clk);
	#5;
	clk=0;
	pload=1;
	#5;
	clk=1;
	#5;
	clk=0;
	#5;
	clk=1;
	#5;
	clk=0;
	#5;
	clk=1;
	#5;
	clk=1;
	#5;
	clk=0;
	#5;
	clk=1;
	#5;
	clk=0;
	#5;
	clk=1;
	#5;
	clk=1;
	#5;
	clk=0;
	#5;
	clk=1;
	
	$finish;
	end
	
endmodule
*/