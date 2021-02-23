`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/09/2021 11:43:50 AM
// Design Name:
// Module Name: alarma
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


module alarma(
    input A,
    input P,
    input Co,
    input Ca,
    input G,
    input V,
    input Pa,
    output Bocina
    );

    wire or1;
    wire or2;
    wire and1;
    wire and2;
    wire and3;

    assign or1 = Co|Ca;
    assign or2 = G|V;

    assign and1 = A&P;
    assign and2 = A&or1;
    assign and3 = or2&A;

    assign Bocina = and1|and2|and3|Pa;

    // assign Bocina = (A&P)|(A&(Co|Ca))|(A&(V|G)|Pa);


endmodule
