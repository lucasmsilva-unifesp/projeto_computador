module ula
(
	input [3:0] ULAop,
	input [5:0] FuncCode,
	input [31:0] A, B,
	output [31:0] ULAout,
	output zero
);
	
	wire [4:0] ULActl;
	reg [31:0] ULAoutAux;

	ulacontrol ULAControl(
		.ULAop(ULAop), 
		.FuncCode(FuncCode), 
		.ULActl(ULActl)
	);
	
	always @(*) begin
		case (ULActl)
			5'b00000: ULAoutAux = A & B; // and
			5'b00001: ULAoutAux = A | B; // or
			5'b00010: ULAoutAux = A + B; // add
			5'b00011: ULAoutAux = A >> B; // srl
			5'b00100: ULAoutAux = A * B; // mul
			5'b00101: ULAoutAux = A / B; // div
			5'b00110: ULAoutAux = A - B; // sub
			5'b00111: ULAoutAux = (A < B) ? 1 : 0; // slt
			5'b01000: ULAoutAux = {B[13:0], 18'b0}; // lui
			//5'b01001: ULAoutAux = A % B; // rem (resto)
			5'b01100: ULAoutAux = ~A; // not
			5'b01110: ULAoutAux = A << B; // sll
			5'b10000: ULAoutAux = (A <= B) ? 1 : 0; // slte
			5'b01010: ULAoutAux = (A > B) ? 1 : 0; // sgt
			5'b01011: ULAoutAux = (A >= B) ? 1 : 0; // sgte
			5'b01101: ULAoutAux = (A == B) ? 1 : 0; // seq
			5'b01111: ULAoutAux = (A != B) ? 1 : 0; // sneq
			default: ULAoutAux = 0;
		endcase
	end
	
	assign zero = (ULAoutAux == 0); // zero é true se ULAout é 0
	assign ULAout = ULAoutAux;
	
endmodule
