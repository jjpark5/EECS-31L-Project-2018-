`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2017 06:53:19 PM
// Design Name: 
// Module Name: TB_RISC-V
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


module tb_RISC_V;
logic clk , reset ;
logic [63:0] tb_ALU_Result ;
// clock generation
always #10 clk = ~ clk ;
// reset Generation
initial begin
clk = 0;
reset = 1;
#15 reset =0;
end
RISC_V tb_RISC_V (
. clk ( clk ),
. reset ( reset ),
. ALU_Result ( tb_ALU_Result )
);
initial begin
#1000;
$finish ;
end
endmodule