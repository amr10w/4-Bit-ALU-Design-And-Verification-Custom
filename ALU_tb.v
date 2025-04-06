module simple_print;
  reg [7:0] data; // 8-bit register to store data

  initial begin
    // Initialize the data
    data = 8'b01010101; // Example value to print
    #10; // Wait for 10 time units (optional)
    $display("Data value: %b", data); // Print the value of the data in binary
    $finish; // End the simulation
  end
endmodule
