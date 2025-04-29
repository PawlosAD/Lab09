`timescale 1ns / 1ps

module byte_memory(
    input [7:0] data,
    input clk,
    input store,
    output reg [7:0] memory
);

    always @(posedge clk) begin
        if (store)
            memory <= data;
    end

endmodule

