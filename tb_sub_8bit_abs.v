module tb_sub_8bit_abs;
  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] sub_abs;
  
  
  sub_8bit_abs uut(.a(a), .b(b), .sub_abs(sub_abs));

 initial
   begin
    for(a=255;a>250;a=a-1)
	  begin
        for(b=70; b<100; b = b+1)
		begin
		  #10;
		end
	  end    
  end
endmodule