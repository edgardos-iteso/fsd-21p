`timescale 10ns/1ns

module uartTXTB ( );
  reg i_clk;
  reg i_rst;
  reg [7:0] i_data;
  reg i_startTX;
  wire o_busy;
  wire o_done;
  wire o_serialTX;

  uartTX
  #(
    .CLK_DIVIDER (10_417),
    .NBITS_DIVIDER (14)
  )
  DUT
  (
    i_clk,
    i_rst,
    i_data,
    i_startTX,
    o_busy,
    o_done,
    o_serialTX
  );

  always begin
    #0.5 i_clk = ~i_clk;
  end

  initial begin
    i_clk = 0;
    i_rst = 1;
    i_data = 0;
    i_startTX = 0;

    #50
    i_rst = 0;

    #50
    i_rst = 1;

    #10
    i_data = 8'b01101101;

    #100
    i_startTX = 1'b1;

    #10
    i_startTX = 1'b0;

    while (!o_done) begin
      #1;
    end

    #200
    $stop();
  end

endmodule
