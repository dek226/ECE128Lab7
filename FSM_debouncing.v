`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2024 01:47:09 PM
// Design Name: 
// Module Name: FSM
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

module debouncing (RAW, CLK, CLEAN);
    input RAW, CLK;
    output reg CLEAN;
    reg[2:0] count;
    wire TC;
    
    always@(posedge CLK) begin
        if(~RAW)
            count <= 3'b000;
        else
            count <= count + 3'b001;
    end
    assign TC = (count == 3'b111);
    always@(posedge CLK)begin
        if(~RAW)
            CLEAN <= 1'b0;
        else
            CLEAN <= 1'b1;
    end
endmodule

/**
module Mealy_FSM(p1, clk, reset, z);
    input p1, clk, reset;
    output reg z;
    
    parameter s0=0, s1=1, s2=2, s3=3;
    reg[1:0] PS,NS;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            PS <= s0;
        else
            PS <= NS;
    end
    always@(PS or p1)
    begin
        case(PS)
        s0: begin
                z=0;
                if(p1)
                    NS = s1;
                else
                    NS = s0;
            end
        s1: begin
                if(p1)
                    NS = s2;
                else
                    NS = s0;
            end
        s2: begin
                if(p1)
                    NS = s2;
                else
                    NS = s3;
            end
        s3: begin
                if(p1)
                    NS = s1;
                else
                    NS = s0;
            end
        endcase
    end
    always@(PS or p1)
    begin
        case(PS)
            s0: z=0;
            s1: z=0;
            s2: z=0;
            s3: begin
                if(p1)
                    z=1;
                end
        endcase
    end
endmodule
//*/
/**
module Moore_FSM(p1, clk, reset, z);
    input p1, clk, reset;
    output reg z;
    
    parameter s0=0, s1=1, s2=2, s3=3, s4=4;
    reg[2:0] PS,NS;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            PS <= s0;
        else
            PS <= NS;
    end
    always@(PS or p1)
    begin
        case(PS)
        s0: begin
                z=0;
                if(p1)
                    NS = s1;
                else
                    NS = s0;
            end
        s1: begin
                if(p1)
                    NS = s2;
                else
                    NS = s0;
            end
        s2: begin
                if(p1)
                    NS = s2;
                else
                    NS = s3;
            end
        s3: begin
                if(p1)
                    NS = s1;
                else
                    NS = s4;
            end
        s4: begin
                if(p1)
                    NS = s1;
                else
                    NS = s0;
            end
        endcase
    end
    always@(PS)
    begin
        case(PS)
            s0: z=0;
            s1: z=0;
            s2: z=0;
            s3: z=0;
            s4: z=1;
        endcase
    end
endmodule
*/ 
