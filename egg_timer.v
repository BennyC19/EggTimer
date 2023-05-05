`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:13:44 PM
// Design Name: 
// Module Name: egg_timer
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

module egg_timer(
    input clk,
    input enable,
    input reset,
    input minutes,
    input seconds,
    input cook_time,
    input start,
    output [7:0] an,
    output [6:0] seg,
    output [1:0] LED
    );
    
    wire clk_5MHz;
    wire clk_1Hz;
    wire clk_200Hz;
    wire clk_10Hz;
    
    wire up;
    wire minute_counter;
    wire second_counter;
    
    wire [5:0] q_minutes;
    wire [5:0] q_seconds;
    
    wire [3:0] bcd_10minutes;
    wire [3:0] bcd_minutes;
    wire [3:0] bcd_10seconds;
    wire [3:0] bcd_seconds;
    
    wire [6:0] segment_to_mux_10minutes;
    wire [6:0] segment_to_mux_minutes;
    wire [6:0] segment_to_mux_10seconds;
    wire [6:0] segment_to_mux_seconds;
    
    wire [2:0] s;
    
    wire [6:0] seg_wire;
    wire [7:0] an_wire;
    
    wire minute_debouncer_to_controller;
    wire second_debouncer_to_controller;
    
    wire [6:0] controller_to_mux_D;
    wire [6:0] controller_to_mux_O;
    wire [6:0] controller_to_mux_N;
    wire [6:0] controller_to_mux_E;
    
    wire [1:0] LED_wire;
    
    clk_wiz_0 Clk(.clk_in1(clk), .clk_out1(clk_5MHz));
    divider Divider(.clk_out(clk_1Hz), .reset(reset), .clk_in(clk_5MHz));
    divider2 Divider2(.clk_out(clk_10Hz), .reset(reset), .clk_in(clk_200Hz));
    framerate_divider framerate_divider(.reset(reset), .clk_in(clk_5MHz), .clk_out(clk_200Hz));
    
    debouncer minute_debouncer(.clk_in(clk_10Hz), .button_in(minutes), .button_out(minute_debouncer_to_controller));
    debouncer second_debouncer(.clk_in(clk_10Hz), .button_in(seconds), .button_out(second_debouncer_to_controller));
    
    controller controller(.enable(enable), .LED(LED_wire),
    .minutes(minute_debouncer_to_controller), 
    .seconds(second_debouncer_to_controller), .clock(clk_1Hz), .cook_time(cook_time), .start(start),
    .up(up), .reset(reset), .q_seconds(q_seconds), .q_minutes(q_minutes), 
    .minute_counter(minute_counter), .second_counter(second_counter),
    .controller_to_mux_D(controller_to_mux_D), .controller_to_mux_O(controller_to_mux_O), 
    .controller_to_mux_N(controller_to_mux_N), .controller_to_mux_E(controller_to_mux_E));
    
    c_counter_binary_0 MinuteCounter(.CLK(minute_counter), .SCLR(reset), .UP(up), .Q(q_minutes), .enable(enable));
    c_counter_binary_0 SecondCounter(.CLK(second_counter), .SCLR(reset), .UP(up), .Q(q_seconds), .enable(enable));
    
    binary_to_bcd minutes_to_bcd(.q(q_minutes), .bcd1(bcd_10minutes), .bcd2(bcd_minutes));
    binary_to_bcd seconds_to_bcd(.q(q_seconds), .bcd1(bcd_10seconds), .bcd2(bcd_seconds));
     
    segment minute10_segment(.q(bcd_10minutes), .seg(segment_to_mux_10minutes));
    segment minute_segment(.q(bcd_minutes), .seg(segment_to_mux_minutes));
    segment second10_segment(.q(bcd_10seconds), .seg(segment_to_mux_10seconds));
    segment second_segment(.q(bcd_seconds), .seg(segment_to_mux_seconds));
    
    mux mux(
    .seg_1(segment_to_mux_10seconds), .seg_2(segment_to_mux_seconds),
    .seg_3(segment_to_mux_10minutes), .seg_4(segment_to_mux_minutes), 
    .seg_5(controller_to_mux_E), .seg_6(controller_to_mux_N),
    .seg_7(controller_to_mux_O), .seg_8(controller_to_mux_D),
    .s(s), .seg(seg_wire), .an(an_wire));
        
    c_counter_binary_1 s_counter(.CLK(clk_200Hz), .Q(s));
 
    assign an = an_wire;
    assign seg = seg_wire;
    assign LED = LED_wire;
    
endmodule
