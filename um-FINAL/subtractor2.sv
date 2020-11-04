`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 03:25:09 PM
// Design Name: 
// Module Name: subtractor2
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


module subtractor2(a,b, sum, Cf, Sf, Of);

    input logic[31:0] a;
    input logic[31:0] b;
    output logic[31:0] sum;
    output logic Cf;
    output logic Sf;
    output logic Of;
    
    logic [31:0] complement;

    assign complement=~b+(1'b1);
    
    FA_32bitv2 inst_1(a, complement, sum, Cf, Sf, Of);
    
    
endmodule
