module halfAdder (
  A,
  B,
  S,
  Co
);

  input A;
  input B;
  output S;
  output Co;

  assign S = A ^ B;

  assign Co = A & B;

endmodule
