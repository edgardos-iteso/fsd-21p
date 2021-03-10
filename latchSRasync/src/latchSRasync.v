module latchSRasync
(
    S,
    R,
    Enable,
    Qa,
    Qb
);

    input S;
    input R;
    input Enable;
    output reg Qa;
    output reg Qb;

    always @ * begin
        if (Enable == 1) begin
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
        else begin
            Qa = Qa;
            Qb = Qb;
        end
    end

endmodule
