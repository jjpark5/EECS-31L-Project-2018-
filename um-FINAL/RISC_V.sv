`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2017 05:50:47 PM
// Design Name: 
// Module Name: RISC_V
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


module RISC_V#(
parameter DATA_W = 64)(
input logic clk , reset , // clock and reset signals
output logic [DATA_W -1:0] ALU_Result // The ALU_Result
);

logic MemtoReg,ALUSrc,Memwrite,Memread,Regwrite; //All the 1-bit outputs of the Controller
logic [1:0] ALUOp;                               //ALUOp code for the ALU controller
logic [31:0] InstructMem;                        //The instruction memory data
logic [3:0] ALUCC;                               //Control code for the ALU
logic [6:0] opcode;
logic [6:0] Funct7;
logic [2:0] Funct3;

assign Funct7=InstructMem[31:25];
assign Funct3=InstructMem[14:12];

assign opcode=InstructMem[6:0];

//Datapath
datapath DATAPATH_RISC_V(
.clk(clk),
.reset(reset),
.RegWrite(Regwrite),.MemtoReg(MemtoReg),.ALUsrc(ALUSrc),.MemWrite(Memwrite),.MemRead(Memread),
.ALU_CC(ALUCC),
.ALU_Result(ALU_Result),
.IM(InstructMem));

//Controller
Controller CONTROL_RISC_V(
.opcode(opcode),
.ALUSrc(ALUSrc),.MemtoReg(MemtoReg),.RegWrite(Regwrite),.MemRead(Memread),.MemWrite(Memwrite),.ALUOp(ALUOp));

//ALUController
ALUController ALU_CONTROL_RISC_V(
.ALUop(ALUOp),
.Funct7(Funct7),
.Funct3(Funct3),
.Operation(ALUCC));

endmodule