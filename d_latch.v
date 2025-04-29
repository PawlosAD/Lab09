`timescale 1ns / 1ps

module d_latch(
    input d,
    input enable,
    output reg q
    );

    always @ (enable, d)
    begin
        if (enable)
            q = d;
    end

endmodule

