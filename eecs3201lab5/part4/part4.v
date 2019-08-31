module pshift(clk,qout);
	input clk;
	output reg [27:0]qout=28'b1110011111011111011011101101;
	always@(posedge clk)
	begin
	qout[27:21]<=qout[6:0];
	qout[20:14]<=qout[27:21];
	qout[13:7]<=qout[20:14];
	qout[6:0]<=qout[13:7];
	
	end
endmodule	

module clksec(clk,clk1sec);
	input clk;
	output reg clk1sec;
	reg [31:0]counter=0;
	always @(posedge clk)
	begin
		counter<=counter+1;
		if(counter==32'd25000000)
		begin
		clk1sec<=1;
		counter<=0;
		end
		else
		begin
		clk1sec<=0;
		end
	end
endmodule


module part4 (clk,HEX3,HEX2,HEX1,HEX0);
	input clk;
	output [6:0] HEX3,HEX2,HEX1,HEX0;
	wire clk50;
	clksec c1(clk,clk50);
	pshift ps(clk50,{HEX3,HEX2,HEX1,HEX0});
endmodule 