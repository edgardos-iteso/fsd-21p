module kb7seg
(
  clk,
  rst_b,
  row,
  col,
  seg,
  dp,
  an,
  done
);

  localparam NBITS_COMPARE = 26;
  localparam COMPARE = 100_000; // 2ms/10ns/2

  input clk;
  input rst_b;
  input [3:0] row;
  output [3:0] col;
  output [6:0] seg;
  output dp;
  output reg [3:0] an;
  output done;

  wire equal2ms;
  reg [1:0] selDispTrans;
  reg [3:0] BCD;
  wire [3:0] key;
  wire rst;

  assign rst = !rst_b;

  keyboard4x4
  KB
  (
    .clk (clk),
    .rst (rst),
    .row (row),
    .col (col),
    .key (key),
    .done (done)
  );

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
        BCD = key;
        an = 4'b1110;
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


endmodule // kb7seg
