module latchSRasyncTB();
    reg S;
    reg R;
    reg Enable;
    wire Qa;
    wire Qb;

    latchSRasync DUT
    (
        .S (S),
        .R (R),
        .Enable (Enable),
        .Qa (Qa),
        .Qb (Qb)
    );

    initial begin
    S = 0;
    R = 0;
    Enable = 0;

    // Set
    #10
    S = 1;
    R = 0;
    Enable = 1;
    #2
    S = 0;
    R = 0;
    Enable = 0;

    // Reset
    #10
    S = 0;
    R = 1;
    Enable = 1;
    #2
    S = 0;
    R = 0;
    Enable = 0;

    // Set
    #10
    S = 1;
    R = 0;
    #2
    S = 0;
    R = 0;

    // Set
    #10
    S = 1;
    R = 0;
    Enable = 1;
    #2
    S = 0;
    R = 0;
    Enable = 0;

    // Reset
    #10
    S = 0;
    R = 1;
    #2
    S = 0;
    R = 0;

    // Reset
    #10
    S = 0;
    R = 1;
    Enable = 1;
    #2
    S = 0;
    R = 0;
    Enable = 0;

    #20
    $stop;
    end
endmodule
