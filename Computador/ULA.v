module ULA (
	input [3:0] ULAop,
	input [5:0] FuncCode,
	input [31:0] A, B,
	output [31:0] ULAout,
	output zero
);
	
	wire [3:0] ULActl;
	
	integer ULAoutAux;
	
	ULAControl ULAControl(ULAop, 
								 FuncCode, 
								 ULActl);
	
	always @(ULActl, A, B) begin
		case (ULActl)
			4'b0000: ULAoutAux <= A & B; //and
			4'b0001: ULAoutAux <= A | B; //or
			4'b0010: ULAoutAux <= A + B; //add
			4'b0011: ULAoutAux <= A >> B; //srl
			4'b0100: ULAoutAux <= A * B; //mul
//			4'b0101: ULAoutAux <= A / B; //div
			4'b0110: ULAoutAux <= A - B; //sub
			4'b0111: ULAoutAux <= A < B ? 1 : 0; //slt
			4'b1000: ULAoutAux <= {B[13:0], 18'b0}; // lui
//			4'b1001: ULAoutAux <= A - ((A/B) * B); //rem(resto)
			4'b1100: ULAoutAux <= ~A; //not
			4'b1110: ULAoutAux <= A << B; //sll
			default: ULAoutAux <= 0;
		endcase
	end
	
	assign zero = (ULAoutAux == 0); //zero é true se ULAout eh 0
	
	assign ULAout = ULAoutAux;
	
endmodule


