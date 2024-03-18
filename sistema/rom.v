module rom
#(
	parameter DATA_WIDTH=32, 
	parameter ADDR_WIDTH=6
)
(
	input [5:0] addr,
	input clk, 
	output reg [31:0] q
);

	// Declare the ROM variable
	reg [31:0] rom[13:0];
	
	//reg primeiroclock = 1;

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.

	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file, or see the "Using $readmemb and $readmemh"
	// template later in this section.
	
	
initial begin
rom[0] = 32'b00111000000100000000000000000000;
rom[1] = 32'b00111100000100000000000000000000;
rom[2] = 32'b00010000000100000000000000000001;
rom[3] = 32'b00001100001000000000000000000001;
rom[4] = 32'b00110100000000001000000000000000;
rom[5] = 32'b01000000000000000000000000000000;
rom[6] = 32'b00000000010100001100010000101010;
rom[7] = 32'b00100100010100000000000000001101;
rom[8] = 32'b01000000000000000000000000000000;
rom[9] = 32'b00011100011000000000000000000000;
rom[10] = 32'b00011100011100000000000000000000;
rom[11] = 32'b00000000100000011100001100101010;
rom[12] = 32'b00111100001000000000000000000000;
rom[13] = 32'b01000100000000000000000000000000;
end 

	always @ (posedge clk)
	begin
		/*
		if (primeiroclock) begin 
			$readmemb("fatorial.txt", rom, 0, 2**ADDR_WIDTH-1);
			
			primeiroclock <= 0;
		end
		*/
		
		q <= rom[addr];
	end

endmodule
