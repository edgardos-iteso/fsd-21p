module uartLoopback
(
  clk, // 100 MHz
  rst,
  serialRX,
  serialTX
);

  input clk;
  input rst;
  input serialRX;
  output serialTX;

  wire doneUART;
  wire [7:0] dataUART;

  uartRX RX
  (
    .clk (clk),
    .rst (!rst),
    .serialRX (serialRX),
    .dataRX (dataUART),
    .done (doneUART)
  );

  uartTX TX
  (
    .i_clk (clk),
    .i_rst (!rst),
    .i_data ((dataUART + 1'b1)),
    .i_startTX (doneUART),
    .o_serialTX (serialTX)
  );

endmodule // uartLoopback
