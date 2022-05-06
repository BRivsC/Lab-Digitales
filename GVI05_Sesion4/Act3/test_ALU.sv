`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: Cristobal Caqueo, Bastian Rivas, Claudio Zanetta
// 
// Create Date: 04/05/2022
// Design Name: Guia 4
// Module Name: test_ALU
// Project Name: n_bit_ALU
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: Testbench que prueba el funcionamiento normal y de cada flag posible 
//              de la ALU
// 
// Dependencies: Lab Digitales
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_test();
	logic [7:0] A,B,Result;
	logic [1:0] OpCode;
	logic [3:0] Status;
	logic [8:0] resultado;
	
	S4_actividad3 DUT(
		.A(A),
		.B(B),
		.OpCode(OpCode),
		.Result(Result),
		.Status(Status)
		);
	
	initial begin
	    //Caso 1
		OpCode = 'd0;			//Suma
		A = 8'b11111111;		
		B = 8'b11111111;		//Se est� probando el flag C, overflow
	
		#10
        //Caso 2
		A = 8'b01111111;	
		B = 8'b01111111;		//Se est� probando el flag V, suma de n�meros positivos que da un n�mero negativo
	
		#10
	    //Caso 3
		A = 8'b10011001;
		B = 8'b11011000;		//Se est� probando el flag V, suma de n�meros negativos que da un n�mero positivo

		#10
        //Caso 4
		A = 8'b01110110;
		B = 8'b10001010;			//Se est� probando el flag Z, que el resultado sea 0 

		#10
        //Caso 5
		A = 8'b10011011;
		B = 8'b00000111;			//Se est� probando el flag N, que el resultado sea negativo

		#10
        //Caso 6
		OpCode = 'd1;			//Resta
		A = 8'b00010110;
		B = 8'b01011000;			//Se est� probando el flag C, borrow

		#10
        //Caso 7
		A = 8'b01100100;
		B = 8'b11011000;			//Se est� probando el flag V, restarle un n�mero negativo a un positivo y obtener un negativo

		#10
        //Caso 8
		A = 8'b10001111;
		B = 8'b00101000;			//Se est� probando el flag V, restarle un n�mero positivo a un negativo y obtener un positivo

		#10
        //Caso 9
		A = 8'b01110100;
		B = 8'b01111100;			//Se est� probando el flag N, que el resultado sea negativo

		#10
        //Caso 10
		A = 8'b11111111;
		B = 8'b11111111;			//Se est� probando el flag Z, que el resultado sea 0

		#10
        //Caso 11
		OpCode = 'd2;			//OR
		A = 8'b11001001;			//C y V deben ser 0
		B = 8'b01100010;			//Se est� probando el flag N, que el n�mero sea negativo
		
		#10
		//Caso 12
		A = 8'b00000000;			//C y V deben ser 0
		B = 8'b00000000;			//Se est� probando el flag Z, que el n�mero sea cero
		
		#10
	    //Caso 13
		OpCode = 'd3;			//AND
		A = 8'b11011011;			//C y V deben ser 0
		B = 8'b11101001;			//Se est� probando el flag N, que el n�mero sea negativo
		
		#10
		//Caso 14
	    A = 8'b11111111;			//C y V deben ser 0
		B = 8'b00000000;			//Se est� probando el flag Z, que el n�mero sea cero
	end

endmodule