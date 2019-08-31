module part3(A,B,Q,Z);
	input [7:0] A,B;
	input [2:0] Q;
	output [7:0] Z;
	wire [7:0] nums1,nums2;
	assign nums1=A[0]+A[1]+A[2]+A[3]+A[4]+A[5]+A[6]+A[7];
	assign nums2=B[0]+B[1]+B[2]+B[3]+B[4]+B[5]+B[6]+B[7];
	assign Z=(Q==3'b000) ? ~A|B : (Q==3'b001) ? ~A|~B : (Q==3'b010) ? ~A : (Q==3'b011) ? A&B : (Q==3'b100) ? A+B : (Q==3'b101) ? ~(A|B) : (Q==3'b110) ? nums1 :(Q==3'b111) ? nums1+nums2 :8'b00000000;

endmodule 
