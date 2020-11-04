`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 08:57:19 PM
// Design Name: 
// Module Name: ShLeft
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


module ShLeft(x, s);
    input logic [31:0]x;
    output logic [31:0]s;
    assign s = x << 1;

endmodule
