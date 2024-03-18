module divisor_frequencia
(
	input Clk_50M, 
	output reg slow_clk
);

    reg [31:0] counter=0;
	 
    always @(posedge Clk_50M)
    begin
        counter <= (counter>=200000)?0:counter+1;
        slow_clk <= (counter < 100000)?1'b0:1'b1;
    end
endmodule
