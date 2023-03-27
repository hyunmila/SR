`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 20:55:57
// Design Name: 
// Module Name: delay_line
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


module delay_line#
(
    parameter N = 1,
    parameter DELAY = 1
)
(
    input clk,
    input ce,
    input [N-1:0]idata,
    output [N-1:0]odata
);
wire [N-1:0] tdata [DELAY:0];
genvar i;
assign tdata[0] = idata;
generate
    if (DELAY == 0)
    begin
        assign odata = idata;
    end
    if (DELAY > 0)
    begin
        for(i=0; i<DELAY; i=i+1)
        begin
            register#
            (
                .N(N)
            ) 
            wywolanie_rejestru
            (
            .clk(clk),
            .ce(ce),
            .d(tdata[i]),
            .q(tdata[i+1])
            );
        end
    end
endgenerate
assign odata = tdata[DELAY];
endmodule

