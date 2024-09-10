module ulacontrol
(
	input [3:0] ULAop,
	input [5:0] FuncCode,
	output reg [4:0] ULActl
);
	
	always @(*)
		case(ULAop)
			4'b0000: ULActl<=5'b00010; // lw, sw e addi
			4'b0001: ULActl<=5'b00110; // beq, bnq e subi
			4'b0011: ULActl<=5'b00000; // andi
			4'b0100: ULActl<=5'b00001; // ori
			4'b0101: ULActl<=5'b01000; // lui
			4'b0110: ULActl<=5'b00111; // slti
			4'b0111: ULActl<=5'b01110; // sla
			4'b1000: ULActl<=5'b00011; // sra
			4'b0010:
				case (FuncCode)
					6'b100000: ULActl<=5'b00010; //soma
					6'b100010: ULActl<=5'b00110; //sub
					6'b100100: ULActl<=5'b00000; //and
					6'b100101: ULActl<=5'b00001; //or
					6'b100111: ULActl<=5'b01100; //not
					6'b101010: ULActl<=5'b00111; //slt
					6'b101001: ULActl<=5'b01110; //sll
					6'b101011: ULActl<=5'b00011; //srl
					6'b100001: ULActl<=5'b00100; //mul
					6'b100011: ULActl<=5'b00101; //div
					6'b101000: ULActl<=5'b01001; //rem
					6'b101100: ULActl<=5'b10000; //slte
					6'b101101: ULActl<=5'b01010; //sgt
					6'b101110: ULActl<=5'b01011; //sgte
					6'b101111: ULActl<=5'b01101; //seq
					6'b110000: ULActl<=5'b01111; //sneq
					default: ULActl<=5'b11111; //nao devera acontecer
				endcase
			default: ULActl<=5'b11111; //nao devera acontecer
		endcase
endmodule
