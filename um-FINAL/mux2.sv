`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 12:21:26 PM
// Design Name: 
// Module Name: mux2
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


module mux2 #(
    parameter WIDTH = 64
)(
    input logic [WIDTH -1: 0] d0, d1, //d0 is read data2, d1 is immediately generated number
    input logic s,
    output logic [WIDTH-1:0] y
    );
    
    always_comb begin
       
        if (s==0) begin
            y=d0;
        end
        
        if (s==1) begin
            y=d1;
        end 
        
    end
    
endmodule
