`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 17:28:52
// Design Name: 
// Module Name: PorgramCounter
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


module ProgramCounter(
    input clk,
    input reset,
    input [31:0] in_data,
    output reg [31:0] out_data
    );
  reg [31:0]data;
  always @(posedge clk or posedge reset)
     begin 
      if(reset)
        out_data <= 32'd0;
      else
        out_data <=in_data;

   		end

endmodule
