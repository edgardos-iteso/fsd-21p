module registerTB ( );
    localparam  NBITS = 8;

    reg clk;
    reg rst;
    reg [NBITS-1:0] data;
    wire [NBITS-1:0] dataReg1;
    wire [NBITS-1:0] dataReg2;

    register8bits DUT1
    (
        .clk (clk),
        .rst (rst),
        .data (data),
        .dataReg (dataReg1)
    );

    registerNbits
    #(
        .NBITS (8)
    ) DUT2
    (
        .clk (clk),
        .rst (rst),
        .data (data),
        .dataReg (dataReg2)
    );

    always begin
        #1 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;
        data = 0;

        #10
        data = 1;

        #10
        rst = 1;

        #10
        data = 2;

        #20
        $stop;
    end

endmodule
