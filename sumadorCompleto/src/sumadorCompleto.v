module sumadorCompleto (
  Cin,
  A,
  B,
  S,
  Cout
);

  input Cin;
  input A;
  input B;
  output S;
  output Cout;

  assign S = A ^ B ^ Cin;
  assign Cout = (B & A) | (Cin & A) | (Cin & B);

endmodule
