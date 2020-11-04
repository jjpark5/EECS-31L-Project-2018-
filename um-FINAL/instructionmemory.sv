`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2017 08:59:33 PM
// Design Name: 
// Module Name: instructionmemory
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


module instructionmemory #(
    parameter INS_ADDRESS=9,
    parameter INS_W = 32
)(
    input logic[INS_ADDRESS -1:0] ra,
    output logic [INS_W-1:0] rd
    );
    
   //ogic [INS_W-1:0] instruction_memory_data [(2**(INS_ADDRESS-2)-1):0];
    //logic [INS_W-1 :0] instruction_memory_data [(2**(INS_ADDRESS-2))-1:0];
        logic [INS_W-1 :0] Inst_mem [(2**(INS_ADDRESS-2))-1:0];

    //assign rd=instruction_memory_data [ra[8:2]];
    assign rd=Inst_mem[ra[8:2]];
assign Inst_mem[0]  = 32'h00007033;//  0000000 00000 00000 111 00000 011 0011;     and r0,r0,r0              
assign Inst_mem[1]  = 32'h00100093;//  0000 0000 0001 00000 000 00001 001 0011;    addi r1,r0, 1         h1 
assign Inst_mem[2]  = 32'h00200113;//  0000 0000 0010 00000 000 00010 001 0011;    addi r2,r0, 2         h2
assign Inst_mem[3]  = 32'h00308193;//  0000 0000 0011 00001 000 00011 001 0011;    addi r3,r1, 3         h4  
assign Inst_mem[4]  = 32'h00408213;//  0000 0000 0100 00001 000 00100 001 0011;    addi r4,r1, 4         h5
assign Inst_mem[5]  = 32'h00510293;//  0000 0000 0101 00010 000 00101 001 0011;    addi r5,r2, 5         h7
assign Inst_mem[6]  = 32'h00610313;//  0000 0000 0110 00010 000 00110 001 0011;    addi r6,r2, 6         h8
assign Inst_mem[7]  = 32'h00718393;//  0000 0000 0111 00011 000 00111 001 0011;    addi r7,r3, 7         hB

assign Inst_mem[8]   = 32'h00208433;//  0000000 00010 00001 000 01000 011 0011;    add r8  = r1+r2       h3
assign Inst_mem[9]   = 32'h404404b3;//  0100000 00100 01000 000 01001 011 0011;    sub r9  = r8-r4       hfffffffe -2 
assign Inst_mem[10]  = 32'h00317533;//  0000000 00011 00010 111 01010 011 0011;    and r10 = r2 & r3     h0
assign Inst_mem[11]  = 32'h0041e5b3;//  0000000 00100 00011 110 01011 011 0011;    or  r11 = r3 | r4     h5
assign Inst_mem[12]  = 32'h02a02823;//  0000001 01010 00000 010 10000 010 0011;    sw  48(r0)<-- r10     h30 
assign Inst_mem[13]  = 32'h16802023;//  0001011 01000 00000 010 00000 010 0011;    sw  352(r0)<-- r8     h160
assign Inst_mem[14]  = 32'h03002603;//  0000 0011 0000 00000 010 01100 000 0011;   lw r12 <-- 48(r0)     h30
    

    
    
//    assign instruction_memory_data[0] = 32'h00007033;
//    assign instruction_memory_data[1] = 32'h00100093;
//    assign instruction_memory_data[2] = 32'h00200113;
//    assign instruction_memory_data[3] = 32'h00208433;
//    assign instruction_memory_data[4] = 32'h002402b3;
//    assign instruction_memory_data[5] = 32'h408083b3;
//    assign instruction_memory_data[6] = 32'h00516533;
//    assign instruction_memory_data[7] = 32'h03022503;
//    assign instruction_memory_data[8] = 32'h1411a323;
//    assign instruction_memory_data[9] = 32'h55550303;
//    assign instruction_memory_data[10] = 32'h03311483;
//    assign instruction_memory_data[11] = 32'h1c054603;
//    assign instruction_memory_data[12] = 32'h01865f83;
//    assign instruction_memory_data[13] = 32'h049302a3;
//    assign instruction_memory_data[14] = 32'h48781523;
//    assign instruction_memory_data[15] = 32'h1c762c23;
//    assign instruction_memory_data[16] = 32'h01138f0;
    
//    assign instruction_memory_data[35] = 32'b00000000000000000000000010000011;
//    assign instruction_memory_data[36] = 32'b00000000000100010001000100000011;
//    assign instruction_memory_data[37] = 32'b00000000001000100010000110000011;
//    assign instruction_memory_data[38] = 32'b00000000010000110100001000000011;
//    assign instruction_memory_data[39] = 32'b00000000100001000101001010000011;
//    assign instruction_memory_data[40] = 32'b00000001000001010000001100000011;
//    assign instruction_memory_data[41] = 32'b00111110100001110010010000000011;
//    assign instruction_memory_data[42] = 32'b01000100110001101100010010000011;
//    assign instruction_memory_data[43] = 32'b01001011000001011101010100000011;
//    assign instruction_memory_data[44] = 32'b01010001010001001000010110000011;
//    assign instruction_memory_data[45] = 32'b01010111100000111001011000000011;
//    assign instruction_memory_data[46] = 32'b01011101110000101010011010000011;
//    assign instruction_memory_data[47] = 32'b01100100000000011100011100000011;
//    assign instruction_memory_data[48] = 32'b01101010010000000101011110000011;
//    assign instruction_memory_data[49] = 32'b01110000100000001000100000000011;
//    assign instruction_memory_data[50] = 32'b01110110110000011001100010000011;
//    assign instruction_memory_data[51] = 32'b01111101000000101010100100000011;
    
//    assign instruction_memory_data[17] = 32'h01f08193;
//    assign instruction_memory_data[18] = 32'h00310233;
//    assign instruction_memory_data[19] = 32'h004082b3;
//    assign instruction_memory_data[20] = 32'h07f28693;
//    assign instruction_memory_data[21] = 32'h40428833;
//    assign instruction_memory_data[22] = 32'h401505b3;
//    assign instruction_memory_data[23] = 32'h0060ea33;
//    assign instruction_memory_data[24] = 32'h00a2e8b3;
//    assign instruction_memory_data[25] = 32'h0035f7b3;
//    assign instruction_memory_data[26] = 32'h0037f733;
    
//    assign instruction_memory_data[27] = 32'h2d709623;
//    assign instruction_memory_data[28] = 32'h3f8290a3;
//    assign instruction_memory_data[29] = 32'h279112a3;
//    assign instruction_memory_data[30] = 32'h0fa59223;
//    assign instruction_memory_data[31] = 32'h71b421a3;
//    assign instruction_memory_data[32] = 32'h45c38623;
//    assign instruction_memory_data[33] = 32'h41d117a3;
//    assign instruction_memory_data[34] = 32'h03e19823;
    
  
    
endmodule
