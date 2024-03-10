module sevenSegment
(
	input [27:0] binario,
	output wire [6:0] H7, H6, H5, H4, H3, H2, H1, H0
);

	wire [3:0] HBin7, HBin6, HBin5, HBin4, HBin3, HBin2, HBin1, HBin0;
	
	BCD BCD(binario, HBin7, HBin6, HBin5, HBin4, HBin3, HBin2, HBin1, HBin0);
	
	displaySS displayH7(HBin7, H7);
	displaySS displayH6(HBin6, H6);
	displaySS displayH5(HBin5, H5);
	displaySS displayH4(HBin4, H4);
	displaySS displayH3(HBin3, H3);
	displaySS displayH2(HBin2, H2);
	displaySS displayH1(HBin1, H1);
	displaySS displayH0(HBin0, H0);

endmodule
