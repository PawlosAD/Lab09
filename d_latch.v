`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name: 
// Module Name: d_latch
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

// Implements a basic level sensitive D latch with enable control
module d_latch(
    input D, // The Data input
    input E, // Enable signal
    output reg Q, // Output that holds D's latched value when E is high
    output NotQ // Complement of output Q
);

    // always block that triggers when D or E change. It ensures the latch responds to changes immediatly in either the enable signal or data input.
    always @(D, E) begin 
        // Checks if enable signal is active
        if (E)
            // Updates output Q to match input D if enable is high
            Q <= D; 
    end

    assign NotQ = ~Q; 

endmodule
