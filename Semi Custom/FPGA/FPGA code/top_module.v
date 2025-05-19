module top_module (
    input signed [3:0] a,b,
	 input [3:0] sel,
    input clk,
	 input rst_n,
    output signed [7:0] y
);

	 
    reg signed [3:0] regA; 
    reg signed [3:0] regB; 
    reg signed [7:0] regY;
    reg signed [7:0] nextY; 

    always @(posedge clk or negedge rst_n)
    begin
		if(!rst_n)
			regY <= 0;
		else
         regY <= nextY;

    end
     always @(posedge clk or negedge rst_n)
    begin
		if(!rst_n) begin
        regA<=0;
        regB<=0;	
		 end
		else begin
        regA <= a;
        regB <= b;
		  end
  
    end 
      
    //MUX 
    always @(*) begin
      case (sel[3])
        0: begin
            case (sel[2:0])
                3'b000: nextY = regA + 1; // Increment A
                3'b001: nextY = regB + 1; // Increment B
                3'b010: nextY = regA; // Transfer A
                3'b011: nextY = regB; // Transfer B
                3'b100: nextY = regA - 1; // Decrement A
                3'b101: nextY = regA * regB; // Multiply A and B
                3'b110: nextY = regA + regB; // Add A and B
                3'b111: nextY = regA - regB;
                default: nextY = 8'b00000000;
            endcase
        end
        1:  begin
          case (sel[2:0])
            3'b000: nextY = ~regA;       // Complement a (1's complement) 
            3'b001: nextY = ~regB;       // Complement b (1's complement)
            3'b010: nextY = regA & regB; // AND
            3'b011: nextY = regA | regB; // OR
            3'b100: nextY = regA ^ regB; // XOR
            3'b101: nextY = ~(regA ^ regB); // XNOR
            3'b110: nextY = ~(regA & regB); // NAND
            3'b111: nextY = ~(regA | regB); // NOR
            default: nextY = 8'b00000000;
          endcase
        end
        default: nextY = 8'b00000000;
      endcase
    end

 assign y = regY;
	 
	 
    
endmodule