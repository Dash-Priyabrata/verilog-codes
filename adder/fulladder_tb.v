//filename:- fulladder.v
module full_adder(
    a,
    b,
    ci,
    s,
    co
);
//define inputs
input a;
input b;
input ci;
//define outputs
output s;
output co;
//data type of ports
reg s;
reg co;
wire a;
wire b;
wire ci;
//Code starts here
always @(*) begin
s = a^b^ci;
co = (a&b)|(a&ci)|(b&ci);
end
endmodule

