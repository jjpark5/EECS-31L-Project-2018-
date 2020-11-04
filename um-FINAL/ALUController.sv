`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 03:51:23 PM
// Design Name: 
// Module Name: ALUController
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


module ALUController(
    input [1:0] ALUop,
    input logic [6:0] Funct7,
    input logic [2:0] Funct3,
    
    output logic [3:0] Operation
    );
    
    always_comb begin
        if (ALUop[0]==0 && ALUop[1]==0) begin         
            Operation<=4'b0010;
        end
        
        if (ALUop[0]==1) begin      
           if (Funct7==7'bxxxxxxx && Funct3==3'bxxx) begin
                Operation<=4'b0110;
           end
        end
        
        if (ALUop[1]==1) begin      
                   if (Funct7==7'b0 && Funct3==3'b0) begin
                        Operation<=4'b0010;
                   end
                   if (Funct7==7'b0100000 && Funct3==3'b0) begin
                        Operation<=4'b0110;
                   end
                   if (Funct7==7'b0 && Funct3==3'b111) begin
                        Operation<=4'b0000;
                   end
                   if (Funct7==7'b0 && Funct3==3'b110) begin
                        Operation<=4'b0001;
                   end
                end 
    end
    
endmodule
