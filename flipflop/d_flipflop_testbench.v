//filename:- d_filflop_testbench.v
`include "d_flipflop.v"

module d_flipflop_testbench;
//input ports
reg data;
reg clk;
reg reset;
reg set;
//output ports
wire Q;
wire Q_bar;

//initial block
initial begin
    clk = 0; //start value for clock
    data = 0; // start value for data
    reset = 0; // start value for reset
    set = 0; // start value for reset
    $dumpfile("d_flipflop_testbench.vcd");
    $dumpvars(0, d_flipflop_testbench);
    $display("time\t clk   set   reset   data     Q    Q_bar");
    $monitor("%g\t %b\t %b\t %b\t %b\t %b\t %b ",$time,clk,set,reset,data,Q,Q_bar);
    #10data = 1'b1;
    #10set = 1'b0;
    #10set =  1'b1;
    #10reset = 1'b0;
    #10reset = 1'b1;
    #10data= 1'b0;
    #5data=1'b1;
    #5data=1'b0;
    #5data=1'b1;
    #5data=1'b0;
    $finish;
end

always begin
    #5clk = ~clk; // toggle clock every 5 unit time 
end

// call "d_flipflop_1bit" module to run the test bech
d_flipflop_1bit uut(
    .data(data),
    .clk(clk),
    .reset(reset),
    .set(set),
    .Q(Q),
    .Q_bar(Q_bar)
);
endmodule