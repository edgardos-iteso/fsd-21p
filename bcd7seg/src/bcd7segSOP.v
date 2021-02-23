`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/10/2021 07:58:09 PM
// Design Name:
// Module Name: bin7seg
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


module bcd7segSOP(
  input A,
  input B,
  input C,
  input D,

  output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g
);

  assign a = (A & ~B & ~C & ~D) | (~A & ~B & C & ~D) | (A & B & ~C & D) | (A & ~B & C & D);
  assign b = (A & ~B & C & ~D) | (~A & B & C & ~D) | (A & B & ~C & D) | (~A & ~B & C & D) | (~A & B & C & D) | (A & B & C & D);
  assign c = (~A & B & ~C & ~D) | (~A & ~B & C & D) | (~A & B & C & D) | (A & B & C & D);
  assign d = (A & ~B & ~C & ~D) | (~A & ~B & C & ~D) | (A & B & C & ~D) | (~A & B & ~C & D) | (A & B & C & D);
  assign e = (A & ~B & ~C & ~D) | (A & B & ~C & ~D) | (~A & ~B & C & ~D) | (A & ~B & C & ~D) | (A & B & C & ~D) | (A & ~B & ~C & D);
  assign f = (A & ~B & ~C & ~D) | (~A & B & ~C & ~D) | (A & B & ~C & ~D) | (A & B & C & ~D) | (A & ~B & C & D);
  assign g = (~A & ~B & ~C & ~D) | (A & ~B & ~C & ~D) | (A & B & C & ~D) | (~A & ~B & C & D);

endmodule
