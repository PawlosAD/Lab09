`timescale 1ns / 1ps

module d_latch(
    input D, E,
    output reg Q,
    output NotQ

);

    // Will contain D-Latch behavior
    always @(D or E) begin
    if (E) begin
        Q <= D;
    end
    
  end

assign NotQ = -Q;
endmodule
