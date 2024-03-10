module endereco
#(
	parameter ADDR_WIDTH=6 // endereco da instrucao
)
(
	input[ADDR_WIDTH-1:0] desvio_incondicional, desvio_condicional, leitura1,
	input Jr, Jump, Branch, BranchNE,
	input zero,
	input clock,
	output reg[ADDR_WIDTH-1:0] cp
);
	
	initial begin
		cp = 6'b0;
	end
	
	
	always begin @(posedge clock)
		// Caso do branch
		if ((Branch & zero) | (BranchNE & (~(zero))))
			cp = desvio_condicional + cp + 6'b000001;
			
		// Caso do Jump
		else if (Jump)
			cp = desvio_incondicional;
		
		// Caso do Jr
		else if (Jr)
			cp = leitura1;
			
		// Incremento do cp
		else 
			cp = cp + 6'b000001;
	end
	
	//assign end_instrucao = cp;

endmodule
