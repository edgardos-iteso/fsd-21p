module sweep4disp7seg
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
	output reg [7:0] seg,
	output reg [3:0] dispTrans
);

  wire equal2ms;

  countCompare
  #(
    .NBITS(NBITS_COMPARE)
  ) COUNTCOMPARE
  (
    .clk (clk),
    .rst (rst),
    .compareValue (COMPARE),
    .equal (equal2ms)
  );

  reg [1:0] selDispTrans;
  reg [3:0] BCD;

  always @ (posedge clk or negedge rst) begin
    if (!rst) begin
      selDispTrans = 2'b00;
    end
	  else begin
      if (equal2ms) begin
        selDispTrans = selDispTrans + 1'b1;
      end
    end
  end

  always @ * begin
    case (selDispTrans)
      0: begin
        BCD = disp0;
        dispTrans = 4'b1110;
      end
      1: begin
        BCD = disp1;
        dispTrans = 4'b1101;
      end
      2: begin
        BCD = disp2;
        dispTrans = 4'b1011;
      end
      3: begin
        BCD = disp3;
        dispTrans = 4'b0111;
      end
      default: begin
        BCD = disp3;
        dispTrans = 4'b1111;
      end
  	endcase
  end

  always @ * begin
    case (BCD)
      0: seg = 8'b11000000;
      1: seg = 8'b11111001;
      2: seg = 8'b10100100;
      3: seg = 8'b10110000;
      4: seg = 8'b10011001;
      5: seg = 8'b10010010;
      6: seg = 8'b10000010;
      7: seg = 8'b11111000;
      8: seg = 8'b10000000;
      9: seg = 8'b10010000;
      default: seg = 8'b11111111;
    endcase
  end
endmodule
