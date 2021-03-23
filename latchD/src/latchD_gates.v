module latchD_gates
(
    d,
    en,
    q,
    q_n
);
    input d;
    input en;
    output q;
    output q_n;

    wire w_not;
    wire w_nand1;
    wire w_nand3;

    not not1 (w_not, d);

    nand nand1 (w_nand1, d, en);
    nand nand2 (q, w_nand1, q_n);
    nand nand3 (w_nand3, en, w_not);
    nand nand4 (q_n, q, w_nand3);

endmodule // latchD
