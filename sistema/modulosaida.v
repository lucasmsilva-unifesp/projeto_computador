module modulosaida (entrada, saida1, saida2, saida3, saida4, saida5);

	input [31:0] entrada;
	output [6:0] saida1, saida2, saida3, saida4, saida5;
	reg [31:0] n1,  n2, n3, n4, n5;
	reg [31:0] temp;
	
initial begin

	n1 = 32'd15;
	n2 = 32'd15;
	n3 = 32'd15;
	n4 = 32'd15;
	n5 = 32'd15;

end
	
always @(*) begin
	temp = entrada;
		
		if(temp >= 32'b00000111111111111111111111111111) begin
			n1 <= 32'd14;
			n2 <= 32'd14;
			n3 <= 32'd14;
			n4 <= 32'd14;
			n5 <= 32'd14;
		end
		else begin
			n1  <= temp % 32'd10;
			temp = temp / 32'd10;
			n2  <= temp % 32'd10;
			temp = temp / 32'd10;
			n3  <= temp % 32'd10;
			temp = temp / 32'd10;
			n4  <= temp % 32'd10;
			temp = temp / 32'd10;
			n5  <= temp % 32'd10;
		end
end

displayss display1(n1[3:0], saida1);
displayss display2(n2[3:0], saida2);
displayss display3(n3[3:0], saida3);
displayss display4(n4[3:0], saida4);
displayss display5(n5[3:0], saida5);

endmodule
