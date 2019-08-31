module part3 (c0,c1,c2,HEX0);
	input c0,c1,c2;
	output [6:0] HEX0;
	
	assign HEX0[0]=~c2|(c2&~c1&~c0);
	assign HEX0[1]=(~c2&c1&~c0)|(c2&~c1&~c0)|(c2&~c1&c0);
	assign HEX0[2]=(~c2&c1&~c0)|(~c2&c1&c0)|(c2&~c1&~c0)|(c2&~c1&c0);
	assign HEX0[3]=~c2|(c2&~c1&~c0);
	assign HEX0[4]=(~c2&~c1&~c0)|(~c2&~c1&c0)|(~c2&c1&c0)|(c2&~c1&~c0);
	assign HEX0[5]=(~c2&~c1&~c0)|(~c2&~c1&c0)|(c2&~c1&~c0);
	assign HEX0[6]=~c2;
endmodule