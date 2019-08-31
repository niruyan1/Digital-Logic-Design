//3bitto1mux_
module mux3to1(x,y,s,m);
   input [2:0] x,y;
   input s;
   output [2:0] m;

   assign m[0]=(~s&x[0])|(s&y[0]);
	assign m[1]=(~s&x[1])|(s&y[1]);
	assign m[2]=(~s&x[2])|(s&y[2]);

endmodule

///////////////////////////////////////////////////
module part2 (U,V,W,X,Y,Z,s0,s1,s2,M);
	input [2:0] U,V,W,X,Y,Z;
	input s0,s1,s2;
	output [2:0] M;
	//wire [2:0] ss;
	//assign ss={s2,s1,s0};
	//assign M = (ss == 3'b000) ? U : (ss == 3'b001) ? V : (ss == 3'b010) ? W : (ss == 3'b011) ? X : (ss == 3'b100) ? Y : (ss == 3'b101) ? Z : (ss == 3'b110) ? Y : (ss == 3'b111) ? Z : Z;
	
	wire [2:0] m1,m2,m3,m4;
	/*assign m1[0]=(~s0&U[0])|(s0&V[0]);
	assign m1[1]=(~s0&U[1])|(s0&V[1]);
	assign m1[2]=(~s0&U[2])|(s0&V[2]);
	
	assign m2[0]=(~s0&W[0])|(s0&X[0]);
	assign m2[1]=(~s0&W[1])|(s0&X[1]);
	assign m2[2]=(~s0&W[2])|(s0&X[2]);
	
	assign m3[0]=(~s0&Y[0])|(s0&Z[0]);
	assign m3[1]=(~s0&Y[1])|(s0&Z[1]);
	assign m3[2]=(~s0&Y[2])|(s0&Z[2]);
	
	assign m4[0]=(~s1&m1[0])|(s1&m2[0]);
	assign m4[1]=(~s1&m1[1])|(s1&m2[1]);
	assign m4[2]=(~s1&m1[2])|(s1&m2[2]);
	
	assign M[0]=(~s2&m4[0])|(s2&m3[0]);
	assign M[1]=(~s2&m4[1])|(s2&m3[1]);
	assign M[2]=(~s2&m4[2])|(s2&m3[2]);
	*/
	///////////////////////////////////
	mux3to1 mux1(U,V,s0,m1);
	mux3to1 mux2(W,X,s0,m2);
	mux3to1 mux3(Y,Z,s0,m3);
	mux3to1 mux4(m1,m2,s1,m4);
	mux3to1 mux5(m4,m3,s2,M);
		
endmodule