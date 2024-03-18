module multiplexador2
(
	input [31:0] A_in, B_in, C_in,
	input Sel_1, Sel_2,
	output reg [31:0] mux3_out
);

	always begin @(A_in or B_in or C_in or Sel_1 or Sel_2)
		if (Sel_2 == 1'b1) mux3_out <= C_in;
		else if (Sel_1 == 1'b1) mux3_out <= B_in;
		else mux3_out <= A_in;
	end

endmodule
