module multiplexador3
(
	input [31:0] A_in, B_in, C_in, D_in,
	input Sel_1, Sel_2, Sel_3,
	output reg [31:0] mux4_out
);
	
	always begin @(*)
		if (Sel_3 == 1'b1) mux4_out <= D_in;
		else if (Sel_2 == 1'b1) mux4_out <= C_in;
		else if (Sel_1 == 1'b1) mux4_out <= B_in;
		else mux4_out <= A_in;
	end

endmodule
