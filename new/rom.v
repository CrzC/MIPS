`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 18:23:29
// Design Name: 
// Module Name: rom
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


module rom(
    input [31:0] a,
    output [31:0] rd
    );
  reg [31:0]ROM[63:0];
  
  initial 
    begin
      $readmemh("rom.txt", ROM); 
  	end
  
  
  assign rd = ROM[a[31:0]];
     
endmodule
