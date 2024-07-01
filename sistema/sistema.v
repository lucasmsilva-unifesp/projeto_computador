module sistema
(
	input clock,
	input button_in,
	input [17:0] switches,
	output wire [6:0] HEX5,
	output wire [6:0] HEX4,
	output wire [6:0] HEX3,
	output wire [6:0] HEX2,
	output wire [6:0] HEX1,
	output [3:0] LEDG
);
	
	wire OpIn, OpOut, OpHalt, Jal; // Operacoes
	wire sel_clock, clock_uso, clock_slow; // selecao de clock, clock de destino, clock com divisor de frequencia
	
	wire button_deBounce;
	
	wire [31:0] display_dados;
	wire [27:0] dados;
	
	assign LEDG[0] = (OpIn | Jal);
	assign LEDG[1] = OpOut;
	assign LEDG[2] = OpHalt;
	assign LEDG[3] = clock_slow;
	
	assign sel_clock = ((~(OpIn | OpOut) | button_deBounce) & ~(OpHalt));
	
	divisor_frequencia div_freq
	(	
		.Clk_50M(clock), 
		.slow_clk(clock_slow)
	);
	
	debounce DeBounce
	(
		.pb_1(button_in), 
		.slow_clk(clock_slow), 
		.pb_out(button_deBounce)
	);
							
	assign display_dados = (OpOut) ? {5'b00000, dados} : 32'b00000111111111111111111111111111;
	assign clock_uso = (sel_clock) ? clock_slow : 1'b0;
	
	cpu CPU
	(
		.clock(clock_uso), 
		.switches(switches), 
		.display(dados), 
		.OpIn(OpIn), 
		.OpOut(OpOut), 
		.OpHalt(OpHalt),
		.Jal(Jal)
	);
	
	modulosaida ModuloSaida
	(
		.entrada(display_dados),
		.saida1(HEX1),
		.saida2(HEX2),
		.saida3(HEX3),
		.saida4(HEX4),
		.saida5(HEX5)
	 );
	
	
endmodule
