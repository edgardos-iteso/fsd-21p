
module bin7segSOP(
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
