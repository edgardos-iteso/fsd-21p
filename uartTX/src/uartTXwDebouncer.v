
module uartTXwDebouncer
(
    input i_clk, // 100 MHz
    input i_rst, // btnD
    input [7:0] i_data, // sw7-0
    input i_startTX, // btnU
    output o_busy,
    output o_done,
    output o_serialTX
);
    wire startDebounce;

    debouncer
    DEBOUNCER
    (
        .clk (i_clk),
        .rst (!i_rst),
        .sw_pb (i_startTX),
        .one_shot (startDebounce)
    );

    uartTX
    UARTTX
    (
        .i_clk (i_clk),
        .i_rst (!i_rst),
        .i_data (i_data),
        .i_startTX (startDebounce),
        .o_busy (o_busy),
        .o_done (o_done),
        .o_serialTX (o_serialTX)
    );
endmodule
