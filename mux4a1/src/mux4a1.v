module mux4a1(
  in1,
  in2,
  in3,
  in4,
  sel,
  outMux
);

  input [7:0] in1;
  input [7:0] in2;
  input [7:0] in3;
  input [7:0] in4;
  input [1:0] sel;
  output reg [7:0] outMux;

  /* assign condicional (operador ternario) */
  // assign outMux = (sel == 0) ? in1 :
  //                 (sel == 1) ? in2 :
  //                 (sel == 2) ? in3 : in4;

  /* if */
  // always @ * begin
  //   if (sel == 0) begin
  //     outMux = in1;
  //   end
  //   else if (sel == 1) begin
  //     outMux = in2;
  //   end
  //   else if (sel == 2) begin
  //     outMux = in3;
  //   end
  //   else begin
  //     outMux = in4;
  //   end
  // end

  /* case (lookup table)*/
  always @ * begin
    case (sel)
      2'b00 : outMux = in1;
      2'b01 : outMux = in2;
      2'b10 : outMux = in3;
      default : outMux = in4;
    endcase
  end
endmodule
