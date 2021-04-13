module registerNbits
(
    clk,
    rst,
    data,
    dataReg
);
    parameter NBITS = 16;

    input clk;
    input rst;
    input [NBITS-1:0] data;
    output wire [NBITS-1:0] dataReg;

    genvar i;

    generate
    for (i = 0; i < NBITS; i = i + 1) begin
        ffD FFD
        (
            .d (data[i]),
            .clk (clk),
            .q (dataReg[i])
        );
    end
    endgenerate

endmodule
