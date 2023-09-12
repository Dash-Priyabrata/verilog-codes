`timescale 1ns/1ns
//Import the main code into the testbench
`include "sample.v"

module sample_tb;
//Inputs as registers
reg A, B, C;

//Outputs as wires
wire D;
wire E;

//Initialisation 
sample uut(A,B,C,D,E);

initial begin
    //Name of the graph file that gets generated after we run
    $dumpfile("sample_tb.vcd");
    $dumpvars(0, sample_tb);

    A = 0;
    B = 0;
    C = 0;
    #10;

    A = 0;
    B = 0;
    C = 1;
    #10;

    A = 0;
    B = 1;
    C = 0;
    #10;
    
    A = 0;
    B = 1;
    C = 1;
    #10;

    $display("Test Complete");

end
endmodule