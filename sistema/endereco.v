module endereco
#(
	parameter ADDR_WIDTH=14 // endereco da instrucao
)
(
	input[ADDR_WIDTH-1:0] desvio_incondicional, desvio_condicional, leitura1, desvio_jal,
	input Jal, Jr, Jump, Branch, BranchNE,
	input zero,
	input clock,
	output [ADDR_WIDTH-1:0] end_instrucao
);
	
	reg [ADDR_WIDTH-1:0] cp;
	 
	initial begin
		cp = 6'b0;
	end
	
	
	always begin @(posedge clock)
		// Caso do branch
		if ((Branch & zero) | (BranchNE & (~(zero))))
			cp <= desvio_condicional + cp + 6'b000001;
			
		// Caso do Jump
		else if (Jump)
			cp <= desvio_incondicional;
		
		// Caso do Jr
		else if (Jr)
			cp <= leitura1;
		
		// Caso do jal
		else if (Jal)
			cp <= desvio_jal;
			
		// Incremento do cp
		else 
			cp <= cp + 6'b000001;
	end
	
	assign end_instrucao = cp;

endmodule
