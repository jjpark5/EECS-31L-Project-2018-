`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 03:50:52 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input logic [6:0] opcode,
    output logic ALUSrc,
    output logic MemtoReg,
    output logic RegWrite,
    output logic MemRead,
    output logic MemWrite,
    output logic [1:0] ALUOp
    );
    
    always_comb begin
        //R-type
        if (opcode==7'b0110011) begin
            ALUSrc=   1'b0;
            MemtoReg= 1'b0;
            RegWrite= 1'b1;
            MemRead=  1'b0;
            MemWrite= 1'b0;
            ALUOp[0]= 1'b0;
            ALUOp[1]= 1'b1;
        end
          //I-type
         if (opcode==7'b0010011) begin
            ALUSrc=   1'b1;
            MemtoReg= 1'b0;
            RegWrite= 1'b1;
            MemRead=  1'b0;
            MemWrite= 1'b0;
            ALUOp[0]= 1'b0;
            ALUOp[1]= 1'b0;           
        end
        if (opcode==7'b0000011) begin
            ALUSrc=   1'b1;
            MemtoReg= 1'b1;
            RegWrite= 1'b1;
            MemRead=  1'b1;
            MemWrite= 1'b0;
            ALUOp[0]= 1'b0;
            ALUOp[1]= 1'b0;           
                end
               
      

        //S-type
        if (opcode==7'b0100011) begin
            ALUSrc=   1'b1;
            MemtoReg= 1'bx;
            RegWrite= 1'b0;
            MemRead=  1'b0;
            MemWrite= 1'b1;
            ALUOp[0]= 1'b0;
            ALUOp[1]= 1'b0;
        end
        
    end
    
endmodule
