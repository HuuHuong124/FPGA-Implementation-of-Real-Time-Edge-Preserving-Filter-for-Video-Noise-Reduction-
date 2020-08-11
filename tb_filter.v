
`timescale 1 ps/ 1 ps
module tb_filter ();

parameter T=20;
reg [7:0] sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9;
//integer j;
reg clk,rst_n,act;
wire [7:0] cl_pixel;
wire wr;

filter fil(clk,rst_n,cl_pixel,act,wr,sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9);
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

initial begin 
  act = 0;
  #20;
  act = 1;
  #80;
  act = 0;
  end 
  
initial
begin
@(negedge clk )
sw_pixel_1=8'h8e;
sw_pixel_2=8'h8e;
sw_pixel_3=8'h9c;
sw_pixel_4=8'h8e;
sw_pixel_5=8'h8e;
sw_pixel_6=8'h9c;
sw_pixel_7=8'h9b;
sw_pixel_8=8'h9b;
sw_pixel_9=8'h88;
@(negedge clk )
sw_pixel_1=8'h8e;
sw_pixel_2=8'h9c;
sw_pixel_3=8'h85;
sw_pixel_4=8'h8e;
sw_pixel_5=8'h9c;
sw_pixel_6=8'h85;
sw_pixel_7=8'h9b;
sw_pixel_8=8'h88;
sw_pixel_9=8'h85;
@(negedge clk )
sw_pixel_1=8'h9c;
sw_pixel_2=8'h85;
sw_pixel_3=8'h8a;
sw_pixel_4=8'h9c;
sw_pixel_5=8'h85;
sw_pixel_6=8'h8a;
sw_pixel_7=8'h88;
sw_pixel_8=8'h85;
sw_pixel_9=8'h88;
@(negedge clk )
sw_pixel_1=8'h85;
sw_pixel_2=8'h8a;
sw_pixel_3=8'h8a;
sw_pixel_4=8'h85;
sw_pixel_5=8'h8a;
sw_pixel_6=8'h8a;
sw_pixel_7=8'h85;
sw_pixel_8=8'h88;
sw_pixel_9=8'h92;
end

endmodule
