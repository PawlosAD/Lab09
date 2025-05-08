`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name:
// Module Name: byte_memory
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


module byte_memory(
    // This is a module that implements a single 8 bit memory register with a load enable
    input [7:0] data,
    input store,
    output reg [7:0] memory
);
    // The always block triggers whenever store or data changes and it makes sure that the memory register updates as soon as either the control signal or input data changes.
    always @(store, data) begin 
        // checks if the store control signal is active
        if (store)
            // if store control signal is active, then load the input data value into the 'memory'
            memory <= data; 
    end

endmodule


