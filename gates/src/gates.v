`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/02/2021 12:31:23 PM
// Design Name:
// Module Name: gates
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
// >(_8(|)
// Dependencies:
//
// Revision:fsdfsdf
// Additional Comments:
//Saben como hacerle para que me aparezca el input de color como el profeNELPAS
// Es por el theme que tiene instalado
//
//eL nada teme nada borra
//////////////////////////////////////////////////////////////////////////////////


module gates(
    input inA,
    input inB,
    output outputOr,
    output outputAnd,
    output outputNot
    );

    assign outputOr = inA | inB;
    assign outputAnd = inA & inB;
    assign outputNot = ~inA;

endmodule
