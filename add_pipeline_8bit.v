module add_pipeline_8bit (c1,c2,c3,c4,c5,c6,c7,c8,c9,clk,rst_n,sum);
	input [7:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;
	input clk,rst_n;
	output [11:0] sum ;
	wire [8:0] sum8_1,sum8_2,sum8_3,sum8_4;
	wire [9:0] sum9_1,sum9_2;
	wire [10:0] sum10_1;
	wire [10:0] c9_1;
	reg [30:0] r5;//10
fa_8bit fa1 (sum8_1,c1,c2);//dau ra 9 bit
fa_8bit fa2 (sum8_2,c3,c4);//dau ra 9 bit
fa_9bit fa3 (sum9_1,sum8_1,sum8_2);// dau ra 10 bit
fa_8bit fa4(sum8_3,c5,c6);
fa_8bit fa5(sum8_4,c7,c8);
fa_9bit fa6(sum9_2,sum8_3,sum8_4);	    
assign c9_1={2'b00,c9};

always @(posedge clk or negedge rst_n)
    begin
	  if(!rst_n)
	    r5<=31'd0;
	  else
	  begin
	    r5[9:0]<=sum9_1;
		r5[19:10]<=sum9_2;
		r5[30:20]<=c9_1;
	  end
	end
fa_10bit fa7(sum10_1,r5[9:0],r5[19:10]);//11bit
fa_11bit fa8(sum,sum10_1,r5[30:20]);

endmodule