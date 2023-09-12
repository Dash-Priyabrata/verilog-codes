module mux_4x1(
    data_in,
    select,
    data_out
);
//declare inputs and outputs
input [3:0] data_in; //4 bit
input [1:0] select; // 2 bit
output data_out;
//declare port datatype
wire [3:0] data_in;
wire [1:0] select;
wire data_out;
//logic
assign data_out = (select==2'b00)?data_in[0]:(select==2'b01)?data_in[1]:(select==2'b10)?data_in[2]:data_in[3];
endmodule

module mux_16x1(
    data_in,
    select,
    data_out
);
//declare inputs and outputs
input [15:0] data_in;
input [3:0] select;
output data_out;
//declare portdata type
wire [15:0] data_in;
wire [3:0] select;
wire data_out;
//extra wires for intermediate connections
wire [3:0] data_out_intermediate;
//logic using mux_4x1 module
//mux-1 to select using select[0:1] for data_in[0:3] 
mux_4x1 u0(
    .data_in(data_in[3:0]),
    .select(select[1:0]),
    .data_out(data_out_intermediate[0])
);
//mux-2 to select using select[0:1] for data_in[4:7] 
mux_4x1 u1(
    .data_in(data_in[7:4]),
    .select(select[1:0]),
    .data_out(data_out_intermediate[1])
);
//mux-3 to select using select[0:1] for data_in[8:11] 
mux_4x1 u2(
    .data_in(data_in[11:8]),
    .select(select[1:0]),
    .data_out(data_out_intermediate[2])
);
//mux to select using select[0:1] for data_in[12:15] 
mux_4x1 u3(
    .data_in(data_in[15:12]),
    .select(select[1:0]),
    .data_out(data_out_intermediate[3])
);
//mux to select using select[2:3] for {data_in_3, data_in_2, data_in_1, data_in_0} 
mux_4x1 u4(
    .data_in(data_out_intermediate),
    .select(select[3:2]),
    .data_out(data_out)
);
endmodule