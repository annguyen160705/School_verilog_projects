module led_shifter (
input wire CLOCK_50,
input reset,
output reg [9:0] out
);
reg [26:0] counter;

always @(posedge CLOCK_50 or posedge reset) begin
    counter <= counter + 1'b1;
end

always @(posedge counter[26] or posedge reset) begin
    out = {out[0],out[9:1]};
end


endmodule