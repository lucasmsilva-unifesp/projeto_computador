module cpu
(
	input clock,
	input [17:0] switches,
	output [27:0] display,
	output wire OpIn, OpOut, OpHalt, Jal
);

	localparam ADDR_WIDTH = 4'd9;	
	
	wire[31:0] shamt_out;
	wire[31:0] ime_end_out;
	wire[31:0] switches_out;
	wire[31:0] RAM_out;
	
	wire[31:0] leitura1;
	wire[31:0] leitura2;
	
	wire Jr, Jump, Branch, BranchNE, MemparaReg, EscreveMem; 
	wire OrigULA, EscreveReg, OpShamt, OpMov, RegLei2;
	wire[3:0] OpULA;
	
	wire[ADDR_WIDTH:0] cp;
	wire zero;
	
	wire[5:0] mux2_reg; // qual endereco ira para o banco de registrador
	wire[31:0] ULA_out;
	wire[31:0] mux4_BR_escrita;
	wire[31:0] mux3_ULA;
	wire[31:0] instrucao;
	
	assign display = leitura2[27:0];
	
	// extensao de sinal do shamt
	assign shamt_out = {29'b0, instrucao[7:6]};
	
	// extensao de sinal do imediato ou do endereco
	assign ime_end_out = {17'b0, instrucao[13:0]};
													
	// extensao de sinal do switches
	assign switches_out = {13'b0, switches};
	
	// calcula o endereco da proxima instrução
	endereco
	#(
		.ADDR_WIDTH(ADDR_WIDTH)
	)
	endereco
	(
		.desvio_incondicional(instrucao[ADDR_WIDTH-1:0]),
		.desvio_condicional(instrucao[ADDR_WIDTH-1:0]),
		.leitura1(leitura1[ADDR_WIDTH-1:0]), 
		.desvio_jal(instrucao[ADDR_WIDTH-1:0]),
		.Jal(Jal),
		.Jr(Jr), 
		.Jump(Jump), 
		.Branch(Branch), 
		.BranchNE(BranchNE),
		.zero(zero), 
		.clock(clock), 
		.end_instrucao(cp)
	); 
	
	// memoria de instrucoes
	rom
	#(
		.ADDR_WIDTH(ADDR_WIDTH)
	)
	ROM
	(
		.addr(cp), 
		.clk(clock), 
		.q(instrucao)
	);
	
	// unidade de controle
	unidade_controle unidade_controle
	(
		.opcode(instrucao[31:26]), 
		.Jal(Jal),
		.Jr(Jr), 
		.Jump(Jump), 
		.Branch(Branch), 
		.BranchNE(BranchNE),
		.MemparaReg(MemparaReg), 
		.OpULA(OpULA), 
		.EscreveMem(EscreveMem), 
		.OrigULA(OrigULA), 
		.EscreveReg(EscreveReg), 
		.OpShamt(OpShamt), 
		.OpMov(OpMov), 
		.RegLei2(RegLei2),
		.OpIn(OpIn), 
		.OpOut(OpOut), 
		.OpHalt(OpHalt)
	);
	
	// banco de registradores
	banco_registrador banco_registrador
	(
		.end_escrita(instrucao[25:20]), 
		.end_leitura1(instrucao[19:14]), 
		.end_leitura2(mux2_reg), 
		.clock(clock), 
		.dados_escrita(mux4_BR_escrita), 
		.EscreveReg(EscreveReg), 
		.leitura1(leitura1), 
		.leitura2(leitura2)
	);
													
	// unidade logica e aritmetica
	ula ULA
	(
		.ULAop(OpULA), 
		.FuncCode(instrucao[5:0]), 
		.A(leitura1), 
		.B(mux3_ULA), 
		.ULAout(ULA_out), 
		.zero(zero)
	);
			  
	// memoria de dados
	ram RAM
	(
		.data(leitura2), 
		.read_addr(ULA_out[5:0]), 
		.write_addr(ULA_out[5:0]), 
		.we(EscreveMem), 
		.write_clock(clock), 
		.ram_out(RAM_out)
	);
													
	assign mux2_reg = (RegLei2) ? instrucao[25:20] : instrucao[13:8];
	
	// multiplexador para saida do banco de registradores, imediato e shamt
	multiplexador2 mux_ULA
	(
		.A_in(leitura2), 
		.B_in(ime_end_out), 
		.C_in(shamt_out), 
		.Sel_1(OrigULA), 
		.Sel_2(OpShamt), 
		.mux3_out(mux3_ULA)
	);
								  
	multiplexador4 mux_BR_escrita
	(
		.A_in(ULA_out), 
		.B_in(RAM_out), 
		.C_in(leitura1),
		.D_in({25'b0, cp}),
		.E_in(switches_out),
		.Sel_1(MemparaReg), 
		.Sel_2(OpMov),
		.Sel_3(Jal),
		.Sel_4(OpIn),
		.mux5_out(mux4_BR_escrita)
	);
	
endmodule
