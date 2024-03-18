module bcd
(
	input [27:0] binario,
	output wire [3:0] HBin7, HBin6, HBin5, HBin4, HBin3, HBin2, HBin1, HBin0
);

	reg [31:0] HBinAux7, HBinAux6, HBinAux5, HBinAux4, HBinAux3, HBinAux2, HBinAux1, HBinAux0;

	reg [31:0] temp;
	
	//integer i;
	
	always @(binario) begin
		HBinAux7 = 4'd0;
		HBinAux6 = 4'd0;
		HBinAux5 = 4'd0;
		HBinAux4 = 4'd0;
		HBinAux3 = 4'd0;
		HBinAux2 = 4'd0;
		HBinAux1 = 4'd0;
		HBinAux0 = 4'd0;
		
		/*
		for (i=27; i>=0 ; i=i-1) begin
			if(HBinAux7 >= 5)
				HBinAux7 = HBinAux7 + 3;
			if(HBinAux6 >= 5)
				HBinAux6 = HBinAux6 + 3;
			if(HBinAux5 >= 5)
				HBinAux5 = HBinAux5 + 3;
			if(HBinAux4 >= 5)
				HBinAux4 = HBinAux4 + 3;
			if(HBinAux3 >= 5)
				HBinAux3 = HBinAux3 + 3;
			if(HBinAux2 >= 5)
				HBinAux2 = HBinAux2 + 3;
			if(HBinAux1 >= 5)
				HBinAux1 = HBinAux1 + 3;
			if(HBinAux0 >= 5)
				HBinAux0 = HBinAux0 + 3;
				
			HBinAux7 = HBinAux7 << 1;
			HBinAux7[0] = HBinAux6[3];
			HBinAux6 = HBinAux6 << 1;
			HBinAux6[0] = HBinAux5[3];
			HBinAux5 = HBinAux5 << 1;
			HBinAux5[0] = HBinAux4[3];
			HBinAux4 = HBinAux4 << 1;
			HBinAux4[0] = HBinAux3[3];
			HBinAux3 = HBinAux3 << 1;
			HBinAux3[0] = HBinAux2[3];
			HBinAux2 = HBinAux2 << 1;
			HBinAux2[0] = HBinAux1[3];
			HBinAux1 = HBinAux1 << 1;
			HBinAux1[0] = HBinAux0[3];
			HBinAux0 = HBinAux0 << 1;
			HBinAux0[0] = binario[i];
		end */
	
		temp = binario;
		
		if(binario == 27'b111111111111111111111111111) begin // apagado
			HBinAux7 <= 4'b1111;
			HBinAux6 <= 4'b1111;
			HBinAux5 <= 4'b1111;
			HBinAux4 <= 4'b1111;
			HBinAux3 <= 4'b1111;
			HBinAux2 <= 4'b1111;
			HBinAux1 <= 4'b1111;
			HBinAux0 <= 4'b1111;
		end else begin
			HBinAux0 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux1 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux2 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux3 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux4 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux5 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux6 <= (temp) % 10;
			temp = temp / 32'd10;
			HBinAux7 <= (temp) % 10;
		end
	end
	
	assign HBin7 = HBinAux7[3:0];
	assign HBin6 = HBinAux6[3:0];
	assign HBin5 = HBinAux5[3:0];
	assign HBin4 = HBinAux4[3:0];
	assign HBin3 = HBinAux3[3:0];
	assign HBin2 = HBinAux2[3:0];
	assign HBin1 = HBinAux1[3:0];
	assign HBin0 = HBinAux0[3:0];

endmodule
