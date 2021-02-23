module medioSumador (
  A,
  B,
  Suma,
  Carry
);

  input A;
  input B;
  output Suma;
  output Carry;

  // assign Suma = (~A & B) | (A & ~B);
  assign Suma = A ^ B;

  assign Carry = A & B;

endmodule
