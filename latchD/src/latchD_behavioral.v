module latchD_behavioral
(
    d,
    en,
    q,
    q_n
);
    input d;
    input en;
    output reg q;
    output reg q_n;

    always @ (en or d) begin
      if(en == 1) begin
        q = d;
        q_n = ~d;
      end
      else begin
        q = q;
        q_n = q_n;
      end
    end

endmodule // latchD
