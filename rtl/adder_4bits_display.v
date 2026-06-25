module adder_4bits_display(
    input  [3:0] A,          // So hang thu nhat 4 bit
    input  [3:0] B,          // So hang thu hai 4 bit
    output [0:6] HEX0,       // LED 7 doan hien thi hang don vi
    output [0:6] HEX1,       // LED 7 doan hien thi hang chuc
    output [3:0] sum,        // 4 bit tong
    output       cout        // Bit nho ra
);

wire c1, c2, c3;            // Cac tin hieu carry trung gian

// Cong bit 0 bang Half Adder
halfadder u0 (A[0], B[0], sum[0], c1);

// Cong cac bit con lai bang Full Adder
fulladder u1 (A[1], B[1], c1, sum[1], c2);
fulladder u2 (A[2], B[2], c2, sum[2], c3);
fulladder u3 (A[3], B[3], c3, sum[3], cout);

wire [4:0] result;          // Ket qua 5 bit gom cout va sum

assign result = {cout,sum}; // Ghep carry va tong thanh so 5 bit

wire [3:0] tens;            // Chu so hang chuc
wire [3:0] ones;            // Chu so hang don vi

assign tens = result / 10;  // Lay hang chuc
assign ones = result % 10;  // Lay hang don vi

// Hien thi len LED 7 doan
hex7seg h0(ones, HEX0);
hex7seg h1(tens, HEX1);

endmodule