`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 12:41:19 PM
// Design Name: 
// Module Name: datamemory
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


module datamemory #(
    parameter DM_ADDRESS = 9,
    parameter DATA_W = 64
)(
    input logic MemRead,
    input logic MemWrite,
    input logic [DM_ADDRESS-1:0] a,
    input logic [DATA_W-1:0] wd,
    output logic [DATA_W-1:0] rd
    );
    logic [5:0] ROW;
    logic [2:0] COL;
    logic [63:0] datamem_file [2**(DM_ADDRESS-3)-1:0][2**(DM_ADDRESS-6)-1:0];
    always @(MemRead,MemWrite)begin
     COL= a[2:0];
     ROW=a[8:3];
        if(MemRead)begin
            rd=datamem_file[ROW][COL];end
             if(MemWrite)begin
                datamem_file[ROW][COL]=wd;end end
    
endmodule
