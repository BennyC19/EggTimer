`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 06:01:40 PM
// Design Name: 
// Module Name: custom_counter
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

module c_counter_binary_0(
    input CLK,
    input SCLR,
    input UP,
    input enable,
    output reg [5:0] Q
    );
    
    parameter max = 6'b111011;
    
    always @(posedge CLK or posedge SCLR) begin
        if (SCLR) begin
            Q <= 0;
        end 
        else if (enable) begin
            if (UP == 1) begin
                if (Q == max) begin
                    Q <= 0;
                end
                else Q <= Q + 1;
            end
            else if (UP == 0) begin
                if (Q == 0) begin
                    Q <= max;
                end
                else Q <= Q - 1;
            end
        end
    end
    
endmodule
