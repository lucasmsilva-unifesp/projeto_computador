module CPU
#(
	parameter ADDR_WIDTH=6 // endereco da instrucao
)
(
	input clock,
	input [17:0] switches,
	output [27:0] display,
	output wire OpIn, OpOut, OpHalt
);

	
	
	wire[31:0] shamt_out;
	wire[31:0] ime_end_out;
	wire[31:0] switches_out;
	wire[31:0] leitura1;
	wire[31:0] leitura2;
	wire Jr, Jump, Branch, BranchNE, MemparaReg, EscreveMem; 
	wire OrigULA, EscreveReg, OpShamt, OpMov, RegLei2;
	wire[3:0] OpULA;
	wire[ADDR_WIDTH:0] cp;
	wire zero;
	wire[31:0] RAM_out;
	wire[5:0] mux2_reg;
	wire[31:0] ULA_out;
	wire[31:0] mux3_BR;
	wire[31:0] mux3_ULA;
	wire[31:0] instrucao;
	
	assign display = leitura2[27:0];

	// calcula o endereco da proxima instrução
	endereco endereco(instrucao[ADDR_WIDTH:0], 
							//ime_end_out, // endereco de extensao
							instrucao[ADDR_WIDTH:0],
							leitura1[ADDR_WIDTH:0], 
							Jr, 
							Jump, 
							Branch, 
							BranchNE,
							zero, 
							clock, 
							cp); 
	
	// memoria de instrucoes
	ROM ROM(cp, 
			  clock, 
			  instrucao);
	
	// extensao de sinal do shamt
	assign shamt_out = {29'b0, instrucao[7:6]};
	
	// extensao de sinal do funct
	assign ime_end_out = {17'b0, instrucao[13:0]};
													
	// extensao de sinal do switches
	assign switches_out = {13'b0, switches};
	
	// unidade de controle
	unidade_controle unidade_controle(instrucao[31:26], 
												 Jr, 
												 Jump, 
												 Branch, 
												 BranchNE,
												 MemparaReg, 
												 OpULA, 
												 EscreveMem, 
												 OrigULA, 
												 EscreveReg, 
												 OpShamt, 
												 OpMov, 
												 RegLei2,
												 OpIn, 
												 OpOut, 
												 OpHalt);
	
	// banco de registradores
	banco_registrador banco_registrador(instrucao[25:20], 
												   instrucao[19:14], 
												   mux2_reg, 
												   clock, 
													mux3_BR, 
													EscreveReg, 
													leitura1, 
													leitura2);
	
	// unidade logica e aritmetica
	ULA ULA(OpULA, 
			  instrucao[5:0], 
			  leitura1, 
			  mux3_ULA, 
			  ULA_out, 
			  zero);
	
	// memoria de dados
	RAM RAM(leitura2, 
			  ULA_out[5:0], 
			  ULA_out[5:0], 
			  EscreveMem, 
			  clock, 
			  RAM_out);
	
	// multiplexador para endereço do rd ou rt
	multiplexador1 mux_reg(instrucao[13:8], 
								  instrucao[25:20], 
								  RegLei2, 
								  mux2_reg);
	
	// multiplexador para saida do banco de registradores, imediato e shamt
	multiplexador2 mux_ULA(leitura2, 
								  ime_end_out, 
								  shamt_out, 
								  OrigULA, 
								  OpShamt, 
								  mux3_ULA);
	
	// multiplexador para a saida da ula, saida da memoria, leitura1 e switches
	multiplexador3 mux_BR(ULA_out, 
								 RAM_out, 
								 leitura1,
								 switches_out,
								 MemparaReg, 
								 OpMov, 
								 OpIn,
								 mux3_BR);
	
endmodule
