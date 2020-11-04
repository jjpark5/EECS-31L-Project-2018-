`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 12:13:55 PM
// Design Name: 
// Module Name: FA_32bit
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


module FA_32bitv2(x, y, sum, c_in, c_out, Cf, Sf, Of);

    input [31:0] x, y;
    output [31:0] sum;
    output c_out;
    output Cf;
    output Sf;
    output Of;
    
    input logic c_in;
    logic [7:0] c;

    
    // 32 = 8 * 4
    FA_4bit inst_1(x[3:0], y[3:0], c_in, sum[3:0], c[0]);
    FA_4bit inst_2(x[7:4], y[7:4], c[0], sum[7:4], c[1]);
    FA_4bit inst_3(x[11:8], y[11:8], c[1], sum[11:8], c[2]);
    FA_4bit inst_4(x[15:12], y[15:12], c[2], sum[15:12], c[3]);
    FA_4bit inst_5(x[19:16], y[19:16], c[3], sum[19:16], c[4]);
    FA_4bit inst_6(x[23:20], y[23:20], c[4], sum[23:20], c[5]);
    FA_4bit inst_7(x[27:24], y[27:24], c[5], sum[27:24], c[6]);
    FA_4bit inst_8(x[31:28], y[31:28], c[6], sum[31:28], c[7]);
    assign c_out = c[7];
    
    // assign the flags
    assign Cf = c_out;
    assign Sf = sum[31];
    assign Of = (x[31]==y[31]) ? ( (x[31] != sum[31]) ? 1 : 0 ) : 0;
    
endmodule
