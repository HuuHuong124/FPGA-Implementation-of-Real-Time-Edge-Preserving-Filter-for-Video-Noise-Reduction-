`timescale 1ps/1ps
module tb_top_edge_preseving_filter ();

parameter T=20;
reg clk ,rst_n ,en;
wire done;
reg [7:0] data_in [0:257][0:257];
reg [7:0] filted_img [0:255][0:255];
integer m,n;
   top_edge_preseving_filter top(clk,rst_n,en ,done );
initial
begin
clk=0;
forever #(T/2) clk=~clk;
end
initial
begin
rst_n=0;
#5
rst_n=1;
end
initial
begin
en=1;
#16;
en = 0;
end
initial begin 
 $readmemh("C:/Users/huuhuong/Desktop/VLSI/code20_6/code20_6/noisy_im_padding.mem",data_in); 
 $readmemh("C:/Users/huuhuong/Desktop/VLSI/code20_6/code20_6/fil_im.mem",filted_img); 
   for (m=0;m<258;m=m+1) begin 
     for (n=0;n<258;n=n+1) begin 
	   top.mem.Mem_img[m][n] = data_in[m][n];
	   end 
	   end 
  end 
  
initial
 begin 
 #(65540*20);     // time delay use to compare result from MEMORY 
     for (m=0;m<256;m=m+1) begin 
       for (n=0;n<256;n=n+1) begin 
	     if(top.mem.Mem_fil_img[m][n]!= filted_img[m][n])
	 begin
	 $display("sai o vi tri hang :%d, cot : %d",m,n);
	 end
	 end
	 end
	 $finish ;
 end 
endmodule