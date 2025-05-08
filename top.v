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

// Connects user inputs to memory sytem and latch to display outputs on LEDs
module top(
    input [15:0] sw, // 16 slide switches on board as input
    input btnC, // Center pushbutton as control signal
    output [15:0] led /// 16 LEDs on board as output
);
    d_latch part1(
        .D(sw[0]), // Data input from switch 0
        .Q(led[0]), // Output Q to LED 0
        .NotQ(led[1]), // Inverted output to LED 1
        .E(btnC) // Enable latch with center button
    );
    memory_system part2(
        .data(sw[15:8]), // 8 bit data input from switches 15-8
        .addr(sw[7:6]), // 2 bit address input from switches 7-6
        .store(btnC), // Store control from center button
        .memory(led[15:8]) // 8 bit memory output to LEDs 15-8
    );

endmodule
