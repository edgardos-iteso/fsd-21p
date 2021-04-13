module counter7Seg
(
  input clk,
  input rst,
  input en,

  output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g
);

  wire [3:0] counter;

  counterSyncffT CNTR(
    .clk (clk),
    .rst (rst),
    .en (en),
    .counter (counter)
  );

  bcd7segSOP BCD7SEG(
    .A (counter[0]),
    .B (counter[1]),
    .C (counter[2]),
    .D (counter[3]),

    .a (a),
    .b (b),
    .c (c),
    .d (d),
    .e (e),
    .f (f),
    .g (g)
  );
endmodule
