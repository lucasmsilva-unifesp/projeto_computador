module ulacontrol
(
	input [3:0] ULAop,
	input [5:0] FuncCode,
	output reg [3:0] ULActl
);
	
	always @(*)
		case(ULAop)
			4'b0000: ULActl<=4'b0010; // lw, sw e addi
			4'b0001: ULActl<=4'b0110; // beq, bnq e subi
			4'b0011: ULActl<=4'b0000; // andi
			4'b0100: ULActl<=4'b0001; // ori
			4'b0101: ULActl<=4'b1000; // lui
			4'b0110: ULActl<=4'b0111; // slti
			4'b0111: ULActl<=4'b1110; // sla
			4'b1000: ULActl<=4'b0011; // sra
			4'b0010:
				case (FuncCode)
					6'b100000: ULActl<=4'b0010; //soma
					6'b100010: ULActl<=4'b0110; //sub
					6'b100100: ULActl<=4'b0000; //and
					6'b100101: ULActl<=4'b0001; //or
					6'b100111: ULActl<=4'b1100; //not
					6'b101010: ULActl<=4'b0111; //slt
					6'b101001: ULActl<=4'b1110; //sll
					6'b101011: ULActl<=4'b0011; //srl
					6'b100001: ULActl<=4'b0100; //mul
					6'b100011: ULActl<=4'b0101; //div
					6'b101000: ULActl<=4'b1001; //rem
					default: ULActl<=4'b1111; //nao devera acontecer
				endcase
			default: ULActl<=4'b1111; //nao devera acontecer
		endcase
endmodule
