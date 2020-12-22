`timescale 1ns / 1ps
//This warning is okay to ignore: WARNING:Xst:1336 -  (*) More than 100% of Device resources are used

//keep port description below, intact.
module extra1_top(
     input clk,
    input [31:0] A_in,
    input [31:0] B_in,
    input [31:0] C_in,
    output [35:0] Q
    );
     
/* VERSION 1-Tsotne
=========================================================================
Advanced HDL Synthesis Report

Macro Statistics
# Adders/Subtractors                                   : 2
 32-bit adder carry out                                : 1
 36-bit adder                                          : 1
# Registers                                            : 132
 Flip-Flops                                            : 132
 
 

Timing Summary:
---------------
Speed Grade: -4

   Minimum period: 7.803ns (Maximum Frequency: 128.156MHz) <<< that is 128 milion operations per second
   Minimum input arrival time before clock: 2.059ns
   Maximum output required time after clock: 4.283ns
   Maximum combinational path delay: No path found
*/   
	   reg [31:0] res1, res2 = 0, new_res1 = 0, new_res2= 0, res1_changed = 0, res2_changed = 0, C_1, C_2;
     reg [35:0] result;
     reg [31:0] A, B, C;
     always @(posedge clk)
     begin
         //keep following 3 lines intact, and do the operations on A,B,C
         A<= A_in; 
         B<= B_in;
         C<= C_in;
         
         // while implementing the execution of ecuation, don't open brackets, 
            //meaning, don't do ... A*4 + B*4 
            
         // while keeping the brackets, you can still do:
            //A+B->res1, 
            //res1*4->res2, 
            //res2+C, 
        
        //after doing so, prepare synthesis and simulation data for reports
            //and then do anything to improve, includin opening brackets
        
         //result <= ((A+B)*4)+C; 
			
			res1 <= A+B;
			C_1 <= C;
			C_2 <= C_1;
			
			//new_res1 <= res1;
			//assign res1_changed = (new_res1 != res1) ? 1 : 0;
			
			//new_res2 <= res2;
			//assign res2_changed = (new_res2 != res2) ? 1 : 0;
			
			//if (res1_changed) begin
				res2 <= res1 << 2;
			//end
			
			//if (res2_changed) begin
				result <= res2 + C_2;
			//end
	  end
     
     //keep that intact also
     assign Q = result; 
     
endmodule