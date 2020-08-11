
module tb_add_pipeline_8bit();
localparam T=20;
     reg [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;
	 reg clk,rst_n;
	 wire [11:0] sum;

add_pipeline_8bit addpipeline (c1,c2,c3,c4,c5,c6,c7,c8,c9,clk,rst_n,sum);

//
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
		#100
		rst_n = 1'b0;
    end
initial
   begin
		@(posedge clk);
		c1 =$random();
		c2 =$random();
		c3 =$random();
		c4 =$random();
		c5 =$random();
		c6 =$random();
		c7 =$random();
		c8 =$random();
		c9 =$random();
	   @(posedge clk);		
		c1 =$random();
		c2 =$random();
		c3 =$random();
		c4 =$random();
		c5 =$random();
		c6 =$random();
		c7 =$random();
		c8 =$random();
		c9 =$random();
	
	end
endmodule