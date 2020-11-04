`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 08:28:14 PM
// Design Name: 
// Module Name: A_and_B
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


module A_and_B(A,B,Out);
    input logic [31:0] A, B;
    output logic [31:0] Out;
    assign Out=A&B;
endmodule
