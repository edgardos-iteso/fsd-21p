module sweep4disp7segBasys3
#(
  parameter NBITS_COMPARE = 26,
  parameter COMPARE = 100_000 // 2ms/10ns/2
)
(
  input clk,
  input rst,
  input [3:0] disp0,
  input [3:0] disp1,
  input [3:0] disp2,
  input [3:0] disp3,
	output [7:0] seg,
	output [3:0] dispTrans
);

  sweep4disp7seg
  #(
    .NBITS_COMPARE (NBITS_COMPARE),
    .COMPARE (COMPARE)
  ) DISPLAYS
  (
    .clk (clk),
    .rst (!rst),
    .disp0 (disp0),
    .disp1 (disp1),
    .disp2 (disp2),
    .disp3 (disp3),
    .seg (seg),
    .dispTrans (dispTrans)
  );
endmodule
