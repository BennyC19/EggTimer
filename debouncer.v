`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 01:38:45 PM
// Design Name: 
// Module Name: debouncer
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

module debouncer(
    input button_in, 
    input clk_in, 
    output reg button_out
    );
    
    reg bit0;
    reg bit1;
        
    always @ (posedge clk_in) begin
       bit1 <= bit0;
       bit0 <= button_in; 
       button_out = bit1 & bit0;
    end
   
endmodule
