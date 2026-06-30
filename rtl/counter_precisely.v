module counter_precisely #(
    parameter FCLK = 50_000_000, //Hz
    parameter FOUT = 2 //Hz
) (
    input clk,
    input rst_n,
    output reg clk_out
);


localparam COUNT_MAX = (FCLK/(2*FOUT)) - 1;
localparam COUNTER_WIDTH = $clog2(COUNT_MAX + 1);
reg [COUNTER_WIDTH-1:0] counter;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        counter <= 0;
        clk_out <= 0;
    end
    else if (counter == COUNT_MAX) begin
        counter <= 0;
        clk_out <= ~clk_out;
    end
    else begin
        counter <= counter + 1'b1;
    end
end


endmodule