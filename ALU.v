module ALU (
    input signed [3:0] a,b,sel,
    input clk,
    output signed [7:0] y
);

    reg signed [3:0] regA;
    reg signed [3:0] regB;
    reg signed [7:0] regY;
    reg signed [7:0] nextY;

    always @(posedge clk)
    begin
        regA<=a;
        regB<=b;
        regY<=nextY;
    end

    assign y=regY;
    always @(*) begin
        case (sel[3])
        0: begin
        /* Arithmetic Unit --> Omar Theta








        */
        end
        1:  begin
        case (Sel[2:0])
            3'b1000: nextY = ~regA;       // Complement a (1’s complement) 
            3'b1001: nextY = ~regB;       // Complement b (1’s complement)
            3'b1010: nextY = regA & regB; // AND
            3'b1011: nextY = regA | regB; // OR
            3'b1100: nextY = regA ^ regB; // XOR
            3'b1101: nextY = ~(regA ^ regB); // XNOR
            3'b1110: nextY = ~(regA & regB); // NAND
            3'b1111: nextY = ~(regA | regB); // NOR
            default: nextY = 8'b0000;
        endcase
        end
        default: 
        endcase
    end
endmodule