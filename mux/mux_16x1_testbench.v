`include "mux_16x1.v"

module mux_16x1_testbench;
//inputs and outputs
reg [15:0] data_in;
reg [3:0] select;
wire data_out;

initial begin
    //initialize inputs
    data_in=16'b0000000000000000;
    select=4'b0000;
    //save to vcd file
    $dumpfile("mux_16x1_testbench.vcd");
    $dumpvars(0, mux_16x1_testbench);
    $display("data_in\t\tselect\tdata_out");
    $monitor("%b %b    %b",data_in, select, data_out);
    //test case
    data_in=16'b0000100111101110;
    select=4'b0000;
    #10data_in=16'b1111111100111110;
    select=4'b0001;
    #10data_in=16'b0000001001011000;
    select=4'b0010;
    #10data_in=16'b0110010010110100;
    select=4'b0011;
    #10data_in=16'b0000000001000000;
    select=4'b0100;
    #10data_in=16'b0011110110000001;
    select=4'b1000;
    #10data_in=16'b0000101101010000;
    select=4'b0101;
    #10data_in=16'b1100000000000000;
    select=4'b1111;
    #10$finish;
end
//instantiate mux_16x1 module
mux_16x1 uut(
    .data_in(data_in),
    .select(select),
    .data_out(data_out)
);
endmodule