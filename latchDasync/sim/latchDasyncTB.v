module latchDasyncTB();
    reg D;
    reg Enable;
    wire Qa;
    wire Qb;

    latchDasync DUT
    (
        .D (D),
        .Enable (Enable),
        .Qa (Qa),
        .Qb (Qb)
    );

    initial begin
    D = 0;
    Enable = 0;

    #10
    D = 1;
    #2
    Enable = 1;
    #2
    Enable = 0;

    #10
    D = 0;
    #2
    Enable = 1;
    #2
    Enable = 0;

    #10
    D = 1;

    #10
    Enable = 1;
    #2
    Enable = 0;

    #20
    $stop;
    end
endmodule
