`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 21:52:46
// Design Name: 
// Module Name: tb_addition
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


module tb_addition(
    );
    wire[20:0]Y;
    reg[9:0]A=10'b0001010011;
    reg[9:0]B=10'b1100110110;
    reg[9:0]C=10'b0010010001;
    reg clk=1'b0;
    reg ce=1'b1;

    initial
    begin
        while(1)
        begin
            #1; clk=1'b0;
            #1; clk=1'b1;
        end
    end

    addition main(
        .clk(clk),
        .ce(ce),
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
    );

endmodule
