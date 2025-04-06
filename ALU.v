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
    
endmodule