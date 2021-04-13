module ffTTB;
  reg clk;
  reg rst;
  reg t;
  wire q;
  wire q_n;

  ffT DUT
  (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q),
    .q_n (q_n)
  );

  always #1 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    t = 0;

    #4
    rst = 0;

    #10
    rst = 1;

    #10
    t = 1;

    #20
    t = 0;

    #12
    t = 1;

    #10
    t = 0;

    #20
    $stop;
  end
endmodule
