module multi_4bits_display(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] multi,
    output [0:6] HEX0,
    output [0:6] HEX1,
    output [0:6] HEX2
);
multi_4bits uut (
    .A(A),
    .B(B),
    .multi(multi)
);

wire [3:0] tens;
wire [3:0] ones;
wire [3:0] hundreds;

hex7seg h0(ones, HEX0);
hex7seg h1(tens, HEX1);
hex7seg h2(hundreds, HEX2);

assign hundreds = multi / 100;
assign tens     = (multi % 100) / 10;
assign ones = multi % 10;


endmodule
