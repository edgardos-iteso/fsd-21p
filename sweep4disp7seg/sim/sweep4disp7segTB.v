module sweep4disp7segTB ();

  localparam NBITS_COMPARE = 26;
  localparam COMPARE = 200;

  reg clk;
  reg rst;
  reg [3:0] disp0;
  reg [3:0] disp1;
  reg [3:0] disp2;
  reg [3:0] disp3;
  wire [7:0] seg;
	wire [3:0] dispTrans;

  sweep4disp7seg
  #(
    .NBITS_COMPARE (NBITS_COMPARE),
    .COMPARE (COMPARE)
  ) DUT
  (
    .clk (clk),
    .rst (rst),
    .disp0 (disp0),
    .disp1 (disp1),
    .disp2 (disp2),
    .disp3 (disp3),
  	.seg (seg),
  	.dispTrans (dispTrans)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    clk = 0;
    rst = 1;
    disp0 = 0;
    disp1 = 0;
    disp2 = 0;
    disp3 = 0;

    #10
    rst = 0;
    disp0 = 1;
    disp1 = 2;
    disp2 = 3;
    disp3 = 4;

    #10
    rst = 1;

    #1000
    $stop;
  end

endmodule
