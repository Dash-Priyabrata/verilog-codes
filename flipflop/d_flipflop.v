//filename:- d_flipflop.v
module d_flipflop_1bit(
data,
clk,
reset,
set,
Q,
Q_bar
);
//declare inputs
input data;
input clk;
input reset;
input set;
//Declare outputs
output Q;
output Q_bar;
//declare port datatypes
wire data;
wire clk;
wire reset;
wire set;
reg Q;
//logic
assign Q_bar = ~Q;
always @(posedge clk) begin
    if (reset==1'b1) begin
        Q<=0; //set dff to 0
    end
    else if (set==1'b1) begin
        Q <= 1; //set dff to 1
    end
    else begin
        Q<=data;
    end
end
endmodule