`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 17:16:23
// Design Name: 
// Module Name: dmem
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


module dmem(
    input clk,
    input we,
    input reset,
    input [31:0] a,
    input [31:0] wd,
    output [31:0] rd
    );
      reg [31:0]RAM[63:0];
  
  initial 
    begin
      $readmemh("mem.txt", RAM); 
    end
  

    always @ (posedge clk,posedge reset)
    begin
      if(reset)
        $readmemh("mem.txt", RAM); 
    end
 
  assign rd = RAM[a];
  
 
  always @ (posedge clk)begin
    if(we)
      RAM[a]<=wd;
      $writememh("mem.txt", RAM); 
  end
endmodule
