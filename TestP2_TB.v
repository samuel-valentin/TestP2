/******************************************************************
* Description
*	This is the verifaction envioroment for testeting the basic RISC-V
*	Microprocesor.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module TestP2_TB;		//Cambiar por nombre del archivo y este se tiene que llamar como el proyecto
reg clk_tb = 0;
reg reset_tb = 0;  
  
  
TestP2					//Cambiar por nombre del archivo y este se tiene que llamar como el proyecto
DUV
(
	.clk(clk_tb),
	.reset(reset_tb)

);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#5 reset_tb = 1;
end


/*********************************************************/

endmodule