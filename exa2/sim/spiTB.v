`timescale 10ns / 1ns

module spiTB ();
    reg clk;
    reg rst;
    reg start;
    reg [7:0] dataTX;
    wire mosi;
    wire ss;
    wire sclk;

    exa2
    DUT
    (
      .clk (clk),
      .rst (rst),
      .start (start),
      .dataTX (dataTX),
      .mosi (mosi),
      .ss (ss),
      .sck (sclk)
    );

    always begin
        #0.5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        dataTX = 0;

        #10
        rst = 0;

        #10
        rst = 1;

        #10
        dataTX = 8'b11011010;
        start = 1;

        #8
        start = 0;

        #100
        $stop;
    end

endmodule
