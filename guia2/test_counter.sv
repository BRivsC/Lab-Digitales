//De la 3.4 de la gu�a 2

`timescale 1ns / 1ps
module test_counter();
    logic        clk, reset;
    logic [4:0]  count;
    /*
    counter_4bit DUT(   .clk(clk),
                        .reset(reset),
                        .count(count));
    */
    
    nbit_counter#(.N(5)) DUT(
                        .clk(clk),
                        .reset(reset),
                        .count(count));
    always #5 clk=~clk; //genera se�al de reloj
    
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;                     
    end  
endmodule
