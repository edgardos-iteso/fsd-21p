`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: FUNDAMENTOS DE SISTEMAS DIGITALES
// Create Date: 02/16/2021 11:38:56 AM
//////////////////////////////////////////////////////////////////////////////////

module mux2a1TB( );
  reg A;
  reg B;
  reg Sel;
  wire Y;

  integer x;
  integer y;
  integer z;

  mux2a1 DUV(
    .A (A),
    .B (B),
    .Sel (Sel),
    .Y (Y)
  );

  initial begin
    A = 0;
    B = 0;
    Sel = 0;

    for (z = 0; z < 2; z = z + 1) begin
      for (y = 0; y < 2; y = y + 1) begin
        for (x = 0; x < 2; x = x + 1) begin
          #10
          A = x;
          B = y;
          Sel = z;
        end // for x
      end // for y
    end // for z

    #50
    $stop;
  end // initial
endmodule
