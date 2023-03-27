`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 11:07:54 AM
// Design Name: 
// Module Name: addition
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


module addition(
    input clk,
    input ce,
    input [9:0] A,
    input [9:0] B,
    input [9:0] C,
    output [20:0] Y
    );
    wire signed [9:0]A_wired;
    wire signed [9:0]B_wired;
    wire signed [9:0]C_wired;
    wire signed [10:0]A_B_wired;
    wire signed [20:0]Y_wired;

// latency = 2
    c_addsub_0 dodawanie(
        .A(A_wired),
        .B(B_wired),
        .CLK(clk),
        .CE(ce),
        .S(A_B_wired)
    );
    delay_line#(
        .N(10),
        .DELAY(2)
    )
    delay_call
    (
        .clk(clk),
        .ce(ce),
        .idata(C),
        .odata(C_wired)
    );
    mult_gen_0 mnozarka(
        .CLK(clk),
        .A(A_B_wired),
        .B(C_wired),
        .CE(ce),
        .P(Y_wired)
    );
    assign A_wired = A;
    assign B_wired = B;
    assign Y = Y_wired;
endmodule
