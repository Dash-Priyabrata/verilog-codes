//filename:- ripple_carry_adder_testbench.v
`include "ripple_carry_adder_4bit.v"

module ripple_carry_adder_4bit_testbench;
//input output
reg [3:0] A;
reg [3:0] B;
reg CI;
wire [3:0] S;
wire CO;

initial begin
    $dumpfile("ripple_carry_adder_4_bit_testbenc.vcd");
    $dumpvars(0, ripple_carry_adder_4bit_testbench);
    $display("A\tB\tCI SUM\tCO");
    $monitor("%b %b %b %b %b", A, B, CI, S, CO);
    //testcases
    A = 4'b0001;
    B = 4'b0010;
    CI = 1'b0;

    #10 A = 4'b0101;
    B = 4'b0100;
    CI = 1'b0;

    #10 A = 4'b0111;
    B = 4'b0110;
    CI = 1'b1;
    #10 $finish;
end

ripple_carry_adder_4bit uut(
.A(A),
.B(B),
.CI(CI),
.S(S),
.CO(CO)
);

endmodule