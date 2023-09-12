//filename:- ripple_carry_adder_4bit.v
`include "full_adder.v"
module ripple_carry_adder_4bit(
A,
B,
CI,
S,
CO
);
//declare inputs and outputs
input [3:0] A;
input [3:0] B;
input CI;
output [3:0] S;
output CO;
//declare port datatype
wire [3:0] A;
wire [3:0] B;
wire CI;
wire [3:0] S;
wire CO;
//intermediate variables
wire C1;
wire C2;
wire C3;
//logic
full_adder u0(  // adding (A[0], B[0], CI) output (S[0], C1)
    .a(A[0]),
    .b(B[0]),
    .ci(CI),
    .s(S[0]),
    .co(C1)
);
full_adder u1(  // adding (A[1], B[1], C1) output (S[1], C2)
    .a(A[1]),
    .b(B[1]),
    .ci(C1),
    .s(S[1]),
    .co(C2)
);
full_adder u2(  // adding (A[2], B[2], C2) output (S[2], C3)
    .a(A[2]),
    .b(B[2]),
    .ci(C2),
    .s(S[2]),
    .co(C3)
);
full_adder u3(  // adding (A[3], B[3], C3) output (S[3], CO)
    .a(A[3]),
    .b(B[3]),
    .ci(C3),
    .s(S[3]),
    .co(CO)
);
endmodule