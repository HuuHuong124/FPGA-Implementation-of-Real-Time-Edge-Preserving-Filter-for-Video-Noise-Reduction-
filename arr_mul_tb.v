module arr_mul_tb ;
reg [7:0] a;
reg [7:0] b;
wire [15:0] x;
arr_mul mul_8b(a,b,x);
initial
begin
 a=8'd255 ; b=8'd255;
#20  a=8'd25 ; b=8'd55;
#20  a=8'd25 ; b=8'd4;
#20  a=8'd5 ; b=8'd10;
#20  a=8'd25 ; b=8'd10;
#20  a=8'd55 ; b=8'd30;
#20  a=8'd12 ; b=8'd13;
#20  a=8'd255 ; b=8'd254;
#20  a=8'd255 ; b=8'd254;
end
endmodule