module banco_registrador 
(
	input[5:0] end_escrita, end_leitura1, end_leitura2,
	input clock,
	input [31:0] dados_escrita,
	input EscreveReg,
	output [31:0] leitura1, leitura2
);
	
	reg [31:0] BR [63:0]; 
	
	reg primeiroclock = 1;
	
	assign leitura1 = BR[end_leitura1];
	assign leitura2 = BR[end_leitura2];
	
	always begin @(posedge clock) 
		if (primeiroclock)
		begin
			BR[0] = 0;
			BR[1] = 13249;
			// kit fpga de2-115 tem 126MB de SDRAM,
			// deixei 20MB para os programas,
			// sobrando 106MB para as memórias
			// Cada um ficara com 53MB, mas pode mudar
			// A RAM poderá armazenar 13250 valores
			primeiroclock = 0;
		end
		
		if (EscreveReg) BR[end_escrita] <= dados_escrita;
	end
	
endmodule