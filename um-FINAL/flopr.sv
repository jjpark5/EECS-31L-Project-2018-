`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2017 08:23:45 PM
// Design Name: 
// Module Name: flopr
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


module flopr #(
    parameter WIDTH = 9
)(
    input logic clk, reset,
    input logic [WIDTH -1:0] d,
    output logic [WIDTH -1:0] q
    );
    always_ff@(posedge clk,posedge reset) begin
        if(reset)begin
        q=0;
        end
        if(clk==1)begin
            q<=d;end
        if (reset) begin
            q<=0;
        end
        
     end
endmodule
