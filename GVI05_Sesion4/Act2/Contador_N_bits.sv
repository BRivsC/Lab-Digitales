`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2022 23:08:13
// Design Name: 
// Module Name: Contador_N_bits
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


module Contador_N_bits #(parameter N=32)(
	input logic clock, reset, dec, enable, load,
	input logic [N-1:0] load_value,
	output logic [N-1:0]counterN

	);
	always_ff@(posedge clock) begin					//flip flop que se activa con cantos de subida de clk
		if (reset) begin					//el reset tiene prioridad por sobre todas las otras se�ales
			counterN=0;
		end
		else if (load) begin					//si load est� en alto, independiente de si enable tambi�n lo est�, counterN=load_value
			counterN = load_value;
		end				
		else if (enable*~load) begin			//solo si load est� en bajo a la vez que enable est� en alto, se procede con las otras opciones
			if (dec) begin					//si dec est� en alto, el contador opera de manera decremental
				counterN = counterN - 1;
			end
			else begin					//si dec est� en bajo, opera de manera incremental
				counterN = counterN + 1;
			end
		end
		else if (dec*~load*~enable) begin //si solamente dec est� en alto, el contador se mantiene con su valor anterior
			counterN = counterN;
		end
		else begin						//si no hay ninguna se�al en alto, el contador se queda igual
			counterN = counterN;
		end
	end
endmodule
	
