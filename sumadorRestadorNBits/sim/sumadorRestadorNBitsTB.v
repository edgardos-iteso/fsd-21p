module sumadorRestadorNbitsTB ();

    localparam NBITS = 4;

    reg iOp;
    reg [NBITS-1:0] iX;
    reg [NBITS-1:0] iY;
    wire [NBITS-1:0] oS;
    wire oCout;
    wire oOverflow;

    integer op;
    integer x;
    integer y;

    sumadorRestadorNBits
    #(
        .NBITS (NBITS)
    ) DUT
    (
        .iOp (iOp),
        .iX (iX),
        .iY (iY),
        .oS (oS),
        .oCout (oCout),
        .oOverflow (oOverflow)
    );

    always @ * begin
        iOp = op[0];
        iX = x[NBITS-1:0];
        iY = y[NBITS-1:0];
    end

    initial begin
        iOp = 1'b0;
        iX = {NBITS{1'b0}};
        iY = {NBITS{1'b0}};

        for (op = 0; op <  2; op = op + 1) begin // iOp
            for (x = 0; x < 2**NBITS; x = x + 1) begin // iX
                for (y = 0; y < 2**NBITS; y = y + 1) begin // iY
                    #4;
                end
            end
        end

        #10
        $stop;
    end

endmodule
