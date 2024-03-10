module multiplexador1
(
	input [31:0] A_in, B_in,
	input sel,
	output wire [31:0] mux_out
);
	
	assign mux_out = (sel) ? B_in : A_in;
	
endmodule
