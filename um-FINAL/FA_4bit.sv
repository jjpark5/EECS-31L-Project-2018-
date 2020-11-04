`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 12:13:55 PM
// Design Name: 
// Module Name: FA_4bit
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


module FA_4bit(a, b, c_in, sum, c_out);

    input logic [3:0] a, b;
    input logic c_in;
    output logic [3:0] sum;
    output logic c_out;
    
    logic [3:0] c;
    
    assign sum[0] = (~a[0] & ~b[0] & c_in) | (~a[0] & b[0] & ~c_in) | (a[0] & ~b[0] & ~c_in) | (a[0] & b[0] & c_in);
    assign c[0] = (a[0] & b[0]) | (a[0] & c_in) | (b[0] & c_in);
    
    assign sum[1] = (~a[1] & ~b[1] & c[0]) | (~a[1] & b[1] & ~c[0]) | (a[1] & ~b[1] & ~c[0]) | (a[1] & b[1] &c[0]);
    assign c[1] = (a[1] & b[1]) | (a[1] & c[0]) | (b[1] & c[0]);
    
    assign sum[2] = (~a[2] & ~b[2] & c[1]) | (~a[2] & b[2] & ~c[1]) | (a[2] & ~b[2] & ~c[1]) | (a[2] & b[2] &c[1]);
    assign c[2] = (a[2] & b[2]) | (a[2] & c[1]) | (b[2] & c[1]);
    
    assign sum[3] = (~a[3] & ~b[3] & c[2]) | (~a[3] & b[3] & ~c[2]) | (a[3] & ~b[3] & ~c[2]) | (a[3] & b[3] &c[2]);
    assign c[3] = (a[3] & b[2]) | (a[3] & c[2]) | (b[3] & c[2]);

    assign c_out = c[3];
    
endmodule
