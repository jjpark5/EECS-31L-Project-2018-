`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2017 03:10:03 PM
// Design Name: 
// Module Name: datapath
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


module datapath #(
parameter PC_W = 9,                     // Program Counter
parameter INS_W = 32,                   // Instruction Width
parameter RF_ADDRESS = 5,               // Register File Address
parameter DATA_W = 64,                  // Data WriteData
parameter DM_ADDRESS = 9,               // Data Memory Address
parameter ALU_CC_W = 4                  // ALU Control Code Width
)(                                      
input logic clk ,                       // global clock
reset ,                                 // reset , sets the PC to zero
RegWrite , MemtoReg ,                   //R- file writing enable // Memory or ALU MUX
ALUsrc , MemWrite ,                     //R- file or Immediate MUX // Memroy Writing Enable
MemRead ,                               // Memroy Reading Enable
input logic [ ALU_CC_W -1:0] ALU_CC,    // ALU Control Code ( input of the ALU )
output logic [DATA_W-1:0] ALU_Result,   // ALU Ouput
output logic [INS_W-1:0] IM             //Instructions
);


wire [8:0] PC_in,PC_out;                //Input and output of the program counter 
logic [4:0] RF_ra1,RF_ra2,RF_wa;        //Register file addresses for Read1, Read2, and Writing, respectively
logic [63:0] wd, RF_rd1,RF_rd2,         //Register File: Write Data, Read Data1, Read Data2
ALU_MUX_out,                            //Mux for ALU output
IG,                                     //Immediate generator result
DMout;                                  //Data Memory Output
logic [8:0] DM_ad;                      //Data Memory Address
wire [DATA_W-1:0]ALU_out;
logic [8:0] b;

assign b=9'b100;

//Program Counter
flopr ProgramCounter(.clk(clk),.reset(reset),
.d(PC_in),                                      //Input into the program counter
.q(PC_out));                                    //Output out of the program counter

//4-bit adder
adder Adder(
.a(PC_out),
.b(b),                                     //Takes in the value of the program counter ouput
.y(PC_in));                                     //Outputs a value of the program counter output added with binary "0100"

//Instruction Memory
instructionmemory Instruction_Memory(
.ra(PC_out),                                    //Takes in the value of the program output for use as the address
.rd(IM));                                       //Outputs hardcoded insturctions

//Immediate_Generator
imm_Gen Immediate_Generator(
.inst_code(IM),                                 //Takes in the entire bit lenght of the instructions
.Imm_out(IG));                                  //Outputs a 64-bit number obtained from the instructions

assign RF_ra1=IM[19:15];                        //A register file read address is assigned to bits [19:15] of the instructions
assign RF_ra2=IM[24:20];                        //A register file read address is assigned to bits [24:20] of the instructions
assign RF_wa=IM[11:7];                          //The register file write address is assigned to bits [11:7] of the instructions

//Register File
regFile Register_File(.clk(clk),.rst(reset),
.RegWrite(RegWrite),                            //Control for the register file write function
.ra1(RF_ra1),.ra2(RF_ra2),.wa(RF_wa),           //Takes the two read addresses and write address that was previously assigned
.wd(wd),                                        //Takes in the output of the data memory mux to use as the write data
.rd1(RF_rd1),.rd2(RF_rd2));                     //Outputs two 64-bit numbers that are the elements of the read addresses

//Multiplexor to the ALU
mux2 ALU_MUX(
.d0(RF_rd2),.d1(IG),                            //Takes in the second read data and the immediate generated data to select from
.s(ALUsrc),                                     //Selector for the mux
.y(ALU_MUX_out));                               //Output of the mux

//ALU
alu ALU(
.SrcA(RF_rd1),.SrcB(ALU_MUX_out),               //Takes in the first read data and the output of the ALU mux
.ALUCC(ALU_CC),                                 //Control function for the ALU
.ALUResult(ALU_out));                           //Output of the ALU

assign ALU_Result=ALU_out;                      //Assigning values of module logic ALU result to an ALU output port
assign DM_ad=ALU_out[8:0];                      //Assiging the address of data memory to the [8:0] bits of the ALU output

//Data Memory
datamemory Data_Memory(//.clk(clk),
.MemRead(MemRead),                              //Control for reading data
.MemWrite(MemWrite),                            //Control for writing data
.a(DM_ad),                                      //Inputs the data memory address, from ALU output,
.wd(RF_rd2),                                    //Inputs data memory write data, from second read address data of Regfile
.rd(DMout));                                    //Outputs read data of data memory

//Multiplexor to the Register File
mux2 DM_MUX(
.d0(ALU_out),.d1(DMout),                        //Takes in the ALU output and data memory output to select from
.s(MemtoReg),                                   //Selector for the mux
.y(wd));                                        //Output of the mux


endmodule