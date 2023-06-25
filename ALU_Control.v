/******************************************************************
* Description
*	This is the control unit for the ALU. It receves a signal called 
*	ALUOp from the control unit and signals called funct7 and funct3  from
*	the instruction bus.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module ALU_Control
(
	input funct7_i, 
	input [2:0] ALU_Op_i,
	input [2:0] funct3_i,
	

	output [3:0] ALU_Operation_o

);

localparam R_Type_ADD = 7'b0_000_000;
localparam I_Type_ADDI = 7'bx_001_000;

localparam U_Type_LUI = 7'bx_001_xxx;  	//
localparam I_Type_ORI = 7'bx_001_110;
localparam I_Type_SLLI = 7'b0_001_001;
localparam I_Type_SRLI = 7'b0_001_101;
localparam R_Type_SUB = 7'b1_000_000;

/*
localparam R_Type_AND = 7'b0_001_111;
localparam I_Type_ANDI = 7'bx_001_111;
localparam R_Type_OR = 7'b0_000_110;
localparam R_Type_XOR = 7'b0_000_100;
localparam I_Tyoe_XORI = 7'bx_001_100;
localparam R_Type_SRL = 7'b0_000_101;
localparam R_Type_SLL = 7'b0_000_001;
localparam I_Type_LW = 7'bx_100_010;
localparam S_Type_SW = 7'bx_011_010;
localparam B_Type_BEQ = 7'bx_101_000;
localparam B_Type_BNE = 7'bx_101_001;
localparam B_Type_BLT = 7'bx_101_100;
localparam B_Type_BGE = 7'bx_101_001;
localparam J_Type_JAL = 7'bx_110_xxx;
localparam I_Type_JALR = 7'bx_111_000;
*/

reg [3:0] alu_control_values;
wire [6:0] selector;

assign selector = {funct7_i, ALU_Op_i, funct3_i};

always@(selector)begin
	casex(selector)
		R_Type_ADD: alu_control_values = 4'b0000;
		I_Type_ADDI: alu_control_values = 4'b0000;
		
		U_Type_LUI: alu_control_values = 4'b0111;	//4'b0111
		I_Type_ORI: alu_control_values = 4'b0101;
		I_Type_SLLI:alu_control_values = 4'b1000;
		I_Type_SRLI:alu_control_values = 4'b1010;
		R_Type_SUB: alu_control_values = 4'b0001;
/*		
		R_Type_AND: alu_control_values = 4'b0100;
		I_Type_ANDI:alu_control_values = 4'b0100;
		R_Type_OR:	alu_control_values = 4'b0101;
		R_Type_XOR:	alu_control_values = 4'b0110;
		I_Tyoe_XORI:alu_control_values = 4'b0110;
		R_Type_SRL: alu_control_values = 4'b1010;
		R_Type_SLL:	alu_control_values = 4'b1000;
		I_Type_LW:	alu_control_values = 4'b0011;
		S_Type_SW:	alu_control_values = 4'b0100;
		B_Type_BEQ:	alu_control_values = 4'b0001;
		B_Type_BNE: alu_control_values = 4'b0001;
		B_Type_BLT:	alu_control_values = 4'b0001;
		B_Type_BGE:	alu_control_values = 4'b0001;
		J_Type_JAL:	alu_control_values = 4'b0000;
		I_Type_JALR:alu_control_values = 4'b0000;
*/
		default: alu_control_values = 4'b00_00;
	endcase
end


assign ALU_Operation_o = alu_control_values;



endmodule