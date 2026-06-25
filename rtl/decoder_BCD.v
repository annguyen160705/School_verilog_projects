module decoder_BCD (
    input wire [5:0] SW,          // Đầu vào 6 bit, giá trị từ 0 đến 63
    output wire [6:0] HEX0, HEX1  // HEX0: hàng đơn vị, HEX1: hàng chục
);

wire [3:0] donvi, chuc;          // Lưu chữ số hàng đơn vị và hàng chục

assign donvi = SW % 10;          // Lấy phần dư khi chia cho 10 (hàng đơn vị)
assign chuc  = SW / 10;          // Lấy thương khi chia cho 10 (hàng chục)

assign HEX0 = (donvi == 4'b0000) ? 7'b1000000 : // Hiển thị số 0
              (donvi == 4'b0001) ? 7'b1111001 : // Hiển thị số 1
              (donvi == 4'b0010) ? 7'b0100100 : // Hiển thị số 2
              (donvi == 4'b0011) ? 7'b0110000 : // Hiển thị số 3
              (donvi == 4'b0100) ? 7'b0011001 : // Hiển thị số 4
              (donvi == 4'b0101) ? 7'b0010010 : // Hiển thị số 5
              (donvi == 4'b0110) ? 7'b0000010 : // Hiển thị số 6
              (donvi == 4'b0111) ? 7'b1111000 : // Hiển thị số 7
              (donvi == 4'b1000) ? 7'b0000000 : // Hiển thị số 8
              (donvi == 4'b1001) ? 7'b0010000 : // Hiển thị số 9
                                   7'b1111111 ; // Mặc định tắt LED

assign HEX1 = (chuc == 4'b0000) ? 7'b1000000 : // Hiển thị số 0
              (chuc == 4'b0001) ? 7'b1111001 : // Hiển thị số 1
              (chuc == 4'b0010) ? 7'b0100100 : // Hiển thị số 2
              (chuc == 4'b0011) ? 7'b0110000 : // Hiển thị số 3
              (chuc == 4'b0100) ? 7'b0011001 : // Hiển thị số 4
              (chuc == 4'b0101) ? 7'b0010010 : // Hiển thị số 5
              (chuc == 4'b0110) ? 7'b0000010 : // Hiển thị số 6
              (chuc == 4'b0111) ? 7'b1111000 : // Hiển thị số 7
              (chuc == 4'b1000) ? 7'b0000000 : // Hiển thị số 8
              (chuc == 4'b1001) ? 7'b0010000 : // Hiển thị số 9
                                  7'b1111111 ; // Mặc định tắt LED

endmodule