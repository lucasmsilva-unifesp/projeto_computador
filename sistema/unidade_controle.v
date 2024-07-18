module unidade_controle
(
	input [5:0] opcode,
	output reg Jal, Jr, Jump, Branch, BranchNE, MemparaReg,
	output reg [3:0] OpULA,
	output reg EscreveMem, OrigULA, EscreveReg, OpShamt, OpMov, RegLei2,
	output reg OpIn, OpOut, OpHalt
);
	
	always begin @(opcode)
		case (opcode)
			6'b000000: begin // tipoR -> tenho que fazer o mul (sem overflow), mult (com overflow), div(com e sem resto), rem (resto)
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0010;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b100000: begin // sll e srl
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0010;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b1;
				OpShamt<=1'b1;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			
			6'b100001: begin // sla
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0111;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b100010: begin // sra
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1000;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000001: begin // addi
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0000;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000010: begin // subi
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0001;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000011: begin // lw
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b1;
				OpULA<=4'b0000;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000100: begin // sw
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0000;
				EscreveMem<=1'b1;
				OrigULA<=1'b1;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b1;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000101: begin // andi
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0011;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000110: begin // ori
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0100;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b000111: begin // mov
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b1;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001000: begin // lui
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0101;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001001: begin // beq
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b1;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0001;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b1;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001010: begin // bnq
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b1;
				MemparaReg<=1'b0;
				OpULA<=4'b0001;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b1;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001011: begin // slti
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b0110;
				EscreveMem<=1'b0;
				OrigULA<=1'b1;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001100: begin // j
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b1;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001101: begin // jr
				Jal<=1'b0;
				Jr<=1'b1;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001110: begin // in
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b1;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b001111: begin // out
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b1;
				OpIn<=1'b0;
				OpOut<=1'b1;
				OpHalt<=1'b0;
			end
			
			6'b010000: begin // nop
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			6'b010001: begin // halt
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b1;
			end
			
			6'b010010: begin // jal
				Jal<=1'b1;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b1;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
			
			default: begin
				Jal<=1'b0;
				Jr<=1'b0;
				Jump<=1'b0;
				Branch=1'b0;
				BranchNE<=1'b0;
				MemparaReg<=1'b0;
				OpULA<=4'b1111;
				EscreveMem<=1'b0;
				OrigULA<=1'b0;
				EscreveReg<=1'b0;
				OpShamt<=1'b0;
				OpMov<=1'b0;
				RegLei2<=1'b0;
				OpIn<=1'b0;
				OpOut<=1'b0;
				OpHalt<=1'b0;
			end
		endcase
	end
	
endmodule
