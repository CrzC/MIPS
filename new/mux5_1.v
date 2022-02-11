`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 17:19:10
// Design Name: 
// Module Name: mux5_1
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


module mux5_1(
  input [4:0] input0,input1,
         input sel,
  output [ 4:0] output_data);
  
    assign output_data = sel?input1:input0;
  
endmodule