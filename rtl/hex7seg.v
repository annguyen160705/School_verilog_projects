module hex7seg(
    input  [3:0] x,             // Giá trị Hex cần hiển thị (0 ~ F)
    output reg [0:6] seg        // Điều khiển 7 đoạn LED (a,b,c,d,e,f,g)
);

// Thứ tự bit của seg:
// seg[0] = a
// seg[1] = b
// seg[2] = c
// seg[3] = d
// seg[4] = e
// seg[5] = f
// seg[6] = g
//
// Giá trị '0' nghĩa là đoạn LED sáng (LED active-low trên DE-series FPGA)
// Giá trị '1' nghĩa là đoạn LED tắt

always @(*) begin               // Mạch tổ hợp, cập nhật ngay khi x thay đổi

    case (x)

        4'h0: seg = 7'b0000001; // Hiển thị số 0 (sáng a,b,c,d,e,f)
        4'h1: seg = 7'b1001111; // Hiển thị số 1 
        4'h2: seg = 7'b0010010; // Hiển thị số 2
        4'h3: seg = 7'b0000110; // Hiển thị số 3
        4'h4: seg = 7'b1001100; // Hiển thị số 4
        4'h5: seg = 7'b0100100; // Hiển thị số 5
        4'h6: seg = 7'b0100000; // Hiển thị số 6
        4'h7: seg = 7'b0001111; // Hiển thị số 7
        4'h8: seg = 7'b0000000; // Hiển thị số 8 
        4'h9: seg = 7'b0000100; // Hiển thị số 9

        4'hA: seg = 7'b0001000; // Hiển thị A
        4'hB: seg = 7'b1100000; // Hiển thị b
        4'hC: seg = 7'b0110001; // Hiển thị C
        4'hD: seg = 7'b1000010; // Hiển thị d
        4'hE: seg = 7'b0110000; // Hiển thị E
        4'hF: seg = 7'b0111000; // Hiển thị F

        default: seg = 7'b1111111; // Tắt toàn bộ LED nếu x không hợp lệ

    endcase

end

endmodule