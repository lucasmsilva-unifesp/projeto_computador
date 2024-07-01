module divisor_frequencia
#(
	parameter clock_slow_counter=25000000
)
(
	input Clk_50M, 
	output reg slow_clk
);

    reg [31:0] counter=0;
	 
    always @(posedge Clk_50M)
    begin
        counter <= (counter>=clock_slow_counter)?0:counter+1;
        slow_clk <= (counter < clock_slow_counter/2)?1'b0:1'b1;
    end
endmodule
