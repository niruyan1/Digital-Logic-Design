module fadder(A,B,Q,Z);
	input [7:0] A,B;
	input [2:0] Q;
	output [7:0] Z;
	wire [7:0] nums1,nums2;
	assign nums1=A[0]+A[1]+A[2]+A[3]+A[4]+A[5]+A[6]+A[7];
	assign nums2=B[0]+B[1]+B[2]+B[3]+B[4]+B[5]+B[6]+B[7];
	assign Z=(Q==3'b000) ? ~A|B : (Q==3'b001) ? ~A|~B : (Q==3'b010) ? ~A : (Q==3'b011) ? A&B : (Q==3'b100) ? A+B : (Q==3'b101) ? ~(A|B) : (Q==3'b110) ? nums1 :(Q==3'b111) ? nums1+nums2 :8'b00000000;

endmodule 

module disp (num,HEX);
	input [3:0]num;
	output [6:0] HEX;
	
	assign HEX[0]=(num[3]|~num[2]|num[1]|num[0])&(num[3]|num[2]|num[1]|~num[0]);
	assign HEX[1]=(num[3]|num[2]|~num[1]|num[0])&(num[3]|~num[2]|num[1]|~num[0])&(num[3]|~num[2]|~num[1]|num[0])&(~num[3]|~num[2]|num[1]|num[0])&(~num[3]|~num[2]|~num[1]|num[0])&(~num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[2]=(num[3]|num[2]|num[1]|num[0])&(num[3]|num[2]|~num[1]|num[0])&(~num[3]|~num[2]|num[1]|num[0])&(~num[3]|~num[2]|~num[1]|num[0])&(~num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[3]=(num[3]|num[2]|num[1]|~num[0])&(num[3]|~num[2]|num[1]|num[0])&(num[3]|~num[2]|~num[1]|~num[0])&(~num[3]|num[2]|num[1]|~num[0])&(~num[3]|num[2]|~num[1]|num[0])&(~num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[4]=(num[3]|num[2]|num[1]|~num[0])&(num[3]|num[2]|~num[1]|~num[0])&(num[3]|~num[2]|num[1]|num[0])&(num[3]|~num[2]|num[1]|~num[0])&(num[3]|~num[2]|~num[1]|~num[0])&(~num[3]|num[2]|num[1]|~num[0]);
	assign HEX[5]=(num[3]|num[2]|num[1]|~num[0])&(num[3]|num[2]|~num[1]|num[0])&(num[3]|num[2]|~num[1]|~num[0])&(num[3]|~num[2]|~num[1]|~num[0]);
	assign HEX[6]=(num[3]|num[2]|num[1]|num[0])&(num[3]|num[2]|num[1]|~num[0])&(num[3]|~num[2]|~num[1]|~num[0])&(~num[3]|~num[2]|num[1]|num[0])&(~num[3]|~num[2]|num[1]|~num[0]);
endmodule 

module part2(SW,KEY,HEX0,HEX1,HEX2,HEX3);
	input[11:0]SW;
	input KEY;
	output [6:0] HEX0,HEX1,HEX2,HEX3;
	reg [7:0]BIN;
	wire [7:0]ANS;
	disp disp3(SW[7:4],HEX3);
	disp disp2(SW[3:0],HEX2);
	disp disp1(BIN[7:4],HEX1);
	disp disp0(BIN[3:0],HEX0);
	fadder add1(SW[7:0],BIN,SW[10:8],ANS);
	
	always@(posedge KEY,negedge SW[11])
	begin
	if (SW[11]==0)
	BIN<=8'b00000000;
	else
	BIN<=ANS;
	end
endmodule 