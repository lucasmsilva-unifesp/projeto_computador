module modulosaida (entrada, saida1, saida2, saida3, saida4, saida5);

	input [31:0] entrada;
	output [6:0] saida1, saida2, saida3, saida4, saida5;
	wire [31:0] n1, n2, n3, n4, n5;
	
	wire display;
	
	assign display  = entrada > 99999;
	
	assign n1 = display ? 4'd15 : (entrada % 10);
	assign n2 = display ? 4'd15 : ((entrada / 10) % 10);
	assign n3 = display ? 4'd15 : ((entrada / 100) % 10);
	assign n4 = display ? 4'd15 : ((entrada / 1000) % 10);
	assign n5 = display ? 4'd15 : ((entrada / 10000) % 10);

	displayss display1(.bcd(n1[3:0]), .seg(saida1));
	displayss display2(.bcd(n2[3:0]), .seg(saida2));
	displayss display3(.bcd(n3[3:0]), .seg(saida3));
	displayss display4(.bcd(n4[3:0]), .seg(saida4));
	displayss display5(.bcd(n5[3:0]), .seg(saida5));

endmodule
