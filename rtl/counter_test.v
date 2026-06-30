module counter_test (
    input  wire CLOCK_50,
    output wire LEDR
);

  reg [24:0] counter;

  always @(posedge CLOCK_50) begin

    counter <= counter + 1'b1;


  end

  assign LEDR = counter[23];

endmodule
