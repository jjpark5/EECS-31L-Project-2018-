`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2017 08:15:43 PM
// Design Name: 
// Module Name: Complementer
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


module Complementer(
    input logic [31:0] a, //32 bit input
    output logic [31:0] y //32 bit output
    );
    
   
   initial begin
   assign y = ~a;
   
   
   $display("a= %32b",a);
   $display ("y= %32b", y); 
   $finish;
   end
   
endmodule

 
