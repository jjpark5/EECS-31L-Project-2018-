`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 10:29:33 AM
// Design Name: 
// Module Name: regFile
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


module regFile #(
    parameter DATA_WIDTH = 64,
    parameter ADDRESS_WIDTH = 5,
    parameter REGISTER_SIZE = 2**ADDRESS_WIDTH
)(
    input logic clk, rst,
    input logic RegWrite,
    input logic [ADDRESS_WIDTH-1: 0] ra1, ra2, wa,
    input logic [DATA_WIDTH-1: 0] wd,
    output logic [DATA_WIDTH-1: 0] rd1,rd2);
    
    
    logic [63:0] regfile_data [31:0];
    

 

    always@(negedge clk, posedge rst) begin
        if (rst) begin
        regfile_data='{32{0}};
        end
        else
        if (RegWrite) begin
        regfile_data[wa]=wd;
        end 
        end       

assign rd1=  regfile_data[ra1];
assign rd2=  regfile_data[ra2];

endmodule
