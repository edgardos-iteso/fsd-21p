module latchDasync
(
    D,
    Enable,
    Qa,
    Qb
);

    input D;
    input Enable;
    output Qa;
    output Qb;

    wire nand1;
    wire nand2;
    wire nand3;
    wire nand4;

    assign nand1 = ~(D & Enable);
    assign nand2 = ~(nand1 & nand4);

    assign nand3 = ~(~D & Enable);
    assign nand4 = ~(nand3 & nand2);

    assign Qa = nand2;
    assign Qb = nand4;

    // always @ * begin
    //     if (Enable == 1) begin
    //         Qa = D;
    //         Qb = ~D;
    //     end
    //     else begin
    //         Qa = Qa;
    //         Qb = Qb;
    //     end
    // end

endmodule
