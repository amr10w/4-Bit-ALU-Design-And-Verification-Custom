module top_system (
    clk     ,
    rst_n   ,
    seg     ,	
//	 sel     ,  // commented line
    an,
	 leds
);

input  clk;
//input  [3:0] sel;  // commented line
input  rst_n;
output [3:0] leds; 

output  [0:6] seg;
output  [3:0] an;

wire signed  [7:0] y;

wire signed  [3:0] a;
wire signed  [3:0] b;
reg 			 [3:0] sel;  	 // added line
wire 					 clk_sel; // added line

assign a = 4'b0100;	// 4
assign b = 4'b1000;	// -8

// added module 
clk_divider d1 (
	 .clk_in(clk),
	 .rst_n(rst_n),
	 .clk_out(clk_sel)
);

// added block 
always@(posedge clk_sel or negedge rst_n) begin
	if(!rst_n) 
		sel <= 0;
	else 
		sel <= sel + 1;		// automatically pass on all the operations one each 5 seconds
end 


top_module a0 (
    .clk(clk),
    .a(a),
    .b(b),
    .sel(sel),
    .rst_n(rst_n),
    .y(y)
);

digital_tube_decoder disp0 ( 
    .clk(clk),
    .A(y),
    .sel(sel[3]),
    .seg(seg),
    .an(an)
);

assign leds = ~sel;


endmodule