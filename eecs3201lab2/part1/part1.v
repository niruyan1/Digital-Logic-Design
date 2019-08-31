module part1(SW,KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6);

	input [17:0]SW;
	input[2:0]KEY;
	output[6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6;
	wire [2:0]M0,M1,M2,M3,M4,M5,M6,M7;
	
	mux_3bit_7to1 m0(SW[17:15],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],3'b000,KEY,M0);
	mux_3bit_7to1 m1(SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],3'b000,SW[17:15],KEY,M1);
	mux_3bit_7to1 m2(SW[11:9],SW[8:6],SW[5:3],SW[2:0],3'b000,SW[17:15],SW[14:12],KEY,M2);
	mux_3bit_7to1 m3(SW[8:6],SW[5:3],SW[2:0],3'b000,SW[17:15],SW[14:12],SW[11:9],KEY,M3);
	mux_3bit_7to1 m4(SW[5:3],SW[2:0],3'b000,SW[17:15],SW[14:12],SW[11:9],SW[8:6],KEY,M4);
	mux_3bit_7to1 m5(SW[2:0],3'b000,SW[17:15],SW[14:12],SW[11:9],SW[8:6],SW[5:3],KEY,M5);
	mux_3bit_7to1 m6(3'b000,SW[17:15],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],KEY,M6);
	//mux_3bit_7to1 m7(SW[17:15],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],0'b000,KEY,M7);
	
	char_7seg h0(M0,HEX6);
	char_7seg h1(M1,HEX5);
	char_7seg h2(M2,HEX4);
	char_7seg h3(M3,HEX3);
	char_7seg h4(M4,HEX2);
	char_7seg h5(M5,HEX1);
	char_7seg h6(M6,HEX0);
	

endmodule

///////////////////////////////////////////////////
// a 3-bit wide 2-to-1 MUX
module mux_3bit_2to1(X,Y,s,M);
   input [2:0] X,Y;
   input       s;
   
   output [2:0] M;

   assign M = ({3{~s}} & X) | ({3{s}} & Y);

endmodule // mux_3bit_2to1

// a 3-bit wide 7-to-1 MUX
module mux_3bit_7to1(T,U,V,W,X,Y,Z,S,M);
   input [2:0] T,U,V,W,X,Y,Z,S;
   output [2:0]     M;

   wire [2:0] 	    N1,N2,N3,N4,N5;
      
   mux_3bit_2to1 m0(T,U,S[0],N1);
   mux_3bit_2to1 m1(V,W,S[0],N2);
   mux_3bit_2to1 m2(X,Y,S[0],N3);
   mux_3bit_2to1 m3(N1,N2,S[1],N4);
   mux_3bit_2to1 m4(N3,Z,S[1],N5);
   mux_3bit_2to1 m5(N4,N5,S[2],M);

endmodule // mux_3bit_7to1

////////////////////////////////////////////////
module char_7seg(C,Display);
	input [2:0] C;
	output [6:0] Display;
	wire c0,c1,c2;
	assign c0=C[0];
	assign c1=C[1];
	assign c2=C[2];
	
	assign Display[0]=~c2|(c2&~c1&~c0);
	assign Display[1]=(~c2&c1&~c0)|(c2&~c1&~c0)|(c2&~c1&c0)|(~c2&c1&c0);
	assign Display[2]=(~c2&c1&~c0)|(c2&~c1&~c0)|(c2&~c1&c0);
	assign Display[3]=~c2|(c2&~c1&~c0);
	assign Display[4]=(~c2&~c1&~c0)|(~c2&~c1&c0)|(~c2&c1&c0)|(c2&~c1&~c0);
	assign Display[5]=(~c2&~c1&~c0)|(~c2&~c1&c0)|(c2&~c1&~c0);
	assign Display[6]=~c2;
endmodule
//////////////////////////////////////////////