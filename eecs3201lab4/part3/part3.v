+module mux2to1(a,b,c,s);
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

module qcount(clk,Q,R);
	input clk,R;
	output reg [32:0]Q=0;
	always@(posedge clk, negedge R)
	begin
	if(R==0)
	begin
	Q<=0;
	end
	else
	Q<=Q+1;
	end
endmodule

module enabler(clk,ploadn,rright,Q,qout);
	input clk;
	output reg ploadn,rright=0;
	output [7:0]Q;
	input [17:0]qout;
	reg quot;
	qcount c1(clk,Q,1);
	always @(*)
		begin
		if(|Q)
		begin
		ploadn<=1;
		quot=(Q)%18;

			if(qout==18'b000000000000000001)
			begin
			rright=0;
			end
			else if(qout==18'b100000000000000000)
			begin
			rright=1;
			end
		end
		else
		begin
		ploadn<=0;
		end
		
		
		
	end

endmodule

module clkchange(clko,clkn);
	input clko;
	output reg clkn;
	wire [32:0] qcount;
	reg R=1;
	qcount q1(clko,qcount,R);
	always@(posedge clko)
	begin
	if(qcount==32'd50000000)
	begin
	clkn<=1;
	R<=0;
	end
	else
	begin
	clkn<=0;
	R<=1;
	end
	end

endmodule

module part3(clk,qout);
	input clk;
	output[17:0] qout;
	wire rright,ploadn;
	wire [7:0]Q;
	
	clkchange ck(clk,clkn);
	enabler en(clkn,ploadn,rright,Q,qout);
	circuit1 c1(qout[16],qout[0],rright,1'b0,ploadn,clk,qout[17]);
	circuit1 c2(qout[15],qout[17],rright,1'b0,ploadn,clk,qout[16]);
	circuit1 c3(qout[14],qout[16],rright,1'b0,ploadn,clk,qout[15]);
	circuit1 c4(qout[13],qout[15],rright,1'b0,ploadn,clk,qout[14]);
	circuit1 c5(qout[12],qout[14],rright,1'b0,ploadn,clk,qout[13]);
	circuit1 c6(qout[11],qout[13],rright,1'b0,ploadn,clk,qout[12]);
	circuit1 c7(qout[10],qout[12],rright,1'b0,ploadn,clk,qout[11]);
	circuit1 c8(qout[9],qout[11],rright,1'b0,ploadn,clk,qout[10]);
	circuit1 c9(qout[8],qout[10],rright,1'b0,ploadn,clk,qout[9]);
	circuit1 c10(qout[7],qout[9],rright,1'b0,ploadn,clk,qout[8]);
	circuit1 c11(qout[6],qout[8],rright,1'b0,ploadn,clk,qout[7]);
	circuit1 c12(qout[5],qout[7],rright,1'b0,ploadn,clk,qout[6]);
	circuit1 c13(qout[4],qout[6],rright,1'b0,ploadn,clk,qout[5]);
	circuit1 c14(qout[3],qout[5],rright,1'b0,ploadn,clk,qout[4]);
	circuit1 c15(qout[2],qout[4],rright,1'b0,ploadn,clk,qout[3]);
	circuit1 c16(qout[1],qout[3],rright,1'b0,ploadn,clk,qout[2]);
	circuit1 c17(qout[0],qout[2],rright,1'b0,ploadn,clk,qout[1]);
	circuit1 c18(qout[17],qout[1],rright,1'b1,ploadn,clk,qout[0]);
endmodule

