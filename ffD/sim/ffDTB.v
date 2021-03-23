module ffDTB ( );

    reg d;
    reg clk;
    wire q;
    wire q_n;

    ffD DUT
    (
        .d (d),
        .clk (clk),
        .q (q),
        .q_n (q_n)
    );

    always begin
        #1 clk = ~clk;
    end

    initial begin
        d = 0;
        clk = 0;

        #10
        d = 1;

        #10
        d = 0;

        #10
        d = 1;

        #20
        $stop;
    end

endmodule
