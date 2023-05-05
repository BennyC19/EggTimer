`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 03:03:51 PM
// Design Name: 
// Module Name: framerate_divider
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


module framerate_divider(
    output reg clk_out,
    input reset,
    input clk_in
    );
    
    integer count;
    integer div = 3125;
    
    always@(posedge clk_in) begin
        if (reset) begin
            count <= 0;
        end
        if (count == div) begin
            clk_out <= ~clk_out;
            count <= 0; end
        else count <= count + 1;
    end
   
endmodule
