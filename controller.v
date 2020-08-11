module controller (clk,en,rst_n,act,rd); 
   input clk ,rst_n ;
   input en  ; 
   output reg rd ;
   output act ;
wire en1;
//reg [4:0] cnt;
reg [15:0] cnt;  
wire tick; 
 always @(posedge clk , negedge rst_n)
  begin 
    if(!rst_n)
	  rd <= 'h0;
	else if(en1) 
	  rd <= en;
  end 
//assign tick = (cnt == 5'd31) ? 1'b1 : 1'b0;
assign tick = (cnt == 16'hFFFF) ? 1'b1 : 1'b0;
assign en1 = en | tick; 

 always @(posedge clk , negedge rst_n)
  begin 
     if(!rst_n)  
	    cnt <= 'h0;
	 else if(rd)
	    cnt <= cnt + 1'b1;
  end 
 
assign act = rd;
endmodule 


