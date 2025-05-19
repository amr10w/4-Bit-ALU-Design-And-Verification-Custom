module clk_divider (clk_in, rst_n, clk_out);

   // the wanted frequency 
	parameter target_clk = 0.2; 					// 0.2 Hz 
	
	
	// the FPGA clk frequency 
	parameter FPGA_clk = 32'd50_000_000;   //50 MHz
	
	
	// input clock frequency = 50 MHz
   // target output clock = 0.2 Hz => period = 5 sec => half-period = 2.5 sec
   // number of cycles in 2.5 sec = 50,000,000 * 2.5 = 125,000,000
	
	 parameter number_of_cycles = 32'd125_000_000;
    parameter half_period_count = number_of_cycles - 1;

	
	// inputs &  outputs
	input 	wire			clk_in;
	input 	wire			rst_n;
	output 	reg 			clk_out;
	
	
	// internal signals 
	reg [32:0] count ;
	
	always@(posedge clk_in or negedge rst_n) begin
		if(!rst_n) begin
			count <= 0;
			clk_out <= 0;
		end 
	
		else if(count == half_period_count) begin
			count <= 0;
			clk_out <= ~clk_out;
		end 
		
		else 
			count <= count + 1;

	end 

endmodule