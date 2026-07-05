module shifting_hi (
    input clk,
    input rst_n,
    input [2:0] SW,
    output reg [0:6] HEX0,
    output reg [0:6] HEX1,
    output reg [0:6] HEX2,
    output reg [0:6] HEX3,
    output reg [0:6] HEX4,
    output reg [0:6] HEX5
);

wire clk_out;
reg [2:0] pos;

localparam H   = 7'b1001000;
localparam I   = 7'b1111001;
localparam OFF = 7'b1111111;

counter_precisely #(
    .FCLK(50_000_000)
) c (
    clk,
    rst_n,
    SW,
    clk_out);

always @(posedge clk_out or negedge rst_n) begin
    if (!rst_n)
        pos <= 3'd0;
    else if (pos == 3'd5)
        pos <= 3'd0;
    else
        pos <= pos + 3'd1;
end

always @(*) begin

    // Mặc định tắt toàn bộ LED
    HEX0 = OFF;
    HEX1 = OFF;
    HEX2 = OFF;
    HEX3 = OFF;
    HEX4 = OFF;
    HEX5 = OFF;

    case (pos)

        3'd0: begin
            HEX5 = H;
            HEX4 = I;
        end

        3'd1: begin
            HEX4 = H;
            HEX3 = I;
        end

        3'd2: begin
            HEX3 = H;
            HEX2 = I;
        end

        3'd3: begin
            HEX2 = H;
            HEX1 = I;
        end

        3'd4: begin
            HEX1 = H;
            HEX0 = I;
        end

        3'd5: begin
            HEX0 = H;
            HEX5 = I;
        end

        default: begin
            // Không cần làm gì vì đã gán OFF ở trên
        end

    endcase

end

endmodule