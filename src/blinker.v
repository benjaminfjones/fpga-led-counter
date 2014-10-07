`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:44 10/07/2014 
// Design Name: 
// Module Name:    blinker 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module blinker(
    input clk,
	 input rst,
	 output blink
    );

// flipflop signals
reg [24:0] counter_q, counter_d;

// blink output is the MSB of counter_d, on half time, off half time
assign blink = counter_d[24];

// increment a the counter
always@(counter_q) begin
    counter_d = counter_q + 1'b1;
end

// implement the D-flipflop
always@(posedge clk) begin
   if (rst) begin
	   counter_q <= 25'b0;
	end else begin
	    counter_q <= counter_d;
	end
end

endmodule
