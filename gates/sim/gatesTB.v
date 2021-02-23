`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/04/2021 12:15:00 PM
// Design Name:
// Module Name: gatesTB
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module gatesTB();
    reg tbA;
    reg tbB;
    wire tbOr;
    wire tbAnd;
    wire tbNot;

    gates DUV
    (
        .inA (tbA),
        .inB (tbB),
        .outputOr (tbOr),
        .outputAnd (tbAnd),
        .outputNot (tbNot)
    );

    initial begin
        tbA = 0;
        tbB = 0;

        #10
        tbA = 1;
        tbB = 0;

        #10
        tbA = 0;
        tbB = 1;

        #10
        tbA = 1;
        tbB = 1;

        #50
        $stop;
    end

endmodule
