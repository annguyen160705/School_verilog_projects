module decoder_case (
    input  [3:0] SW,      // Đầu vào 4 bit (0 -> F)
    output reg [6:0] HEX0 // Đầu ra điều khiển LED 7 đoạn
);

always @(*) begin        // Khối tổ hợp, chạy khi SW thay đổi
    case (SW)            // Kiểm tra giá trị của SW

        4'h0: HEX0 = 7'b1000000; // Hiển thị số 0
        4'h1: HEX0 = 7'b1111001; // Hiển thị số 1
        4'h2: HEX0 = 7'b0100100; // Hiển thị số 2
        4'h3: HEX0 = 7'b0110000; // Hiển thị số 3
        4'h4: HEX0 = 7'b0011001; // Hiển thị số 4
        4'h5: HEX0 = 7'b0010010; // Hiển thị số 5
        4'h6: HEX0 = 7'b0000010; // Hiển thị số 6
        4'h7: HEX0 = 7'b1111000; // Hiển thị số 7
        4'h8: HEX0 = 7'b0000000; // Hiển thị số 8
        4'h9: HEX0 = 7'b0010000; // Hiển thị số 9

        4'hA: HEX0 = 7'b0001000; // Hiển thị ký tự A
        4'hB: HEX0 = 7'b0000011; // Hiển thị ký tự b
        4'hC: HEX0 = 7'b1000110; // Hiển thị ký tự C
        4'hD: HEX0 = 7'b0100001; // Hiển thị ký tự d
        4'hE: HEX0 = 7'b0000110; // Hiển thị ký tự E
        4'hF: HEX0 = 7'b0001110; // Hiển thị ký tự F

        default: HEX0 = 7'b1111111; // Mặc định tắt tất cả các đoạn
    endcase
end

endmodule