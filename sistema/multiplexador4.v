module multiplexador4
(
	input [31:0] A_in, B_in, C_in, D_in, E_in,
	input Sel_1, Sel_2, Sel_3, Sel_4,
	output reg [31:0] mux5_out
);
	
	always begin @(*)
		if (Sel_4 == 1'b1) mux5_out <= E_in;
		else if (Sel_3 == 1'b1) mux5_out <= D_in;
		else if (Sel_2 == 1'b1) mux5_out <= C_in;
		else if (Sel_1 == 1'b1) mux5_out <= B_in;
		else mux5_out <= A_in;
	end

endmodule