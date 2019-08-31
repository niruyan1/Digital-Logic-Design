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

module symbolshiftreg(right,left,lleft,d,loadn,clk,q);
	input right,left,lleft,d,loadn,clk;
	output q;
	wire w1,w2;
	mux2to1 mux1(right,left,lleft,w1);
	mux2to1 mux2(d,w1,loadn,w2);
	D_FF dff1(clk,w2,q);
endmodule

module symboldowncounter(en, load, loadval, counteriszero, clk);
	input en,load, clk;
	input [1:0]loadval;
	output counteriszero;
	
endmodule

module symboldecodelogic(symcode,morsecode,length);
	input [2:0]symcode;
	output reg[3:0]morsecode
	output reg[1:0]length;
	parameter [2:0] Q=3'b000,R=3'b001,S=3'b010,T=3'b011,U=3'b100,V=3'b101,W=3'b110,X=3'b111;
	always@(*)
	begin
	case(symcode)
	Q:
	morsecode=4'b0010;
	length=2'd3;
	R:
	morsecode=4'b1010;
	length=2'd2;
	S:
	morsecode=4'b1110;
	length=2'd2;
	T:
	morsecode=4'b0000;
	length=2'd0;
	U:
	morsecode=4'b1100;
	length=2'd2;
	V:
	morsecode=4'b1110;
	length=2'd3;
	W:
	morsecode=4'b1000;
	length=2'd2;
	X:
	morsecode=4'b0110;
	length=2'd3;
	endcase
	end
endmodule


module clk50(clk,clkout,rst);
	input clk,rst;
	output reg clkout;
	reg [31:0]counter=0;
	always @(posedge clk or negedge rst)
	begin
		if(~rst)
			counter<=0;
		else
		begin
			counter<=counter+1;
			if(counter==32'd25000000)
			begin
				clkout<=1;
				counter<=0;
			end
			else
			begin
				clkout<=0;
			end
		end
	end
endmodule


module lab7(SW,KEY,LEDR,clk);
	input [2:0] SW;
	input [1:0] KEY;
	input clk;
	output LEDR;
	parameter [2:0] Q=3'b000,R=3'b001,S=3'b010,T=3'b011,U=3'b100,V=3'b101,W=3'b110,X=3'b111;
	wire clk05;
	clk50 clkch(clk,clk05);

endmodule 