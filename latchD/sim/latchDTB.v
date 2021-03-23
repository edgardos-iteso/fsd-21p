module latchDTB ();
    reg d;
    reg en;
    wire q_gates;
    wire q_n_gates;
    wire q_behavioral;
    wire q_n_behavioral;

    latchD_gates DUT1
    (
        .d (d),
        .en (en),
        .q (q_gates),
        .q_n (q_n_gates)
    );

    latchD_behavioral DUT2
    (
        .d (d),
        .en (en),
        .q (q_behavioral),
        .q_n (q_n_behavioral)
    );

    initial begin
        d = 0;
        en = 0;

        #10
        d = 1;

        #10
        en = 1;

        #10
        d = 0;

        #10
        en = 0;

        #10
        d = 1;

        #20
        $stop;
    end

endmodule // latchD
