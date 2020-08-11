module tb_controller();
 reg clk ,rst_n ;
 reg en  ; 
 wire rd , act ;
 
controller DUT (clk,en,rst_n,act,rd);
  initial  
    begin 
	clk = 0;
   forever #50 clk = ~clk;
   end 
 initial begin 
   rst_n = 1 ;
  #10; 
    rst_n = 0;
  # 20 ; 
    rst_n = 1;
end 

initial begin 
  en = 1 ;
  #120;
   en = 0;
  end 
  endmodule