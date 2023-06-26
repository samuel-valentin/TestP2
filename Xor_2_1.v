/******************************************************************
* Description
*	This is an Xor gate
*	1.0
* Author:
* Samuel Valentin Lopez Valenzuela
******************************************************************/

module Xor_2_1
(
	input A,
	input B,
	
	output reg C

);

	always@(*) begin
		C = A^B;
	end

endmodule