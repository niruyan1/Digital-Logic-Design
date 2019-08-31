module part4(SW,KEY,HEX0);
	input [2:0] KEY;
	input [17:0] SW;
	output [6:0] HEX0;
	wire [2:0] M;
	part2 mypart2 (SW[17:15],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],KEY[2],KEY[1],KEY[0],M);
	part3 mypart3 (M[0],M[1],M[2],HEX0);
	
endmodule