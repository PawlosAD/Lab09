`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input btnC,                  // central button to store
    input [1:0] sw_addr,         // switches for address
    input [7:0] sw_data,         // switches for data
    output [7:0] led_out         // leds for memory output
    );

    memory_system mem_sys(
        .clk(clk),
        .store(btnC),
        .data_in(sw_data),
        .address(sw_addr),
        .data_out(led_out)
    );

endmodule
