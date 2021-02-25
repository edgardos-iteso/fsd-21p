module sumador2bits(
  input [1:0] B, A,
  output Cout,
  output [1:0] S
);

  wire carry;
  wire Cy0;
  wire Cin;

  assign carry = Cy0;
  assign Cin = carry;

  /* medio sumador */
  assign S[0] = A[0] ^ B[0];
  assign Cy0 = A[0] & B[0];

  /* sumador completo */
  assign S[1] = A[1] ^ B[1] ^ Cin;
  assign Cout = (Cin & A[1]) | (Cin & B[1]) | (A[1] & B[1]);

endmodule
