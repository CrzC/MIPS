`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 17:19:48
// Design Name: 
// Module Name: mux31_2
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


module mux31_2(
  input [31:0] input0,input1,
         input sel,
         output [ 31:0] output_data);
  
    assign output_data = sel?input1:input0;
  
endmodule
