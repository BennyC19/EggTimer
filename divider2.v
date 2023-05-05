`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 01:56:28 PM
// Design Name: 
// Module Name: divider2
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


module divider2(
    input clk_in,
    input reset,
    output reg clk_out
    );
    
    integer count;
    integer div = 8;
    
    always@(posedge clk_in) begin
        if (reset) begin
            count <= 0;
        end
        else if (count == div) begin
            clk_out <= ~clk_out;
            count <= 0; end
        else count <= count + 1;
    end
endmodule
