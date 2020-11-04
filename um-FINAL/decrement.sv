`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 08:44:51 PM
// Design Name: 
// Module Name: decrement
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


module decrement(
    input [31:0] A,
    output [31:0] Out
    );
    
    assign Out = A - 1;
    
endmodule
