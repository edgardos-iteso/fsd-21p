module sumador2bitsTB ();
  reg [1:0] A, B;
  wire Cout;
  wire [1:0] S;

  integer i = 0;
  integer j = 0;

  sumador2bits DUV (
    .A(A),
    .B(B),
    .Cout(Cout),
    .S(S)
  );

  initial begin
    A = 0;
    B = 0;

    #10
    for(i = 0; i < 4; i=i+1)begin
      for(j = 0; j < 4; j=j+1)begin
        #10
        A = j;
        B = i;
      end
    end

    #20
    $stop;
  end

endmodule //sumador2bitsTB
