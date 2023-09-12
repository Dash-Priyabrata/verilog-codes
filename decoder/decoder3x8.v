// Filename:- decoder3x8.v
module decoder3x8(
    data_in,
    data_out,
    enable
);
//declare inputs
input [2:0] data_in;
input enable;
//decalre outputs
output [7:0] data_out;
//declare port datatypes
wire [2:0] data_in;
reg [7:0] data_out;
wire enable;
//always block for decoder logic
always @(data_in)
begin
    if (enable==1'b1) begin // if logic circuit receives enable signal = 1
        case (data_in) // data out based on case
        3'b000: data_out = 8'b00000001; // selecting data_out line 0
        3'b001: data_out = 8'b00000010; // selecting data_out line 1
        3'b010: data_out = 8'b00000100; // selecting data_out line 2
        3'b011: data_out = 8'b00001000; // selecting data_out line 3
        3'b100: data_out = 8'b00010000; // selecting data_out line 4
        3'b101: data_out = 8'b00100000; // selecting data_out line 5
        3'b110: data_out = 8'b01000000; // selecting data_out line 6
        3'b111: data_out = 8'b10000000; // selecting data_out line 7
        default : data_out = 8'b00000000;
        endcase
    end else begin
        data_out = 8'bxxxxxxxx;
    end

end
endmodule
