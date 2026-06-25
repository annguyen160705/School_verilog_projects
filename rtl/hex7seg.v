module hex7seg(
    input  [3:0] x,
    output reg [0:6] seg
);

// 6:0 tương ứng với các đoạn g, f, e, d, c, b, a của LED 7 đoạn
// 0:6 tương ứng với các đoạn a, b, c, d, e, f, g của LED 7 đoạn

// 7'b0000001 tương ứng với số 0, 
// 7'b1001111 tương ứng với số 1, 
// 7'b0010010 tương ứng với số 2, 
// 7'b0000110 tương ứng với số 3, 
// 7'b1001100 tương ứng với số 4, 
// 7'b0100100 tương ứng với số 5, 
// 7'b0100000 tương ứng với số 6, 
// 7'b0001111 tương ứng với số 7, 
// 7'b0000000 tương ứng với số 8, 
// 7'b0000100 tương ứng với số 9

always @(*) begin
    case(x)
        4'h0: seg = 7'b0000001;
        4'h1: seg = 7'b1001111;
        4'h2: seg = 7'b0010010;
        4'h3: seg = 7'b0000110;
        4'h4: seg = 7'b1001100;
        4'h5: seg = 7'b0100100;
        4'h6: seg = 7'b0100000;
        4'h7: seg = 7'b0001111;
        4'h8: seg = 7'b0000000;
        4'h9: seg = 7'b0000100;
        
    endcase
end

endmodule