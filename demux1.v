`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:37:36 AM
// Design Name: 
// Module Name: demux1
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


module demux1(
    input store,
    input sel,
    output reg [1:0] store_out
    );

    always @(*)
    begin
        store_out = 2'b00;
        store_out[sel] = store;
    end

endmodule
