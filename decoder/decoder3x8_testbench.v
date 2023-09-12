// Filename:- decoder3x8_testbench.v
`include "decoder3x8.v"

module decoder3x8_testbench;
// //inputs and outputs
// input [2:0] data_in;
// input enable;
// output [7:0] data_out;
//datatype declaration
reg [2:0] data_in;
reg enable;
wire [7:0] data_out;
//test bench variable initilisation 
initial begin
    $dumpfile("decoder3x8_testbench.vcd");
    $dumpvars(0, decoder3x8_testbench);
    $display("enable\t data_in\t data_out");
    $monitor("%b\t %b\t %b\t ", enable, data_in, data_out);
    data_in = 3'b001;
    #10data_in = 3'b010;
    #10data_in = 3'b011;
    #10data_in = 3'b000;
    #10data_in = 3'b001;
    #10data_in = 3'b010;
    #10data_in = 3'b011;
    #10data_in = 3'b100;
    #10data_in = 3'b101;
    #10data_in = 3'b110;
    #10data_in = 3'b111;
end
initial begin
    enable=1'b0;
    #30enable = 1'b1;
end

decoder3x8 uut(
    .enable(enable),
    .data_in(data_in),
    .data_out(data_out)
);
endmodule