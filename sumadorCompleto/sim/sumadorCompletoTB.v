module sumadorCompletoTB ();
  integer counter;
  wire S;
  wire Cout;

  sumadorCompleto DUV (
    .Cin (counter[2]),
    .A (counter[0]),
    .B (counter[1]),
    .S (S),
    .Cout (Cout)
  );

  initial begin
    for (counter = 0; counter < 8; counter = counter + 1) begin
      #10;
    end

    #10;
    $stop;
  end

endmodule
