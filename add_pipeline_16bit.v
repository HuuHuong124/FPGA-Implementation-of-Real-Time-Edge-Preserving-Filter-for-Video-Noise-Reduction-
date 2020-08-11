module add_pipeline_16bit (c1,c2,c3,c4,c5,c6,c7,c8,c9,clk,rst_n,sum);
	input [15:0] c1,c2,c3,c4,c5,c6,c7,c8,c9;
	input clk,rst_n;
	output [19:0] sum ;
	wire [16:0] sum8_1,sum8_2,sum8_3,sum8_4;
	wire [17:0] sum9_1,sum9_2;
	wire [18:0] sum10_1;
	wire [18:0] c9_1;
	reg [54:0] r5;
fa_16bit fa1 (sum8_1,c1,c2);//dau ra 17 bit
fa_16bit fa2 (sum8_2,c3,c4);//dau ra 17 bit
fa_17bit fa3 (sum9_1,sum8_1,sum8_2);// dau ra 10 bit
fa_16bit fa4(sum8_3,c5,c6);
fa_16bit fa5(sum8_4,c7,c8);
fa_17bit fa6(sum9_2,sum8_3,sum8_4);	    
assign c9_1={2'b00,c9};

always @(posedge clk or negedge rst_n)
    begin
	  if(!rst_n)
	    r5<=55'd0;
	  else
	  begin
	    r5[17:0]<=sum9_1;//36 19
		r5[35:18]<=sum9_2;
		r5[54:36]<=c9_1;
	  end
	end
fa_18bit fa7(sum10_1,r5[17:0],r5[35:18]);//11bit
fa_19bit fa8(sum,sum10_1,r5[54:36]);

endmodule
