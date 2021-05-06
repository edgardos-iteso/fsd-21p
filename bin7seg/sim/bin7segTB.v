`timescale 1ns / 1ps

module bin7segTB( );
  reg [3:0] counter;

  wire aSOP;
  wire aLUT;

  wire bSOP;
  wire bLUT;

  wire cSOP;
  wire cLUT;

  wire dSOP;
  wire dLUT;

  wire eSOP;
  wire eLUT;

  wire fSOP;
  wire fLUT;

  wire gSOP;
  wire gLUT;

  integer iterador;

  bin7segSOP DUV1 (
    .A (counter[0]),
    .B (counter[1]),
    .C (counter[2]),
    .D (counter[3]),

    .a (aSOP),
    .b (bSOP),
    .c (cSOP),
    .d (dSOP),
    .e (eSOP),
    .f (fSOP),
    .g (gSOP)
  );

  bin7segLUT DUV2 (
    .A (counter[0]),
    .B (counter[1]),
    .C (counter[2]),
    .D (counter[3]),

    .a (aLUT),
    .b (bLUT),
    .c (cLUT),
    .d (dLUT),
    .e (eLUT),
    .f (fLUT),
    .g (gLUT)
  );

  initial begin
    counter = 4'h0;

    for(iterador = 0; iterador < 16; iterador = iterador + 1) begin
        #10
        counter = iterador;
    end

    #50
    $stop;
  end
endmodule
