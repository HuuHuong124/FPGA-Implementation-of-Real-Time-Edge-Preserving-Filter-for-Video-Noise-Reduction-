module fulladd(s,c_out,a,b,c_in);
	output c_out, s;
	input a,b,c_in;
	assign s=a^b^c_in;
	assign c_out=(a&b)|(a&c_in)|(b&c_in);
endmodule
//=======================
module arr_mul(a,b,x);//x=a*b
	input [7:0] a,b;
	output [15:0] x;
	wire [63:0]c;
	wire [63:0]s;  //s,cout,a,b,cin
	
// module adder 8 bit 	
fulladd fa0 (s[0],c[0],a[0]&b[0],1'b0,1'b0);
fulladd fa1 (s[1],c[1],a[1]&b[0],1'b0,c[0]);
fulladd fa2 (s[2],c[2],a[2]&b[0],1'b0,c[1]);
fulladd fa3 (s[3],c[3],a[3]&b[0],1'b0,c[2]);
fulladd fa4 (s[4],c[4],a[4]&b[0],1'b0,c[3]);
fulladd fa5 (s[5],c[5],a[5]&b[0],1'b0,c[4]);
fulladd fa6 (s[6],c[6],a[6]&b[0],1'b0,c[5]);
fulladd fa7 (s[7],c[7],a[7]&b[0],1'b0,c[6]);
//
fulladd fa8 (s[8],c[8],a[0]&b[1],s[1],1'b0);
fulladd fa9 (s[9],c[9],a[1]&b[1],s[2],c[8]);
fulladd fa10(s[10],c[10],a[2]&b[1],s[3],c[9]);
fulladd fa11(s[11],c[11],a[3]&b[1],s[4],c[10]);
fulladd fa12(s[12],c[12],a[4]&b[1],s[5],c[11]);
fulladd fa13(s[13],c[13],a[5]&b[1],s[6],c[12]);
fulladd fa14(s[14],c[14],a[6]&b[1],s[7],c[13]);
fulladd fa15(s[15],c[15],a[7]&b[1],c[7],c[14]);
//
fulladd fa16 (s[16],c[16],a[0]&b[2],s[9],1'b0);
fulladd fa17 (s[17],c[17],a[1]&b[2],s[10],c[16]);
fulladd fa18(s[18],c[18],a[2]&b[2],s[11],c[17]);
fulladd fa19(s[19],c[19],a[3]&b[2],s[12],c[18]);
fulladd fa20(s[20],c[20],a[4]&b[2],s[13],c[19]);
fulladd fa21(s[21],c[21],a[5]&b[2],s[14],c[20]);
fulladd fa22(s[22],c[22],a[6]&b[2],s[15],c[21]);
fulladd fa23(s[23],c[23],a[7]&b[2],c[15],c[22]);
//
fulladd fa24 (s[24],c[24],a[0]&b[3],s[17],1'b0);
fulladd fa25 (s[25],c[25],a[1]&b[3],s[18],c[24]);
fulladd fa26(s[26],c[26],a[2]&b[3],s[19],c[25]);
fulladd fa27(s[27],c[27],a[3]&b[3],s[20],c[26]);
fulladd fa28(s[28],c[28],a[4]&b[3],s[21],c[27]);
fulladd fa29(s[29],c[29],a[5]&b[3],s[22],c[28]);
fulladd fa30(s[30],c[30],a[6]&b[3],s[23],c[29]);
fulladd fa31(s[31],c[31],a[7]&b[3],c[23],c[30]);
//
fulladd fa32 (s[32],c[32],a[0]&b[4],s[25],1'b0);
fulladd fa33 (s[33],c[33],a[1]&b[4],s[26],c[32]);
fulladd fa34(s[34],c[34],a[2]&b[4],s[27],c[33]);
fulladd fa35(s[35],c[35],a[3]&b[4],s[28],c[34]);
fulladd fa36(s[36],c[36],a[4]&b[4],s[29],c[35]);
fulladd fa37(s[37],c[37],a[5]&b[4],s[30],c[36]);
fulladd fa38(s[38],c[38],a[6]&b[4],s[31],c[37]);
fulladd fa39(s[39],c[39],a[7]&b[4],c[31],c[38]);
//
fulladd fa40 (s[40],c[40],a[0]&b[5],s[33],1'b0);
fulladd fa41 (s[41],c[41],a[1]&b[5],s[34],c[40]);
fulladd fa42(s[42],c[42],a[2]&b[5],s[35],c[41]);
fulladd fa43(s[43],c[43],a[3]&b[5],s[36],c[42]);
fulladd fa44(s[44],c[44],a[4]&b[5],s[37],c[43]);
fulladd fa45(s[45],c[45],a[5]&b[5],s[38],c[44]);
fulladd fa46(s[46],c[46],a[6]&b[5],s[39],c[45]);
fulladd fa47(s[47],c[47],a[7]&b[5],c[39],c[46]);
//
fulladd fa48 (s[48],c[48],a[0]&b[6],s[41],1'b0);
fulladd fa49 (s[49],c[49],a[1]&b[6],s[42],c[48]);
fulladd fa50(s[50],c[50],a[2]&b[6],s[43],c[49]);
fulladd fa51(s[51],c[51],a[3]&b[6],s[44],c[50]);
fulladd fa52(s[52],c[52],a[4]&b[6],s[45],c[51]);
fulladd fa53(s[53],c[53],a[5]&b[6],s[46],c[52]);
fulladd fa54(s[54],c[54],a[6]&b[6],s[47],c[53]);
fulladd fa55(s[55],c[55],a[7]&b[6],c[47],c[54]);
//
fulladd fa56 (s[56],c[56],a[0]&b[7],s[49],1'b0);
fulladd fa57 (s[57],c[57],a[1]&b[7],s[50],c[56]);
fulladd fa58(s[58],c[58],a[2]&b[7],s[51],c[57]);
fulladd fa59(s[59],c[59],a[3]&b[7],s[52],c[58]);
fulladd fa60(s[60],c[60],a[4]&b[7],s[53],c[59]);
fulladd fa61(s[61],c[61],a[5]&b[7],s[54],c[60]);
fulladd fa62(s[62],c[62],a[6]&b[7],s[55],c[61]);
fulladd fa63(s[63],c[63],a[7]&b[7],c[55],c[62]);
	assign x[0]=s[0];
	assign x[1]=s[8];
	assign x[2]=s[16];
	assign x[3]=s[24];
	assign x[4]=s[32];
	assign x[5]=s[40];
	assign x[6]=s[48];
	assign x[7]=s[56];
	assign x[8]=s[57];
	assign x[9]=s[58];
	assign x[10]=s[59];
	assign x[11]=s[60];
	assign x[12]=s[61];
	assign x[13]=s[62];
	assign x[14]=s[63];
	assign x[15]=c[63];
endmodule
