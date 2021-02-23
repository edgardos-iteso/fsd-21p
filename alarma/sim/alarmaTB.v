`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/09/2021 12:30:04 PM
// Design Name:
// Module Name: alarmaTB
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


module alarmaTB( );

  reg A;
  reg P;
  reg Co;
  reg Ca;
  reg G;
  reg V;
  reg Pa;
  wire Bocina;
  wire Bocina2;

  reg [4:0] shifter;
  integer idx;

  alarma DUV (
    .A (A),
    .P (shifter[0]),
    .Co (shifter[1]),
    .Ca (shifter[2]),
    .G (shifter[3]),
    .V (shifter[4]),
    .Pa (Pa),
    .Bocina (Bocina)
  );

  alarma2 DUV2 (
    .A (A),
    .P (shifter[0]),
    .Co (shifter[1]),
    .Ca (shifter[2]),
    .G (shifter[3]),
    .V (shifter[4]),
    .Pa (Pa),
    .Bocina (Bocina2)
  );

  initial begin
  A = 0;
  P = 0;
  Co = 0;
  Ca = 0;
  G = 0;
  V = 0;
  Pa = 0;

  shifter = 0;

  #10
  Pa = 1;

  #10
  Pa = 0;
  A = 1;

  #10
  shifter = 5'b00001;

  for (idx = 0; idx < 5; idx = idx + 1) begin
    #10
    shifter = shifter << 1;
  end

  #10
  shifter = 5'h00;

  #50
  $stop;
  end
endmodule
