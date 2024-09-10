module rom
#(
	parameter DATA_WIDTH=32, 
	parameter ADDR_WIDTH=9
)
(
	input [ADDR_WIDTH-1:0] addr,
	input clk, 
	output reg [31:0] q
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] ROM[(2**ADDR_WIDTH)-1:0];
	
	//reg primeiroclock = 1;

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.

	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file, or see the "Using $readmemb and $readmemh"
	// template later in this section.

	
initial begin
ROM[1] = 32'b000001_111110_000000_00000000000000;
ROM[2] = 32'b001110_001011_000000_000000_00_000000;
ROM[3] = 32'b000100_001011_111110_00000000000010;
ROM[4] = 32'b000011_000000_111110_00000000000010;
ROM[5] = 32'b001111_000000_000000_000000_00_000000;
ROM[6] = 32'b010001_00000000000000000000000000;
end


	always @ (posedge clk)
	begin
		/*
		if (primeiroclock) begin 
			$readmemb("fatorial.txt", rom, 0, 2**ADDR_WIDTH-1);
			
			primeiroclock <= 0;
		end
		*/
		
		q <= ROM[addr];
	end

endmodule
