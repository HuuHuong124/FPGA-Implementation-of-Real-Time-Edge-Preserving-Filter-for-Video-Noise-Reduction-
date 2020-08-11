`timescale 1 ps/ 1 ps
module tb_conv_mask();
localparam T=20;

	reg clk,rst_n,act;
	reg [7:0] a,b;
	wire [15:0] result;
	wire [7:0] c_i;
        integer i;  
    conv_mask result_1 (clk,rst_n,act,a,b,result,c_i);
	always                                                 
	begin                                                  
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end
	initial
	begin 
         
	  rst_n = 1'b0;
		@(posedge clk);
		rst_n = 1'b1;
		//@(posedge clk);
		for(i= 0; i < 8; i=i+1) begin
			a[i] = $random();
			b[i] = $random();
		end
                @(negedge clk )
                      a=255;
                      b=50;
@(negedge clk )
                      a=30;
                      b=70;
              //  @(posedge clk)
                    //  a=

	end
endmodule