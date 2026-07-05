module counter_control (
    input clk,                  // Clock 50 MHz từ FPGA
    input rst_n,                // Reset active-low
    input [2:0] SW1,            // Chọn tốc độ đếm (1, 2, 4, 8, 16, 32 Hz)
    input SW2,                  // Chọn chiều đếm (1: Up, 0: Down)
    output [0:6] HEX0           // LED 7 đoạn hiển thị giá trị
);

wire clk_out;                   // Clock sau khi chia
reg [3:0] pos;                  // Giá trị bộ đếm 4 bit


counter_precisely #(
    .FCLK(50_000_000)
) c (
    .clk(clk),
    .rst_n(rst_n),
    .FOUT(SW1),
    .clk_out(clk_out)
);


hex7seg h1 (
    .x(pos),
    .seg(HEX0)
);


always @(posedge clk_out or negedge rst_n) begin

    if (!rst_n)
        pos <= 4'd0;            // Reset về 0

    else begin

        if (SW2) begin          // SW2 = 1 -> Đếm lên

            if (pos == 4'hF)
                pos <= 4'h0;    // F -> 0
            else
                pos <= pos + 1'b1;

        end

        else begin              // SW2 = 0 -> Đếm xuống

            if (pos == 4'h0)
                pos <= 4'hF;    // 0 -> F
            else
                pos <= pos - 1'b1;

        end

    end

end

endmodule