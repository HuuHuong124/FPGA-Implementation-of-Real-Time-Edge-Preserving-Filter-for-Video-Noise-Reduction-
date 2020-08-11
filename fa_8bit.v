module fa_1bit(s,c_out,a,b,c_in);
	output c_out, s;
	input a,b,c_in;
	assign s=a^b^c_in;
	assign c_out=(a&b)|(a&c_in)|(b&c_in);
endmodule
//======================================
//fa 8bit 
module fa_8bit (sum,a,b);
input [7:0] a,b;
output [8:0] sum;
wire [7:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
assign sum[8] = c[7];

endmodule
//======================================
//fa 9bit
module fa_9bit (sum,a,b);
input [8:0] a,b;
output [9:0] sum;
wire [8:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
assign sum[9] = c[8];

endmodule
//======================================
//fa 10bit
module fa_10bit (sum,a,b);
input [9:0] a,b;
output [10:0] sum;
wire [9:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
fa_1bit fa9(sum[9],c[9],a[9],b[9],c[8]);
assign sum[10] = c[9];

endmodule
//=====================================
//fa 11 bit
module fa_11bit (sum,a,b);
input [10:0] a,b;
output [11:0] sum;
wire [10:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
fa_1bit fa9(sum[9],c[9],a[9],b[9],c[8]);
fa_1bit fa10(sum[10],c[10],a[10],b[10],c[9]);
assign sum[11] = c[10];

endmodule
//=====================================
//fa 16 bit
module fa_16bit (sum,a,b);
input [15:0] a,b;
output [16:0] sum;
wire [15:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
fa_1bit fa9(sum[9],c[9],a[9],b[9],c[8]);
fa_1bit fa10(sum[10],c[10],a[10],b[10],c[9]);
fa_1bit fa11(sum[11],c[11],a[11],b[11],c[10]);
fa_1bit fa12(sum[12],c[12],a[12],b[12],c[11]);
fa_1bit fa13(sum[13],c[13],a[13],b[13],c[12]);
fa_1bit fa14(sum[14],c[14],a[14],b[14],c[13]);
fa_1bit fa15(sum[15],c[15],a[15],b[15],c[14]);

assign sum[16] = c[15];

endmodule
//============================================
//fa 17 bit
module fa_17bit (sum,a,b);
input [16:0] a,b;
output [17:0] sum;
wire [16:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
fa_1bit fa9(sum[9],c[9],a[9],b[9],c[8]);
fa_1bit fa10(sum[10],c[10],a[10],b[10],c[9]);
fa_1bit fa11(sum[11],c[11],a[11],b[11],c[10]);
fa_1bit fa12(sum[12],c[12],a[12],b[12],c[11]);
fa_1bit fa13(sum[13],c[13],a[13],b[13],c[12]);
fa_1bit fa14(sum[14],c[14],a[14],b[14],c[13]);
fa_1bit fa15(sum[15],c[15],a[15],b[15],c[14]);
fa_1bit fa16(sum[16],c[16],a[16],b[16],c[15]);
assign sum[17] = c[16];

endmodule
//=============================================
//fa 18 bit
module fa_18bit (sum,a,b);
input [17:0] a,b;
output [18:0] sum;
wire [17:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
fa_1bit fa9(sum[9],c[9],a[9],b[9],c[8]);
fa_1bit fa10(sum[10],c[10],a[10],b[10],c[9]);
fa_1bit fa11(sum[11],c[11],a[11],b[11],c[10]);
fa_1bit fa12(sum[12],c[12],a[12],b[12],c[11]);
fa_1bit fa13(sum[13],c[13],a[13],b[13],c[12]);
fa_1bit fa14(sum[14],c[14],a[14],b[14],c[13]);
fa_1bit fa15(sum[15],c[15],a[15],b[15],c[14]);
fa_1bit fa16(sum[16],c[16],a[16],b[16],c[15]);
fa_1bit fa17(sum[17],c[17],a[17],b[17],c[16]);
assign sum[18] = c[17];

endmodule
//=================================================
//fa 19 bit
module fa_19bit (sum,a,b);
input [18:0] a,b;
output [19:0] sum;
wire [18:0] c;

fa_1bit fa0(sum[0],c[0],a[0],b[0],1'b0);
fa_1bit fa1(sum[1],c[1],a[1],b[1],c[0]);
fa_1bit fa2(sum[2],c[2],a[2],b[2],c[1]);
fa_1bit fa3(sum[3],c[3],a[3],b[3],c[2]);
fa_1bit fa4(sum[4],c[4],a[4],b[4],c[3]);
fa_1bit fa5(sum[5],c[5],a[5],b[5],c[4]);
fa_1bit fa6(sum[6],c[6],a[6],b[6],c[5]);
fa_1bit fa7(sum[7],c[7],a[7],b[7],c[6]);
fa_1bit fa8(sum[8],c[8],a[8],b[8],c[7]);
fa_1bit fa9(sum[9],c[9],a[9],b[9],c[8]);
fa_1bit fa10(sum[10],c[10],a[10],b[10],c[9]);
fa_1bit fa11(sum[11],c[11],a[11],b[11],c[10]);
fa_1bit fa12(sum[12],c[12],a[12],b[12],c[11]);
fa_1bit fa13(sum[13],c[13],a[13],b[13],c[12]);
fa_1bit fa14(sum[14],c[14],a[14],b[14],c[13]);
fa_1bit fa15(sum[15],c[15],a[15],b[15],c[14]);
fa_1bit fa16(sum[16],c[16],a[16],b[16],c[15]);
fa_1bit fa17(sum[17],c[17],a[17],b[17],c[16]);
fa_1bit fa18(sum[18],c[18],a[18],b[18],c[17]);
assign sum[19] = c[18];

endmodule

