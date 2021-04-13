module register8bits
(
    clk,
    rst,
    data,
    dataReg
);
    localparam  NBITS = 8;

    input clk;
    input rst;
    input [NBITS-1:0] data;
    output reg [NBITS-1:0] dataReg;

    always @ (posedge clk) begin
        if (!rst)
            dataReg = 0;
        else
            dataReg = data;
    end

endmodule
