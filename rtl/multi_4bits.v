module multi_4bits(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] multi
);

wire P0;
wire [3:0] c1;
wire [3:0] c2;
wire [3:0] c3;

wire [3:0] s1;
wire [3:0] s2;
wire [3:0] s3;


//Layer 1 P0
assign P0 = A[0] & B[0];
//Layer 2 P1
halfadder u0 (A[1] & B[0], A[0] & B[1], s1[0], c1[0]);
fulladder u1 (A[2] & B[0], A[1] & B[1], c1[0], s1[1], c1[1]);
fulladder u2 (A[3] & B[0], A[2] & B[1], c1[1], s1[2], c1[2]);
halfadder u3 (A[3] & B[1], c1[2], s1[3], c1[3]);
//Layer 3 P2
halfadder u4 (A[0] & B[2], s1[1], s2[0], c2[0]);
fulladder u5 (A[1] & B[2], s1[2], c2[0], s2[1], c2[1]);
fulladder u6 (A[2] & B[2], s1[3], c2[1], s2[2], c2[2]);
fulladder u7 (A[3] & B[2], c1[3], c2[2], s2[3], c2[3]);
//Layer 4 P3 P4 P5 P6 P7
halfadder u8 (A[0] & B[3], s2[1], s3[0], c3[0]);
fulladder u9 (A[1] & B[3], s2[2], c3[0], s3[1], c3[1]);
fulladder u10 (A[2] & B[3], s2[3], c3[1], s3[2], c3[2]);
fulladder u11 (A[3] & B[3], c2[3], c3[2], s3[3], c3[3]);
//result = {P7, P6, P5, P4, P3, P2, P1, P0}
assign multi = {c3[3], s3[3], s3[2], s3[1], s3[0], s2[0], s1[0], P0};


endmodule
