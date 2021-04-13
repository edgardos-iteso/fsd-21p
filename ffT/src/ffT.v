module ffT
(
  clk,
  rst,
  t,
  q,
  q_n
);

  input clk;
  input rst;
  input t;
  output reg q;
  output reg q_n;

  always @ (posedge clk or negedge rst) begin
    if (!rst) begin
      q = 1'b0;
      q_n = 1'b1;
    end
    else begin
      if (t) begin
        q = ~q;
        q_n = ~q;
      end
      else begin
        q = q;
        q_n = q;
      end
    end
  end
endmodule
