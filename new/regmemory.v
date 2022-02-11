`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 18:22:32
// Design Name: 
// Module Name: regmemory
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


module regmemory(
    input clk,
    input we,
    input reset,
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    output [31:0] rd1,
    output [31:0] rd2,
    input [31:0] wd
    );
      reg [31:0]RAM[31:0];
  
  initial 
    begin
      $readmemh("regMem.txt", RAM); 
    end
  

    always @ (posedge clk,posedge reset)
    begin
      if(reset)
        $readmemh("regMem.txt", RAM); 
    end
 
 // assign rd1 = (a1 != 0 )? RAM[a1] : 0 ;
 // assign rd2 = (a2 != 0 )? RAM[a2] : 0 ;
  assign rd1 = RAM[a1] ;
  assign rd2 = RAM[a2] ;
 
  always @ (posedge clk)begin 
    if(we)begin
      if (a3 ==5'b00000) begin
        RAM[a3]<=32'h00000000;
        end
      else begin
        RAM[a3]<=wd; 
     end
     $writememh("regMem.txt", RAM);
    end
    
  end
  

  
endmodule

