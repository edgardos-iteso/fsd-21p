module latchSRTB();
    reg S;
    reg R;
    wire Qa;
    wire Qb;

    latchSR DUT
    (
        .S (S),
        .R (R),
        .Qa (Qa),
        .Qb (Qb)
    );

    initial begin
    S = 0;
    R = 0;

    // Set
    #10
    S = 1;
    R = 0;
    #2
    S = 0;
    R = 0;

    // Reset
    #10
    S = 0;
    R = 1;
    #2
    S = 0;
    R = 0;

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
    #2
    S = 0;
    R = 0;

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
    #2
    S = 0;
    R = 0;

    #20
    $stop;
    end
endmodule
