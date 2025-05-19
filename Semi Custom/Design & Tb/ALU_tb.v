`timescale 1ns / 1ps

module ALU_tb;

    reg signed [3:0] a, b;
    reg [3:0] sel;
    reg clk;
    wire signed [7:0] y;

    // Instantiate ALU
    ALU uut (
        .a(a),
        .b(b),
        .sel(sel),
        .clk(clk),
        .y(y)
    );

    // Generate clock: 10ns period
    always #5 clk = ~clk;

    // Monitor outputs
    initial begin
        $monitor("Time=%0t a=%d b=%d sel=%b y=%d", $time, a, b, sel, y);
    end

    initial begin
        // Initialize
        clk = 0;
        a = 0; 
        b = 0; 
        sel = 4'b0000;
        #10;

        // Test Arithmetic Operations (sel[3] = 0)
        // Test Increment A: A = 3 -> Y = 4
        a = 4'd3; b = 4'd0;
        sel = 4'b0000; 
        #20;  // Wait 2 clock cycles

        // Test Increment B: B = 5 -> Y = 6
        a = 4'd0; b = 4'd5;
        sel = 4'b0001; 
        #20;

        // Test Transfer A: A = -2 -> Y = -2
        a = -4'sd2; b = 4'd0;
        sel = 4'b0010; 
        #20;

        // Test Transfer B: B = -4 -> Y = -4
        a = 4'd0; b = -4'sd4;
        sel = 4'b0011; 
        #20;

        // Test Decrement A: A = 7 -> Y = 6
        a = 4'd7; b = 4'd0;
        sel = 4'b0100; 
        #20;

        // Test Multiply A * B: A = 3, B = -2 -> Y = -6
        a = 4'd3; b = -4'sd2;
        sel = 4'b0101; 
        #20;

        // Test Add A + B: A = 3, B = 2 -> Y = 5
        a = 4'd3; b = 4'd2;
        sel = 4'b0110; 
        #20;

        // Test Logical Operations (sel[3] = 1)
        // Test Complement A: A = 5 -> Y = -6 (1's complement)
        a = 4'd5; b = 4'd0;
        sel = 4'b1000; 
        #20;

        // Test Complement B: B = 3 -> Y = -4 (1's complement)
        a = 4'd0; b = 4'd3;
        sel = 4'b1001; 
        #20;

        // Test AND: A = 5, B = 3 -> Y = 1
        a = 4'd5; b = 4'd3;
        sel = 4'b1010; 
        #20;

        // Test OR: A = 5, B = 3 -> Y = 7
        a = 4'd5; b = 4'd3;
        sel = 4'b1011; 
        #20;

        // Test XOR: A = 5, B = 3 -> Y = 6
        a = 4'd5; b = 4'd3;
        sel = 4'b1100; 
        #20;

        // Test XNOR: A = 5, B = 3 -> Y = -7 (1's complement of XOR)
        a = 4'd5; b = 4'd3;
        sel = 4'b1101; 
        #20;

        // Test NAND: A = 5, B = 3 -> Y = -2 (1's complement of AND)
        a = 4'd5; b = 4'd3;
        sel = 4'b1110; 
        #20;

        // Test NOR: A = 5, B = 3 -> Y = -8 (1's complement of OR)
        a = 4'd5; b = 4'd3;
        sel = 4'b1111; 
        #20;

        // Stop simulation
        #10 $finish;
    end

endmodule