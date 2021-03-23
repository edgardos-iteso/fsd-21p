module ffD
(
    d,
    clk,
    q,
    q_n
);

    input d;
    input clk;
    output reg q;
    output reg q_n;

    always @ (posedge clk) begin
        q = d;
        q_n = ~d;
    end

endmodule
