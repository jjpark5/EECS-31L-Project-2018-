`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 12:28:40 PM
// Design Name: 
// Module Name: alu
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


module alu #(
    parameter DATA_WIDTH = 64,
    parameter OPCODE_LENGTH = 4
)(
    input logic [DATA_WIDTH-1: 0] SrcA,
    input logic [DATA_WIDTH-1: 0] SrcB,
    input logic [OPCODE_LENGTH-1: 0] ALUCC,
    output logic [DATA_WIDTH-1: 0] ALUResult
    );
    
    always_comb begin
        if (ALUCC==4'b0000) begin
            ALUResult=SrcA & SrcB;
        end
        
        if (ALUCC==4'b0001) begin
            ALUResult=SrcA | SrcB;
        end
        
        if (ALUCC==4'b0010) begin
            ALUResult=SrcA + SrcB;
        end
        
        if (ALUCC==4'b0110) begin
            ALUResult=SrcA - SrcB;
        end
    end
    
endmodule
