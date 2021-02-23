`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/16/2021 11:21:03 AM
// Design Name:
// Module Name: mux2a1
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


module mux2a1(
  A,
  B,
  Sel,
  Y
);

  input A;
  input B;
  input Sel;
  output Y;

  // assign Y = (A & ~Sel) | (B & Sel);

  assign Y = Sel ? B : A;

endmodule
