module counterNBitsTB ( );
  localparam  NBITS = 16;
  reg clk;
  reg rst;
  reg en;
  wire [NBITS-1:0] counter;

  integer i;

  counterNBits
  #(
    .nBits (NBITS)
  )
  DUT
  (
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
    $monitor("Counter - %d", counter);

    #4;
    rst = 0;

    #4
    rst = 1;

    #4
    en = 1;

    for(i = 0; i < 2; i = i + 1) begin
      while (counter < ((2**NBITS)-1)) begin
        #2;
      end
      #2;
    end

    #200
    $stop;
  end
endmodule
