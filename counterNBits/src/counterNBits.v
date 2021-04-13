module counterNBits
#(
  parameter nBits = 27
)
(
  input clk,
  input rst,
  input en,
  output [nBits-1:0] counter
);

  wire [nBits-1:0] wt;
  wire [nBits-1:0] wAnd;

  assign wAnd[0] = en;

  ffT FFT(.clk(clk), .rst(rst), .t(wAnd[0]), .q(wt[0]));

  genvar i;

  generate
    for (i = 1; i < nBits; i = i + 1) begin
      assign wAnd[i] = wAnd[i-1] & wt[i-1];

      ffT FFT(.clk(clk), .rst(rst), .t(wAnd[i]), .q(wt[i]));
    end
  endgenerate

  assign counter = wt;

endmodule // counterNBits
