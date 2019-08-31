module mux2to1(a,b,c,s);
	input a,b,c;
	output s;
	assign s=(~c&a)|(c&b);
endmodule 

module fulladder(a,b,ci,s,co);
	input a,b,ci;
	output s,co;
	wire x1;
	assign x1=a^b;
	assign s=ci^x1;
	mux2to1 mux1(b,ci,x1,co);
endmodule

module part2(SW,LEDG,LEDR);
	input [8:0]SW;
	output [8:0]LEDR;
	output [4:0]LEDG;
	
	wire [2:0] couts;
	assign LEDR=SW;
	
	fulladder adder1(SW[4],SW[0],SW[8],LEDG[0],couts[0]);
	fulladder adder2(SW[5],SW[1],couts[0],LEDG[1],couts[1]);
	fulladder adder3(SW[6],SW[2],couts[1],LEDG[2],couts[2]);
	fulladder adder4(SW[7],SW[3],couts[2],LEDG[3],LEDG[4]);
	

endmodule
 