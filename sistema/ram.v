module ram
#(
	parameter DATA_WIDTH=32, 
	parameter ADDR_WIDTH=6
	// o certo seria 14, entretanto para a melhorar
	// a performance foi reduzido
)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input we, write_clock,
	output [(DATA_WIDTH-1):0] q
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[(2**ADDR_WIDTH)-1:0];
	
	always @ (posedge write_clock)
	begin
		// Write
		if (we)
			ram[write_addr] <= data;
	end
	
	assign q = ram[read_addr];
	
endmodule
