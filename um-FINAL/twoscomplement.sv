`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 12:02:51 PM
// Design Name: 
// Module Name: twoscomplement
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


module twoscomplement(    
    input logic [31:0] a,
    output logic[31:0] y1 //twos complement

    );
    
    assign y1=~a+1'b1; 


endmodule
