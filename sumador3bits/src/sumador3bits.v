module sumador3bits (
    input [2:0] B, A,
    output [2:0] S,
    output Cout
  );

  wire [2:0] carry;

  halfAdder SUM0(
    .A (A[0]),
    .B (B[0]),
    .S (S[0]),
    .Co (carry[0])
  );

  fullAdder SUM1(
    .Cin (carry[0]),
    .A (A[1]),
    .B (B[1]),
    .S (S[1]),
    .Cout (carry[1])
  );

  fullAdder SUM2(
    .Cin (carry[1]),
    .A (A[2]),
    .B (B[2]),
    .S (S[2]),
    .Cout (carry[2])
  );

  assign Cout = carry[2];

endmodule //2sumador3bits
