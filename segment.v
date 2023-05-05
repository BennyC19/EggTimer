`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 02:48:45 PM
// Design Name: 
// Module Name: segment
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


module segment(
    input [3:0] q,
    output reg [6:0] seg
    );
    
    always @(q) begin
        case (q)
           4'b0000 : begin seg <= 7'b1000000; end
           4'b0001 : begin seg <= 7'b1111001; end
           4'b0010 : begin seg <= 7'b0100100; end
           4'b0011 : begin seg <= 7'b0110000; end
           4'b0100 : begin seg <= 7'b0011001; end
           4'b0101 : begin seg <= 7'b0010010; end
           4'b0110 : begin seg <= 7'b0000010; end
           4'b0111 : begin seg <= 7'b1111000; end
           4'b1000 : begin seg <= 7'b0000000; end
           4'b1001 : begin seg <= 7'b0010000; end
           default : begin seg <= 7'b1000000; end
       endcase
    end
endmodule
