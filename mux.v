`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 02:55:11 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input [2:0] s,
    input [6:0] seg_1,
    input [6:0] seg_2,
    input [6:0] seg_3,
    input [6:0] seg_4,
    input [6:0] seg_5,
    input [6:0] seg_6,
    input [6:0] seg_7,
    input [6:0] seg_8,
    output [6:0] seg,
    output [7:0] an
    );
    
    reg [7:0] an1 = 8'b11111110;
    reg [7:0] an2 = 8'b11111101;
    reg [7:0] an3 = 8'b11111011;
    reg [7:0] an4 = 8'b11110111;
    reg [7:0] an5 = 8'b11101111;
    reg [7:0] an6 = 8'b11011111;
    reg [7:0] an7 = 8'b10111111;
    reg [7:0] an8 = 8'b01111111;
    
    assign an = s[0] ? (s[1] ? (s[2] ? an8 : an7) : (s[2] ? an6 : an5)) : (s[1] ? (s[2] ? an4 : an3) : (s[2] ? an2 : an1));
    assign seg = s[0] ? (s[1] ? (s[2] ? seg_8 : seg_7) : (s[2] ? seg_6 : seg_5)) : (s[1] ? (s[2] ? seg_4 : seg_3) : (s[2] ? seg_2 : seg_1));
        
endmodule
