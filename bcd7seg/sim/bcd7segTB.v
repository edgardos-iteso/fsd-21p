`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/10/2021 08:19:29 PM
// Design Name:
// Module Name: bin7segTB
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module bcd7segTB( );
  reg [3:0] counter;

  wire aSOP;
  wire bSOP;
  wire cSOP;
  wire dSOP;
  wire eSOP;
  wire fSOP;
  wire gSOP;

  wire aLUT;
  wire bLUT;
  wire cLUT;
  wire dLUT;
  wire eLUT;
  wire fLUT;
  wire gLUT;

  integer iterador;

  bcd7segSOP DUV1 (
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

  bcd7segLUT DUV2 (
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
