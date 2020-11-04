`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 08:39:17 PM
// Design Name: 
// Module Name: SIMDadd
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


module SIMDadd(x, y, sum);
    input logic [31:0] x;
    input logic [31:0] y;
    output logic [31:0] sum;

    assign sum[7:0] = x[7:0] + y[7:0];
    assign sum[15:8] = x[15:8] + y[15:8];
    assign sum[23:16] = x[23:16] + y[23:16];
    assign sum[31:24] = x[31:24] + y[31:24];
        
endmodule
