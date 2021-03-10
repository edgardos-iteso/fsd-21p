module latchSR
(
    S,
    R,
    Qa,
    Qb
);

    input S;
    input R;
    output reg Qa;
    output reg Qb;

    always @ * begin
        if (S == 1) begin
            Qa = 1;
            Qb = 0;
        end
        else if (R == 1) begin
            Qa = 0;
            Qb = 1;
        end
        else begin
            Qa = Qa;
            Qb = Qb;
        end
    end

endmodule
