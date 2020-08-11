module div_16bit_8bit_tb();
reg [15:0] a;
reg [7:0] b;
reg clk,rst_n;
//wire [7:0] r;   // so du
wire [15:0] q;   // thuong
 

div_16bit_8bit test(a,b,clk,rst_n,q);

initial
  begin
    clk = 1'b1;
	forever #50 clk = ~clk;
  end

initial
  begin 
    rst_n = 1'b1;
	#5 rst_n = 1'b0;
	#5 rst_n =1'b1;
  end

initial
  begin
    @(negedge clk ) a= 16'b1010100101010101; b=8'b00000011;
	@(negedge clk) a= 16'b1011011101010101; b=8'b01000011;
	end
endmodule