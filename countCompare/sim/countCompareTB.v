module countCompareTB ();
  localparam NBITS = 8;

  reg	clk;
  reg rst;
  reg	[NBITS-1:0] compareValue;
  wire equal;

  countCompare
  #(
    .NBITS (NBITS)
  ) DUT
  (
    .clk (clk),
    .rst (rst),
    .compareValue (compareValue),
    .equal (equal)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    clk = 0;
    rst = 1;
    compareValue = 0;

    #10
    rst = 0;
    compareValue = 20;

    #10
    rst = 1;

    while (!equal) begin
      #1;
    end

    #20
    $stop;
  end

endmodule
