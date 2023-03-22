`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 09:59:46 AM
// Design Name: 
// Module Name: maszyna_stanow
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


module maszyna_stanow(
    input clk,
    input rst,
    input send,
    input [7:0]data,
    output txd
    );
localparam state0 = 2'd0; 
localparam state1 = 2'd1;
localparam state2 = 2'd2;
localparam state3 = 2'd3;

reg send_status = 1'b0;
reg [1:0]state = state0;
reg r_txd = 0;
reg [7:0]r_data = 8'd0;
reg [2:0] cnt = 3'd0;

always @ (posedge clk)
    begin
        // send_status <= send;
        if(rst)
            begin
            state<=state0;
            // cnt <= 3'd0;
            send_status <= 1'b0;
            end
        else
            begin
            case(state)
            state0:
                begin
                if(send & ~send_status)
                    begin
                    r_data <= data;
                    state<= state1;
                    end
                send_status <= send;
                end
            state1:
                begin
                r_txd <= 1'b1;
                state<= state2;
                send_status <= send;
                end
            state2:
                begin
                if (cnt == 7)
                    begin
                    r_txd <= r_data[cnt];
                    cnt = 3'd0;
                    state<= state3;
                    end
                else
                    begin
                    r_txd <= r_data[cnt];
                    cnt <= cnt +1;
                    end
                send_status <= send;
                end
            state3:
                begin
                r_txd <= 1'b0;
                state <= state0;
                send_status <= send;
                end
            endcase
            end
    end
assign txd = r_txd;
endmodule
