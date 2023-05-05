`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 02:22:08 PM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(
    input [5:0] q,
    output reg [3:0] bcd1,
    output reg [3:0] bcd2
    );
   
    integer i;
    reg [7:0] bcd;
    
    always @(q) begin
        bcd = 0;
        for (i=0; i<6; i=i+1) begin
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            bcd = {bcd[6:0], q[5-i]};
        end
      
      bcd1 = bcd[3:0];
      bcd2 = bcd[7:4];
      
   end
       
endmodule
