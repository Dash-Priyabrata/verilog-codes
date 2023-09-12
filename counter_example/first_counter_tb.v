`include "first_counter.v"

module first_counter_tb();
//Declare inputs as reg and outputs as wires
reg clock;
reg enable;
reg reset;
wire [3:0] counter_out;
//Initialize all variables
initial begin
    $dumpfile("first_counter_tb.vcd");
    $dumpvars(0, first_counter_tb);
    $display("time\t clk reset enable counter");
    $monitor("%g\t %b   %b     %b      %b", $time, clock, reset, enable, counter_out);
    clock = 1; //initial value of the clock
    reset = 0; //initial value of the reset
    enable = 0; //initial value of the enable
    #5 reset = 1; //Assert the reset
    #10 reset = 0; //De assert the reset
    #10 enable = 1; //Assert the enable
    #100 enable = 0; //De-assert the enable
    #5 $finish; //Terminate simulation
end
//Clock generator
always begin
    #5 clock = ~clock; //Toggle every 5 clicks
end

// Connect DUT(Device under test) to test_bench
first_counter U_counter(clock,reset,enable, counter_out);
endmodule

