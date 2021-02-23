`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: FUNDAMENTOS DE SISTEMAS DIGITALES
// Create Date: 02/16/2021 11:38:56 AM
//////////////////////////////////////////////////////////////////////////////////

module mux4a1TB( );
  wire [7:0] y;

  integer a; // in1
  integer b; // in2
  integer c; // in3
  integer d; // in4
  integer m; // sel

  mux4a1 DUV(
    .in1 (a),
    .in2 (b),
    .in3 (c),
    .in4 (d),
    .sel (m),
    .outMux (y)
  );

  initial begin
    a = 0;
    b = 0;
    c = 0;
    d = 0;
    m = 0;

    for (d = 0; d < 2; d = d + 1) begin
      for (c = 0; c < 2; c = c + 1) begin
        for (b = 0; b < 2; b = b + 1) begin
          for (a = 0; a < 2; a = a + 1) begin
            for (m = 0; m < 4; m = m + 1) begin
              #10;
            end // for m
          end // for a
        end // for b
      end // for c
    end // for d

    #20
    $stop;
  end // initial
endmodule
