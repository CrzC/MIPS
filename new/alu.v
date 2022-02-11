`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 17:10:41
// Design Name: 
// Module Name: alu
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


module alu( alu_sel,

                Operand1,

                Operand2,

                Result,

                flagZ

              );    

  input [2:0]  alu_sel;

  input [31:0]  Operand1,

             Operand2;

     
output reg [31:0] Result = 32'b0;

output reg  flagZ = 1'b0;   

  parameter  [2:0] ADD = 3'b010,

                 SUB = 3'b110,
  			     OR = 3'b001,
                 AND = 3'b000,
  				 SLT = 3'b111,
  				 EQU = 3'b101;

   
always @ (alu_sel or Operand1 or Operand2)

begin

   case (alu_sel)

   ADD: begin

     Result = Operand1 + Operand2;


     flagZ  = (Result == 32'b0);

    end

   SUB: begin

     Result = Operand1 - Operand2;

     flagZ  = (Result == 32'b0);

    end

   AND: begin

     Result = Operand1 & Operand2;

     flagZ  = (Result == 16'b0);

    end

   OR:  begin

      Result = Operand1 | Operand2;

     flagZ  = (Result == 32'b0);

     end
     
     SLT:  begin
       if(Operand1<Operand2) Result = 32'b1;
       else Result = 32'b0;

     flagZ  = (Result == 32'b0);

     end
     
     
     EQU:  begin

       if(Operand1==Operand2) Result = 32'b1;
       else Result = 32'b0;

     flagZ  = (Result == 32'b0);

     end

   default: begin

     Result = 32'b0;

     flagZ  = 1'b0;

    end

   endcase

end

endmodule