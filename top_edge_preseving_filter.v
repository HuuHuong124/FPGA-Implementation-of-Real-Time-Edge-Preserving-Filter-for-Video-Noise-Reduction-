module top_edge_preseving_filter (clk,rst_n,en,done);
input clk , rst_n , en;
output done ;
wire done_mem;

wire  [7:0] cl_pixel ;   // data is filted
wire wr;      // signal write into mem2
wire rd ,act;     // signal read from mem1
wire [7:0] sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9;  

controller control (clk,en,rst_n,act,rd); 
memory mem (clk,rst_n,rd,wr,done_mem,cl_pixel,sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9);
filter fil(clk,rst_n,cl_pixel,act,wr,sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9);
assign done = done_mem;
endmodule