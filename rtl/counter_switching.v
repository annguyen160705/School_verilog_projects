module counter_switching (
    input wire CLOCK_50,
    input wire [1:0] SW,
    output wire LEDR
);

reg [26:0] counter;

    always @(posedge CLOCK_50) begin
        counter <= counter + 1'b1;
    end
        

    assign LEDR = (SW == 2'b00) ? counter [26] : //1hz
                  (SW == 2'b01) ? counter [25] : //2hz
                  (SW == 2'b10) ? counter [24] : //3hz
                  counter [23] ; //8hz


endmodule