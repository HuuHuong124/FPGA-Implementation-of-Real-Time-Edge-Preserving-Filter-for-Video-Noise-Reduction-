module filter (clk,rst_n,cl_pixel,act,wr,sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9);

input  [7:0] sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9;
input clk , rst_n , act;
output  [7:0] cl_pixel ;
output wr;  
//internal signal 
reg [15:0]result_mul[8:0] ;
reg [7:0]result_c[8:0] ;
reg [15:0] r_div1;//so bi chia 15:0
reg [7:0] r_div2;// so chia
wire wr;
//wire tick;
//wire done_mem;
reg r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
wire [7:0]sw_pixels[0:8];
wire [7:0] c_tmp[0:8] ;
wire [15:0] result_tmp[0:8] ;
wire [11:0] sum_c;
wire [19:0] sum_mul;// tong ket qua bo nhan 16 bit
wire [15:0] result_div;
reg [7:0] result_final;
//output 
assign sw_pixels[0]=sw_pixel_1;
assign sw_pixels[1]=sw_pixel_2;
assign sw_pixels[2]=sw_pixel_3;
assign sw_pixels[3]=sw_pixel_4;
assign sw_pixels[4]=sw_pixel_5;
assign sw_pixels[5]=sw_pixel_6;
assign sw_pixels[6]=sw_pixel_7;
assign sw_pixels[7]=sw_pixel_8;
assign sw_pixels[8]=sw_pixel_9;


conv_mask  conv_0(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[0]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[0]),
        .c_i(c_tmp[0])
		 );
conv_mask  conv_1(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[1]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[1]),
        .c_i(c_tmp[1])
		 );
conv_mask  conv_2(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[2]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[2]),
        .c_i(c_tmp[2])
		 );
conv_mask  conv_3(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[3]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[3]),
        .c_i(c_tmp[3])
		 );
conv_mask  conv_4(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[4]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[4]),
        .c_i(c_tmp[4])
		 );
conv_mask  conv_5(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[5]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[5]),
        .c_i(c_tmp[5])
		 );
conv_mask  conv_6(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[6]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[6]),
        .c_i(c_tmp[6])
		 );
conv_mask  conv_7(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[7]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[7]),
        .c_i(c_tmp[7])
		 );
conv_mask  conv_8(
	    .clk(clk),
        .rst_n(rst_n),
		.act(act),
        .a(sw_pixels[8]),
	    .b(sw_pixels[4]),
	    .result(result_tmp[8]),
        .c_i(c_tmp[8])
		 );		 

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	begin
	    result_c[0] <= 1'b0;
		result_c[1] <= 1'b0;
		result_c[2] <= 1'b0;
		result_c[3] <= 1'b0;
		result_c[4] <= 1'b0;
	    result_c[5] <= 1'b0;
	    result_c[6] <= 1'b0;
		result_c[7] <= 1'b0;
		result_c[8] <= 1'b0;
	    result_mul[0]<= 1'b0;
	    result_mul[1]<= 1'b0;
	    result_mul[2]<= 1'b0;
	    result_mul[3]<= 1'b0;
	    result_mul[4]<= 1'b0;
	    result_mul[5]<= 1'b0;
	    result_mul[6]<= 1'b0;
	    result_mul[7]<= 1'b0;
	    result_mul[8]<= 1'b0;
	end
	else 
	begin
		result_c[0]<=c_tmp[0];
		result_c[1]<=c_tmp[1];
		result_c[2]<=c_tmp[2];
		result_c[3]<=c_tmp[3];
		result_c[4]<=c_tmp[4];
		result_c[5]<=c_tmp[5];
		result_c[6]<=c_tmp[6];
		result_c[7]<=c_tmp[7];
		result_c[8]<=c_tmp[8];
		
// ********************************** //

		result_mul[0]<=result_tmp[0];
		result_mul[1]<=result_tmp[1];
		result_mul[2]<=result_tmp[2];
		result_mul[3]<=result_tmp[3];
		result_mul[4]<=result_tmp[4];
		result_mul[5]<=result_tmp[5];
		result_mul[6]<=result_tmp[6];
		result_mul[7]<=result_tmp[7];
		result_mul[8]<=result_tmp[8];
	end
end

// module adder_pipeline
add_pipeline_8bit sum_1(result_c[0],result_c[1],result_c[2],result_c[3],result_c[4],result_c[5],result_c[6],result_c[7],result_c[8],clk,rst_n,sum_c);
add_pipeline_16bit sum_2 (result_mul[0],result_mul[1],result_mul[2],result_mul[3],result_mul[4],result_mul[5],result_mul[6],result_mul[7],result_mul[8],clk,rst_n,sum_mul);

always @(posedge clk or negedge rst_n)
begin
     if(!rst_n)
	 begin
	 r_div1<=16'b0;
	 r_div2<=8'b0;
	 end
	 else
	 begin
	 r_div1<= sum_mul[19:4];
	 r_div2<= sum_c[11:4];
	 end
end

  div_16bit_8bit div ({1'b0,r_div1[15:1]},{1'b0,r_div2[7:1]},clk,rst_n,result_div);

always @(posedge clk,negedge rst_n)
begin
if(!rst_n)
begin
r1 <= 1'b0;
r2 <= 1'b0;
r3 <= 1'b0;
r4 <= 1'b0;
r5 <= 1'b0;
r6 <= 1'b0;
r7 <= 1'b0;
r8 <= 1'b0;
r9 <= 1'b0;
r10<= 1'b0;
r11<= 1'b0;
end
else
begin
r1 <= act;
r2 <= r1;
r3 <= r2;
r4 <= r3;
r5 <= r4;
r6 <= r5;
r7 <= r6;
r8 <= r7;
r9 <= r8;
r10 <= r9;
r11 <= r10;
end
end
assign wr = r11;


always @(posedge clk , negedge rst_n)
   begin 
     if(!rst_n) 
	    result_final <= 8'd0;
	 else result_final <= result_div[7:0];
   end 
   
assign cl_pixel = result_final;  
//assign done =done_mem;    // signal annouces image conv_masking process is finished
endmodule







