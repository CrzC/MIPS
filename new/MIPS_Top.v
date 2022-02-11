`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 17:16:03
// Design Name: 
// Module Name: MIPS_Top
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


module MIPS_Top(
    input clk,
    input reset,we
    );
    
    wire [31:0]instruction ;
  wire [31:0] SrcA; 
  wire [31:0] SrcB; 
  wire [31:0] RD2; 
  wire [31:0] WD3; 
  wire [4:0] RegA3; 
    wire [31:0] aluOut;
    wire [31:0] signOut;
    wire [31:0] dataMen;
  wire [31:0] PCplus,PCbs,PCPlusBranch;
    wire [31:0] PCact;
 	wire [31:0] PCjLW;
  wire [2:0] AluSel;
  wire [1:0]ALUControl;
 	wire we_reg,we_data,mult_j;
  	wire MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,Zero;
    
  regmemory regMem(.clk(clk),   //register memory
                   .we(RegWrite&~clk),                  
    .reset(reset),
    .a1(instruction[25:21] ),
    .a2(instruction[20:16]),    
    .a3(RegA3),
    .rd1(SrcA),
    .rd2(RD2),
                   .wd( WD3)
    );
    
 dmem DataMem(     //data memory
    .clk(clk),
   .we(MemWrite&~clk),     //disable write 
    .reset(reset),
    .a(aluOut),
    .wd(RD2),
    .rd(dataMen)
    );
  
  
  
    mux31_2 aluDatMem(
    .input0(aluOut),
    .input1(dataMen),
    .sel(MemtoReg),
    .output_data( WD3)
  );
  
  
   
   rom InstructionMen (.a(PCact), //instruction memory
     .rd(instruction)) ;
     
 //  adder U3(.a(contentA1), //ADDER - substitutes the alu
  //  .b(signOut),
  // .y(aluOut)
  //  ); 
  
  mux31_2 aluMux(
    .input0(RD2),
    .input1(signOut),
    .sel(ALUSrc),
    .output_data(SrcB)
  );
  
  
  alu ALU_U0( .alu_sel(AluSel),
             .Operand1(SrcA),
                .Operand2(SrcB),
             .Result(aluOut),
             .flagZ(Zero)
			); 
  
    sign_extend SignExt(   //extended sign 
    .in_data(instruction[15:0]),
    .out_data(signOut)
    );
    
     adder PC1(.a(32'd1),   //adder to program counter
    .b(PCact),
    .y(PCplus)
    ); 
  
  
    adder PCBranch(.a(signOut),   //adder to program counter
    .b(PCplus),
                   .y(PCbs)
    ); 
  
	mux5_1 MuxA3 (  //Mutiplexor to PC 
      .input0(instruction[20:16]),
      .input1(instruction[15:11]),
    .sel(RegDst),
    .output_data(RegA3)
  );
  
  
  
    
    ProgramCounter U6(   //program counter
    .clk(clk),
    .reset(reset),
    .in_data(PCjLW),
    .out_data(PCact)
    );
   
  mux31_2 U7(  //Mutiplexor to PC 
    .input0(PCPlusBranch),
    .input1({PCplus[31:26],instruction[25:0]}),
    .sel(Jump),
    .output_data(PCjLW)
  );
  
  
  
   mux31_2 U8(  //Mutiplexor to PC 
    .input0(PCplus),
    .input1(PCbs),
     .sel(Branch & Zero),
     .output_data(PCPlusBranch)
  );
  
  

  alu_decoder  AluDec(.funct(instruction[5:0]),
			.aluop(ALUControl),
               .alucontrol(AluSel));
  
  decoder DecoderMain(
    .opcode(instruction[31:26]),
    .memtoreg(MemtoReg),
    .memwrite(MemWrite),
    .branch(Branch),
    .alusrc(ALUSrc),
    .regdst(RegDst),
    .regwrite(RegWrite),
    .jump(Jump),
   .aluop(ALUControl)
);

    
endmodule
