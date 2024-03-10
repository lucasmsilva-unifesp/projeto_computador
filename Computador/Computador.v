module Computador
(
	input clock,
	input button_in,
	input [17:0] switches,
	output [6:0] HEX7,
	output [6:0] HEX6,
	output [6:0] HEX5,
	output [6:0] HEX4,
	output [6:0] HEX3,
	output [6:0] HEX2,
	output [6:0] HEX1,
	output [6:0] HEX0,
	output [3:0] LEDG
);
	
	wire OpIn, OpOut, OpHalt;
	wire sel_clock, clock_d, clock_slow;
	wire button_out;
	
	wire [27:0] display;
	wire [31:0] mux_out;
	
	assign LEDG[0] = OpIn;
	assign LEDG[1] = OpOut;
	assign LEDG[2] = OpHalt;
	assign LEDG[3] = clock_slow;
	
	assign sel_clock = ((~(OpIn | OpOut) | button_out) & ~(OpHalt));
	
	dif_freq dif_freq(clock, 
							clock_slow);
	
	DeBounce DeBounce(button_in, 
							clock_slow, 
							button_out);
	
	multiplexador1 Mux_clock(1'b0, 
									 clock_slow, 
									 sel_clock, 
									 clock_d);
	
	CPU CPU(clock_d, 
		 switches, 
		 display, 
		 OpIn, 
		 OpOut, 
		 OpHalt);

	multiplexador1 Mux1(27'b111111111111111111111111111, 
							  display, 
							  OpOut, 
							  mux_out);
	
	sevenSegment sevenSegment(mux_out[27:0],
									  HEX7,
									  HEX6,
								 	  HEX5,
									  HEX4,
									  HEX3,
									  HEX2,
									  HEX1,
									  HEX0);

endmodule
