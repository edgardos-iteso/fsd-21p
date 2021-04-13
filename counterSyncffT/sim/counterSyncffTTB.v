module counterSyncffTTB ( );
  reg clk;
  reg rst;
  reg en;
  wire [3:0] counter;

  counterSyncffT DUT(
    .clk (clk),
    .rst (rst),
    .en (en),
    .counter (counter)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    clk = 0;
    en = 0;
    rst = 1;

    #4;
    rst = 0;

    #4
    rst = 1;

    #4
    en = 1;

    #20
    $stop;
  end
endmodule
