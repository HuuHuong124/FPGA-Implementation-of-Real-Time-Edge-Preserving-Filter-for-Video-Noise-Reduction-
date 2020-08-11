module tb_mem();
  localparam T = 20;
  reg clk ,rd , rst_n ;
  reg wr;
  reg [7:0] cl_pixel;
  wire [7:0] sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9;
  wire done;
// internal signal 
reg [7:0] data_in[0:257][0:257];
integer i,j;
memory DUT (clk,rst_n,rd,wr,done,cl_pixel,sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9);
 initial begin 
  clk = 0; 
 forever #10 clk = ~clk;
end

initial begin 
  rst_n = 1 ;
  #5;
  rst_n = 0;
  #7;
  rst_n = 1;
  end 
initial begin 
  rd = 0;
  #10;
  rd = 1;
  end 
 
initial begin 
 $readmemh("E:/noisy_im_padding.mem",data_in); 
   for (i=0;i<258;i=i+1) begin 
     for (j=0;j<258;j=j+1) begin 
	   DUT.Mem_img[i][j] = data_in[i][j];
	   end 
	   end 
	   end 
	   
initial	
 begin
 wr = 1'b1;
 #110 wr = 1'b0;
 #120 wr = 1'b1;
 end
 
 initial
 begin
  cl_pixel = 0;
  #100 cl_pixel=255;
end
 endmodule