module decoder (
    input wire [3:0] SW,      // Đầu vào 4 bit từ switch
    output wire [6:0] HEX0    // Đầu ra điều khiển LED 7 đoạn
    // 6:0 tương ứng với các đoạn g, f, e, d, c, b, a của LED 7 đoạn
    // 0:6 tương ứng với các đoạn a, b, c, d, e, f, g của LED 7 đoạn
);

    assign HEX0 =
        (SW == 4'b0000) ? 7'b1000000 : // Hiển thị số 0
        (SW == 4'b0001) ? 7'b1111001 : // Hiển thị số 1
        (SW == 4'b0010) ? 7'b0100100 : // Hiển thị số 2
        (SW == 4'b0011) ? 7'b0110000 : // Hiển thị số 3
        (SW == 4'b0100) ? 7'b0011001 : // Hiển thị số 4
        (SW == 4'b0101) ? 7'b0010010 : // Hiển thị số 5
        (SW == 4'b0110) ? 7'b0000010 : // Hiển thị số 6
        (SW == 4'b0111) ? 7'b1111000 : // Hiển thị số 7
        (SW == 4'b1000) ? 7'b0000000 : // Hiển thị số 8
        (SW == 4'b1001) ? 7'b0010000 : // Hiển thị số 9
        (SW == 4'b1010) ? 7'b0001000 : // Hiển thị ký tự A
        (SW == 4'b1011) ? 7'b0000011 : // Hiển thị ký tự b
        (SW == 4'b1100) ? 7'b1000110 : // Hiển thị ký tự C
        (SW == 4'b1101) ? 7'b0100001 : // Hiển thị ký tự d
        (SW == 4'b1110) ? 7'b0000110 : // Hiển thị ký tự E
        (SW == 4'b1111) ? 7'b0001110 : // Hiển thị ký tự F
                             7'b1111111; // Mặc định tắt tất cả các đoạn

endmodule