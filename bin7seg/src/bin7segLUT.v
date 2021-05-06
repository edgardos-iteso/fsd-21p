
module bin7segLUT(
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

  reg [6:0] seg7;

  assign {a, b, c, d, e, f, g} = seg7;

  always @ * begin
    case ({D, C, B, A})
      4'b0000: seg7 = 7'b0000001;
      4'b0001: seg7 = 7'b1001111;
      4'b0010: seg7 = 7'b0010010;
      4'b0011: seg7 = 7'b0000110;
      4'b0100: seg7 = 7'b1001100;
      4'b0101: seg7 = 7'b0100100;
      4'b0110: seg7 = 7'b0100000;
      4'b0111: seg7 = 7'b0001111;
      4'b1000: seg7 = 7'b0000000;
      4'b1001: seg7 = 7'b0000100;
      4'b1010: seg7 = 7'b0001000;
      4'b1011: seg7 = 7'b1100000;
      4'b1100: seg7 = 7'b0110001;
      4'b1101: seg7 = 7'b1000010;
      4'b1110: seg7 = 7'b0110000;
      4'b1111: seg7 = 7'b0111000;
      default: seg7 = 7'b1111111;
    endcase
  end

endmodule
