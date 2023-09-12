// -------Counter design specs--------
// 4 bit synchronous up counter
// Active high enable

module first_counter (
    clock, // Clock input design
    reset, // Active high, synchronous reset input
    enable, // Active high Enable signal for counter
    counter_out // 4 bit vector output of the counter
); // End of port list
//Input ports
input clock;
input reset;
input enable;
//Output ports
output [3:0] counter_out;
//Input port datatypes
//By rule all input port should be wires
wire clock;
wire reset;
wire enable;
//Output port datatype
// Output port can be storage elements or wires
reg [3:0] counter_out;

//Code start
//Since the counter is edge trigger one 
//We trigger the below block with respective positive edge of the clock
always @(posedge clock)
begin: COUNTER //Block name
// At every rising edge of the clock we check if the reset is active
// if active; we load the counter with 4'b0000
if (reset==1'b1) begin
    counter_out <= #1 4'b0000;
    end
else if (enable==1'b1) begin
    counter_out <= counter_out+1;
    end
end
endmodule
