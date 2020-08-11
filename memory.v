module memory (clk,rst_n,rd,wr,done,cl_pixel,sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9);
 localparam N = 8;

  input clk ,rd , rst_n,wr ;
   input [7:0] cl_pixel;
   output reg [7:0] sw_pixel_1,sw_pixel_2,sw_pixel_3,sw_pixel_4,sw_pixel_5,sw_pixel_6,sw_pixel_7,sw_pixel_8,sw_pixel_9;
output reg done ;

reg [7:0] x_rd,y_rd,x_wr,y_wr;
wire tick_rd,tick_wr;
// declaration two Memory 
reg [7:0] Mem_img [0:257][0:257];      // Mem_img storage noise image 
reg [7:0] Mem_fil_img [0:255][0:255];  // Mem_fil_img storage image is filter

 //khoi tao dia chi doc tu Mem_img
 
always@(posedge clk,negedge rst_n)
  begin 
    if(!rst_n)
	   x_rd <= 8'h0;
    else if(rd)
	  begin
        if(x_rd == 8'hFF) 
	       x_rd <= 8'h0;
	    else 
	      x_rd <= x_rd+1;
      end
	 else
	   x_rd <= 8'h0;
   end 
//assign col_next = col_reg + 1;  // chay chi so hang
assign tick_rd = (x_rd == 8'hFF) ? 1'b1:1'b0;


always@(posedge clk,negedge rst_n)
  begin 
    if(!rst_n)
	   y_rd <= 8'h0;
    else if(rd)
	  begin
	    if(tick_rd)
          begin 
            if (y_rd ==8'hFF)	
              y_rd <= 8'h0;
          else			
	          y_rd <= y_rd +1;
          end 
	  end
	 else
	    y_rd <= 8'h0;
  end	   

//assign row_next = row_reg +1;

// output 
always @*
 begin
  case(rd)
    1'b1:  
     begin
       sw_pixel_1 = Mem_img[y_rd][x_rd]; 
       sw_pixel_2 = Mem_img[y_rd][x_rd+1];
       sw_pixel_3 = Mem_img[y_rd][x_rd+2];
       sw_pixel_4 = Mem_img[y_rd+1][x_rd];
       sw_pixel_5 = Mem_img[y_rd+1][x_rd+1];
       sw_pixel_6 = Mem_img[y_rd+1][x_rd+2];
       sw_pixel_7 = Mem_img[y_rd+2][x_rd];
       sw_pixel_8 = Mem_img[y_rd+2][x_rd+1];
       sw_pixel_9 = Mem_img[y_rd+2][x_rd+2];
     end
   default:
     begin
       sw_pixel_1 = 8'h0;
       sw_pixel_2 = 8'h0;
       sw_pixel_3 = 8'h0;
       sw_pixel_4 = 8'h0;
       sw_pixel_5 = 8'h0;
       sw_pixel_6 = 8'h0;
       sw_pixel_7 = 8'h0;
       sw_pixel_8 = 8'h0;
       sw_pixel_9 = 8'h0;
     end	   
  endcase   
end
//----------write to memory------------

always@(posedge clk,negedge rst_n)
  begin 
    if(!rst_n)
	   x_wr <= 8'h0;
    else if(wr)
	  begin
        if(x_wr == 8'hFF) 
	      x_wr <= 8'h0;
	    else 
	      x_wr <= x_wr+1;
      end
	else
	  x_wr <= 8'h0;
   end 

assign tick_wr = (x_wr == 8'hFF) ? 1'b1:1'b0;


always@(posedge clk,negedge rst_n)
  begin 
    if(!rst_n)
	   y_wr <= 8'h0;
    else if(wr)
       begin
	    if(tick_wr)
          begin 
            if (y_wr ==8'hFF)	
              y_wr <= 8'h0;
            else			
	          y_wr <= y_wr +1;
          end 
       end
  	 else
	    y_wr <= 8'h0;
  end

// luu pixel vao thanh ghi
always @*
 begin
  if(wr)
    Mem_fil_img[y_wr][x_wr] = cl_pixel;
  else  Mem_fil_img[y_wr][x_wr] = 8'd0;
  end
  
 always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
	  done <=1'b0;
	 else if (x_rd==8'hFF && y_rd==8'hFF)
	  done<=1'b1;
	 else
	  done<=1'b0;
  end
endmodule




