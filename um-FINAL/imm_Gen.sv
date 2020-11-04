`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 11:35:42 AM
// Design Name: 
// Module Name: imm_Gen
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


module imm_Gen(
    input logic [31:0] inst_code,
    output logic [63:0] Imm_out
    );
    logic [6:0] opcode;
    assign opcode=inst_code[6:0];
    logic [11:0] temp_immout;
    
    always_comb begin
    
        //I-type
        if (opcode==7'b0000011 || opcode==7'b0010011 || opcode==7'b1100111) begin
            temp_immout=inst_code[31:20];
        end
        
        //S-type
        if (opcode==7'b0100011) begin
            temp_immout={inst_code[31:25],inst_code[11:7]};
        end
        
        if (temp_immout[11]==0) begin
            Imm_out={52'b0, temp_immout};
        end
            
        if (temp_immout[11]==1) begin
            Imm_out={52'b1, temp_immout};
        end
        
    end   
    
endmodule
