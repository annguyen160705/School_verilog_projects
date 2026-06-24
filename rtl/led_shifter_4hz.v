module led_shifter_4hz (
input wire CLOCK_50,
input reset,
output reg [9:0] out
);

reg [26:0] counter;
reg flag;


always @(posedge CLOCK_50) begin
    counter <= counter + 1'b1;
end


always @(posedge counter [24] or posedge reset ) begin
    if (out == 10'h200) flag = 1'b0;
    else if (out==10'h001) flag = 1'b1;
end

always @(posedge counter [24] or posedge reset ) begin
        if (out == 10'h000) out = 10'h200;
        else if (flag) out = {out[0],out[9:1]};
        else out =  {out[8:0],out[9]};
end


endmodule