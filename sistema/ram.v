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
	output reg [(DATA_WIDTH-1):0] q
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[(2**ADDR_WIDTH)-1:0];
	
		
initial begin
ram[0] = 0;
ram[1] = 1;
ram[2] = 2;
ram[3] = 3;
end
	
	always @ (posedge write_clock)
	begin
		q <= ram[read_addr];
		// Write
		if (we)
			ram[write_addr] <= data;
			
		// Read (if read_addr == write_addr, return OLD data).	To return
		// NEW data, use = (blocking write) rather than <= (non-blocking write)
		// in the write assignment.	 NOTE: NEW data may require extra bypass
		// logic around the RAM.
	end
	
endmodule
