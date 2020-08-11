module conv_mask (clk,rst_n,act,a,b,result,c_i);
 parameter N = 8;
 input  clk , rst_n , act;
 input wire [7:0] a , b;
 output  [15:0] result;
 output  [7:0] c_i;

wire [8:0] sub_total;
wire [7:0] sub_abs;
reg [15:0] r1,r2,r3,r4;
wire [15:0] result_mul1 , result_mul2 ,result_mul3 , result_mul4 ;

 sub_8bit_abs s_abs (a,b,sub_abs);
 sub_8bit sub (8'd255,sub_abs,sub_total);

always @(posedge clk , negedge rst_n)
 begin 
   if(!rst_n) 
     r1 <= 16'h0;
   else if(act)
     begin 
	   r1[7:0] <= sub_total[7:0]; 
       r1[15:8] <= a;
	 end 
 end 

// mul1 
 
 arr_mul mul1(r1[7:0],r1[7:0],result_mul1);

always @(posedge clk , negedge rst_n)
  begin 
    if(!rst_n) 
	   r2 <= 16'h0;
	else begin 
       r2[15:8] <= r1[15:8];
	   r2[7:0] <= result_mul1[15:8];
	end 
  end 
  
 // mul 2 
 
arr_mul mul2(r2[7:0],r2[7:0],result_mul2);

always @(posedge clk , negedge rst_n)
  begin 
    if(!rst_n) 
	   r3 <= 16'h0;
	else begin 
       r3[15:8] <= r2[15:8];
	   r3[7:0] <= result_mul2[15:8];
	end 
  end 
   
// mul 3

arr_mul mul3(r3[7:0],r3[7:0],result_mul3);

always @(posedge clk , negedge rst_n)
  begin 
    if(!rst_n) 
	   r4 <= 16'h0;
	else begin 
       r4[15:8] <= r3[15:8];
	   r4[7:0] <= result_mul3[15:8];
	end 
  end 
  
assign c_i = r4[7:0];
// mul 4 
arr_mul mul4(r4[7:0],r4[15:8],result_mul4);
// result 
assign result = result_mul4;
   	 
endmodule













   
