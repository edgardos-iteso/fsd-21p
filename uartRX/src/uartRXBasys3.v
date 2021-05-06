module uartRXBasys3
(
  clk,
  btnD,
  RsRx,
  seg,
  dp,
  an,
  led
);

  parameter NBITS_COMPARE = 26;
  parameter COMPARE = 100_000; // 2ms/10ns/2

  input clk;
  input btnD;
  input RsRx;
  output [6:0] seg;
  output dp;
  output reg [3:0] an;
  output wire [1:0] led;

  wire [7:0] wDataRX;
  wire rst = !btnD;

  uartRX UART
  (
    .clk (clk),
    .rst (rst),
    .serialRX (RsRx),
    .dataRX (wDataRX),
    .done (led[0]),
    .busy (led[1])
  );

  wire equal2ms;
  reg [1:0] selDispTrans;
  reg [3:0] BCD;

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
        BCD = wDataRX[3:0];
        an = 4'b1110;
      end
      1: begin
        BCD = wDataRX[7:4];
        an = 4'b1101;
      end
      default: begin
        BCD = 4'd0;
        an = 4'b1111;
      end
  	endcase
  end

  bin7segLUT DEC7SEG
  (
    .A (BCD[0]),
    .B (BCD[1]),
    .C (BCD[2]),
    .D (BCD[3]),

    .a (seg[0]),
    .b (seg[1]),
    .c (seg[2]),
    .d (seg[3]),
    .e (seg[4]),
    .f (seg[5]),
    .g (seg[6])
  );

  assign dp = 1'b1;

endmodule
