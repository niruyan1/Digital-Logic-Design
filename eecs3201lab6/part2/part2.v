  module part2 (SW,KEY,LEDG,LEDR);
	input [1:0]SW;
	input KEY;
	output LEDG;
	output [2:0] LEDR;
	reg [2:0] y,Y;
	parameter [2:0] A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101,G=3'b110,H=3'b111;
	wire w;
	assign w=SW[1];
	assign LEDR=y;
	
	always@(*)
	begin
	
	case(y)
	A:
	if(w)Y=A;
	else Y=B;
	B:
	if(w)Y=F;
	else Y=C;
	C:
	if(w)Y=F;
	else Y=D;
	D:
	if(w)Y=F;
	else Y=E;
	E:
	if(w)Y=F;
	else Y=E;
	F:
	if(w)Y=G;
	else Y=B;
	G:
	if(w)Y=A;
	else Y=H;
	H:
	if(w)Y=F;
	else Y=C;
	default:
	Y=3'bxxx;
	endcase
	end
	
	always@(negedge KEY, negedge SW[0])
	begin
	if(SW[0]==0)
	y<=A;
	else
	y<=Y;	
	end
		assign LEDG=(y==E)|(y==H);
	
endmodule

	wire [13:0] Qs, Rs, Ss, Ts, Us,Vs, Ws, Xs;
	assign Qs=14'b11101110101110;
	assign Rs=14'b10110100000000;
	assign Ss=14'b10101000000000;
	assign Ts=14'b11100000000000;
	assign Us=14'b10101110000000;
	assign Vs=14'b10101011100000;
	assign Ws=14'b10111011100000;
	assign Xs=14'b11101010111000;
