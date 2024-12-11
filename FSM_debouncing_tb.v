`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2024 02:07:43 PM
// Design Name: 
// Module Name: FSM_sim
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


module FSM_sim;
    reg p1;
    reg clk;
    reg reset;
    wire z;
    
   //Mealy_FSM DUT(p1, clk, reset, z);
   Moore_FSM DUT(p1, clk, reset, z);
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        #15 reset = 1'b0;
    end
    always #5 clk = ~clk;
    initial begin
        #10 p1=1;
        #10 p1=1;
        #10 p1=0;
        #10 p1=1;
        #10 p1=0;
        #10 p1=0;
        #10 p1=1;
        #10 p1=1;
        #10 p1=1;
        #10 p1=1;
        #10 p1=1;
        #10 p1=0;
        #10 p1=0;
        //for(integer i=0; i<4; i=i+1);
        //begin
        
        //end
        #10 $finish;
    end
endmodule

