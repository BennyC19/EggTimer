`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2023 05:26:31 PM
// Design Name: 
// Module Name: controller
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

module controller(  
    input minutes,
    input seconds,
    input clock,
    input cook_time,
    input start,
    input reset,
    input enable,
    input [5:0] q_seconds,
    input [5:0] q_minutes,
    output reg up,
    output reg minute_counter,
    output reg second_counter,
    output reg [1:0] LED,
    output reg [6:0] controller_to_mux_D,
    output reg [6:0] controller_to_mux_O,
    output reg [6:0] controller_to_mux_N,
    output reg [6:0] controller_to_mux_E
    );
    
    reg start_reg = 0;
 
    always @(*) begin  
        
        controller_to_mux_D <= 7'b1111111;
        controller_to_mux_O <= 7'b1111111;
        controller_to_mux_N <= 7'b1111111;
        controller_to_mux_E <= 7'b1111111;
        
        if (enable) begin
            LED[0] <= 1;  
        end
        else begin
            LED[0] <= 0; 
        end
   
        if (cook_time | reset) begin
            start_reg <= 0;
            up <= 1;
            minute_counter <= minutes;
            second_counter <= seconds;
        end
        
        if (start) begin
            start_reg <= 1;
            end
            
        if (start_reg == 1) begin
            if (q_seconds != 0 | q_minutes != 0) begin
                up <= 0;
                second_counter <= clock;
                if (q_seconds == 0) begin
                    minute_counter <= 1;
                end
                else minute_counter <= 0;  
            end
            
            else if (q_seconds == 0 & q_minutes == 0) begin
                controller_to_mux_D <= 7'b1100000;
                controller_to_mux_O <= 7'b1000000;
                controller_to_mux_N <= 7'b1001000;
                controller_to_mux_E <= 7'b0000110;             
            end      
        end
    end
    
endmodule
