`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:03 10/07/2014 
// Design Name: 
// Module Name:    sim_top 
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
module sim_top();
  reg [7:0] led;  // not a wire!
  reg clock, rst;
  reg sig;
  
  always begin
    #1 clock = !clock;
  end
  
  initial begin
    led = 8'b0;
	 sig = 1'b0;
	 clock = 1'b0;
    rst = 1'b1;
    #1
    rst = 1'b0;	 
	
	 #8
	 $finish;
  end
  
  pwm #(.CTR_SIZE(3)) pwm (
    .rst(rst),
	 .clk(clock),
	 .compare(3),
	 .pwm(sig)
	 );
  
  // generate 8 pulse waveforms and output to LED array
/*
genvar i;
generate
    for (i = 0; i < 8; i=i+1) begin: pwm_gen_loop
        pwm #(.CTR_SIZE(3)) pwm (
            .rst(rst),
            .clk(clock),
            .compare(i),
            .pwm(led[i])
        );
    end
endgenerate
*/

endmodule
