module cas_1bit(a,b,t,c_in,r,q);
input a,b;
input c_in;
input t;
output q;
output r;

wire b1;

assign b1 = b ^ t;
assign r  = a ^ b1 ^ c_in;
assign q = (a & b1) | (b1 & c_in) | (a & c_in);

endmodule

// bo chia 4bit cho 2 bit
module div_16bit_8bit(a,b,clk,rst_n,q);
input [15:0] a;    // so bi chia
input [7:0] b;    // so chia
input clk,rst_n;
output [15:0] q;   // thuong nhet them cac bit 0

wire [7:0] rem15, rem14,rem13,rem12,rem11, rem10,rem9,rem8,rem7, rem6,rem5,rem4,rem3,rem2,rem1,rem0;
wire [6:0]c_t15,c_t14,c_t13,c_t12,c_t11,c_t10,c_t9,c_t8,c_t7,c_t6,c_t5,c_t4,c_t3,c_t2,c_t1,c_t0;
wire [15:0] a_r1,a_r2,a_r3;
wire [7:0] b_r1,b_r2,b_r3;
wire t_r1,t_r2,t_r3;
wire [6:0] rem_r1,rem_r2,rem_r3;
reg  [34:0] r1;
reg  [38:0]r2;
reg  [42:0]r3;
wire [15:0] q_tmp;


// tang 15
cas_1bit cas_15_0 (a[15],b[0],1'b1,1'b1,rem15[0],c_t15[0]);
cas_1bit cas_15_1 (1'b0,b[1],1'b1,c_t15[0],rem15[1],c_t15[1]);
cas_1bit cas_15_2 (1'b0,b[2],1'b1,c_t15[1],rem15[2],c_t15[2]);
cas_1bit cas_15_3 (1'b0,b[3],1'b1,c_t15[2],rem15[3],c_t15[3]);
cas_1bit cas_15_4 (1'b0,b[4],1'b1,c_t15[3],rem15[4],c_t15[4]);
cas_1bit cas_15_5 (1'b0,b[5],1'b1,c_t15[4],rem15[5],c_t15[5]);
cas_1bit cas_15_6 (1'b0,b[6],1'b1,c_t15[5],rem15[6],c_t15[6]);
cas_1bit cas_15_7 (1'b0,b[7],1'b1,c_t15[6],rem15[7],q_tmp[15]);

// tang 14
cas_1bit cas_14_0 (a[14],b[0],q_tmp[15],q_tmp[15],rem14[0],c_t14[0]);
cas_1bit cas_14_1 (rem15[0],b[1],q_tmp[15],c_t14[0],rem14[1],c_t14[1]);
cas_1bit cas_14_2 (rem15[1],b[2],q_tmp[15],c_t14[1],rem14[2],c_t14[2]);
cas_1bit cas_14_3 (rem15[2],b[3],q_tmp[15],c_t14[2],rem14[3],c_t14[3]);
cas_1bit cas_14_4 (rem15[3],b[4],q_tmp[15],c_t14[3],rem14[4],c_t14[4]);
cas_1bit cas_14_5 (rem15[4],b[5],q_tmp[15],c_t14[4],rem14[5],c_t14[5]);
cas_1bit cas_14_6 (rem15[5],b[6],q_tmp[15],c_t14[5],rem14[6],c_t14[6]);
cas_1bit cas_14_7 (rem15[6],b[7],q_tmp[15],c_t14[6],rem14[7],q_tmp[14]);

// tang 13
cas_1bit cas_13_0 (a[13],b[0],q_tmp[14],q_tmp[14],rem13[0],c_t13[0]);
cas_1bit cas_13_1 (rem14[0],b[1],q_tmp[14],c_t13[0],rem13[1],c_t13[1]);
cas_1bit cas_13_2 (rem14[1],b[2],q_tmp[14],c_t13[1],rem13[2],c_t13[2]);
cas_1bit cas_13_3 (rem14[2],b[3],q_tmp[14],c_t13[2],rem13[3],c_t13[3]);
cas_1bit cas_13_4 (rem14[3],b[4],q_tmp[14],c_t13[3],rem13[4],c_t13[4]);
cas_1bit cas_13_5 (rem14[4],b[5],q_tmp[14],c_t13[4],rem13[5],c_t13[5]);
cas_1bit cas_13_6 (rem14[5],b[6],q_tmp[14],c_t13[5],rem13[6],c_t13[6]);
cas_1bit cas_13_7 (rem14[6],b[7],q_tmp[14],c_t13[6],rem13[7],q_tmp[13]);

// tang 12
cas_1bit cas_12_0 (a[12],b[0],q_tmp[13],q_tmp[13],rem12[0],c_t12[0]);
cas_1bit cas_12_1 (rem13[0],b[1],q_tmp[13],c_t12[0],rem12[1],c_t12[1]);
cas_1bit cas_12_2 (rem13[1],b[2],q_tmp[13],c_t12[1],rem12[2],c_t12[2]);
cas_1bit cas_12_3 (rem13[2],b[3],q_tmp[13],c_t12[2],rem12[3],c_t12[3]);
cas_1bit cas_12_4 (rem13[3],b[4],q_tmp[13],c_t12[3],rem12[4],c_t12[4]);
cas_1bit cas_12_5 (rem13[4],b[5],q_tmp[13],c_t12[4],rem12[5],c_t12[5]);
cas_1bit cas_12_6 (rem13[5],b[6],q_tmp[13],c_t12[5],rem12[6],c_t12[6]);
cas_1bit cas_12_7 (rem13[6],b[7],q_tmp[13],c_t12[6],rem12[7],q_tmp[12]);


always @(posedge clk or negedge rst_n)
 begin
  if(!rst_n)
     r1 <= 0;
  else
     r1 <= {q_tmp[15:12],rem12[6:0],b[7:0],a[15:0]};  // r1=  [34:0] --> t_r1 = r1[31] // r2[38:0] = {r1[46:43],q_tmp[11:8],rem12[6:0],b[7:0],a[15:0]}
 end                                                  // r3 [42:0] 
 assign t_r1 = r1[31];
 assign a_r1   = r1[15:0];
 assign b_r1   = r1[23:16];
 assign rem_r1 = r1[30:24];
  
// tang 11
cas_1bit cas_11_0 (a_r1[11],b_r1[0],t_r1,t_r1,rem11[0],c_t11[0]);
cas_1bit cas_11_1 (rem_r1[0],b_r1[1],t_r1,c_t11[0],rem11[1],c_t11[1]);
cas_1bit cas_11_2 (rem_r1[1],b_r1[2],t_r1,c_t11[1],rem11[2],c_t11[2]);
cas_1bit cas_11_3 (rem_r1[2],b_r1[3],t_r1,c_t11[2],rem11[3],c_t11[3]);
cas_1bit cas_11_4 (rem_r1[3],b_r1[4],t_r1,c_t11[3],rem11[4],c_t11[4]);
cas_1bit cas_11_5 (rem_r1[4],b_r1[5],t_r1,c_t11[4],rem11[5],c_t11[5]);
cas_1bit cas_11_6 (rem_r1[5],b_r1[6],t_r1,c_t11[5],rem11[6],c_t11[6]);
cas_1bit cas_11_7 (rem_r1[6],b_r1[7],t_r1,c_t11[6],rem11[7],q_tmp[11]);

// tang 10
cas_1bit cas_10_0 (a_r1[10],b_r1[0],q_tmp[11],q_tmp[11],rem10[0],c_t10[0]);
cas_1bit cas_10_1 (rem11[0],b_r1[1],q_tmp[11],c_t10[0],rem10[1],c_t10[1]);
cas_1bit cas_10_2 (rem11[1],b_r1[2],q_tmp[11],c_t10[1],rem10[2],c_t10[2]);
cas_1bit cas_10_3 (rem11[2],b_r1[3],q_tmp[11],c_t10[2],rem10[3],c_t10[3]);
cas_1bit cas_10_4 (rem11[3],b_r1[4],q_tmp[11],c_t10[3],rem10[4],c_t10[4]);
cas_1bit cas_10_5 (rem11[4],b_r1[5],q_tmp[11],c_t10[4],rem10[5],c_t10[5]);
cas_1bit cas_10_6 (rem11[5],b_r1[6],q_tmp[11],c_t10[5],rem10[6],c_t10[6]);
cas_1bit cas_10_7 (rem11[6],b_r1[7],q_tmp[11],c_t10[6],rem10[7],q_tmp[10]);


// tang 9
cas_1bit cas_9_0 (a_r1[9],b_r1[0],q_tmp[10],q_tmp[10],rem9[0],c_t9[0]);
cas_1bit cas_9_1 (rem10[0],b_r1[1],q_tmp[10],c_t9[0],rem9[1],c_t9[1]);
cas_1bit cas_9_2 (rem10[1],b_r1[2],q_tmp[10],c_t9[1],rem9[2],c_t9[2]);
cas_1bit cas_9_3 (rem10[2],b_r1[3],q_tmp[10],c_t9[2],rem9[3],c_t9[3]);
cas_1bit cas_9_4 (rem10[3],b_r1[4],q_tmp[10],c_t9[3],rem9[4],c_t9[4]);
cas_1bit cas_9_5 (rem10[4],b_r1[5],q_tmp[10],c_t9[4],rem9[5],c_t9[5]);
cas_1bit cas_9_6 (rem10[5],b_r1[6],q_tmp[10],c_t9[5],rem9[6],c_t9[6]);
cas_1bit cas_9_7 (rem10[6],b_r1[7],q_tmp[10],c_t9[6],rem9[7],q_tmp[9]);


// tang 8
cas_1bit cas_8_0 (a_r1[8],b_r1[0],q_tmp[9],q_tmp[9],rem8[0],c_t8[0]);
cas_1bit cas_8_1 (rem9[0],b_r1[1],q_tmp[9],c_t8[0],rem8[1],c_t8[1]);
cas_1bit cas_8_2 (rem9[1],b_r1[2],q_tmp[9],c_t8[1],rem8[2],c_t8[2]);
cas_1bit cas_8_3 (rem9[2],b_r1[3],q_tmp[9],c_t8[2],rem8[3],c_t8[3]);
cas_1bit cas_8_4 (rem9[3],b_r1[4],q_tmp[9],c_t8[3],rem8[4],c_t8[4]);
cas_1bit cas_8_5 (rem9[4],b_r1[5],q_tmp[9],c_t8[4],rem8[5],c_t8[5]);
cas_1bit cas_8_6 (rem9[5],b_r1[6],q_tmp[9],c_t8[5],rem8[6],c_t8[6]);
cas_1bit cas_8_7 (rem9[6],b_r1[7],q_tmp[9],c_t8[6],rem8[7],q_tmp[8]);

always @(posedge clk or negedge rst_n)
 begin
  if(!rst_n)
     r2 <= 38'd0;
  else
     r2 <= {r1[34:31],q_tmp[11:8],rem8[6:0],b_r1[7:0],a_r1[15:0]}; // r2[38:0]
 end
 assign t_r2 = r2[31];
 assign a_r2   = r2[15:0];
 assign b_r2   = r2[23:16];
 assign rem_r2 = r2[30:24];

// tang 7
cas_1bit cas_7_0 (a_r2[7],b_r2[0],t_r2,t_r2,rem7[0],c_t7[0]);
cas_1bit cas_7_1 (rem_r2[0],b_r2[1],t_r2,c_t7[0],rem7[1],c_t7[1]);
cas_1bit cas_7_2 (rem_r2[1],b_r2[2],t_r2,c_t7[1],rem7[2],c_t7[2]);
cas_1bit cas_7_3 (rem_r2[2],b_r2[3],t_r2,c_t7[2],rem7[3],c_t7[3]);
cas_1bit cas_7_4 (rem_r2[3],b_r2[4],t_r2,c_t7[3],rem7[4],c_t7[4]);
cas_1bit cas_7_5 (rem_r2[4],b_r2[5],t_r2,c_t7[4],rem7[5],c_t7[5]);
cas_1bit cas_7_6 (rem_r2[5],b_r2[6],t_r2,c_t7[5],rem7[6],c_t7[6]);
cas_1bit cas_7_7 (rem_r2[6],b_r2[7],t_r2,c_t7[6],rem7[7],q_tmp[7]);

// tang 6
cas_1bit cas_6_0 (a_r2[6],b_r2[0],q_tmp[7],q_tmp[7],rem6[0],c_t6[0]);
cas_1bit cas_6_1 (rem7[0],b_r2[1],q_tmp[7],c_t6[0],rem6[1],c_t6[1]);
cas_1bit cas_6_2 (rem7[1],b_r2[2],q_tmp[7],c_t6[1],rem6[2],c_t6[2]);
cas_1bit cas_6_3 (rem7[2],b_r2[3],q_tmp[7],c_t6[2],rem6[3],c_t6[3]);
cas_1bit cas_6_4 (rem7[3],b_r2[4],q_tmp[7],c_t6[3],rem6[4],c_t6[4]);
cas_1bit cas_6_5 (rem7[4],b_r2[5],q_tmp[7],c_t6[4],rem6[5],c_t6[5]);
cas_1bit cas_6_6 (rem7[5],b_r2[6],q_tmp[7],c_t6[5],rem6[6],c_t6[6]);
cas_1bit cas_6_7 (rem7[6],b_r2[7],q_tmp[7],c_t6[6],rem6[7],q_tmp[6]);


// tang 5
cas_1bit cas_5_0 (a_r2[5],b_r2[0],q_tmp[6],q_tmp[6],rem5[0],c_t5[0]);
cas_1bit cas_5_1 (rem6[0],b_r2[1],q_tmp[6],c_t5[0],rem5[1],c_t5[1]);
cas_1bit cas_5_2 (rem6[1],b_r2[2],q_tmp[6],c_t5[1],rem5[2],c_t5[2]);
cas_1bit cas_5_3 (rem6[2],b_r2[3],q_tmp[6],c_t5[2],rem5[3],c_t5[3]);
cas_1bit cas_5_4 (rem6[3],b_r2[4],q_tmp[6],c_t5[3],rem5[4],c_t5[4]);
cas_1bit cas_5_5 (rem6[4],b_r2[5],q_tmp[6],c_t5[4],rem5[5],c_t5[5]);
cas_1bit cas_5_6 (rem6[5],b_r2[6],q_tmp[6],c_t5[5],rem5[6],c_t5[6]);
cas_1bit cas_5_7 (rem6[6],b_r2[7],q_tmp[6],c_t5[6],rem5[7],q_tmp[5]);


// tang 4
cas_1bit cas_4_0 (a_r2[4],b_r2[0],q_tmp[5],q_tmp[5],rem4[0],c_t4[0]);
cas_1bit cas_4_1 (rem5[0],b_r2[1],q_tmp[5],c_t4[0],rem4[1],c_t4[1]);
cas_1bit cas_4_2 (rem5[1],b_r2[2],q_tmp[5],c_t4[1],rem4[2],c_t4[2]);
cas_1bit cas_4_3 (rem5[2],b_r2[3],q_tmp[5],c_t4[2],rem4[3],c_t4[3]);
cas_1bit cas_4_4 (rem5[3],b_r2[4],q_tmp[5],c_t4[3],rem4[4],c_t4[4]);
cas_1bit cas_4_5 (rem5[4],b_r2[5],q_tmp[5],c_t4[4],rem4[5],c_t4[5]);
cas_1bit cas_4_6 (rem5[5],b_r2[6],q_tmp[5],c_t4[5],rem4[6],c_t4[6]);
cas_1bit cas_4_7 (rem5[6],b_r2[7],q_tmp[5],c_t4[6],rem4[7],q_tmp[4]);

always @(posedge clk or negedge rst_n)
 begin
  if(!rst_n)
     r3 <= 0;
  else
     r3 <= {r2[38:31],q_tmp[7:4],rem4[6:0],b_r2[7:0],a_r2[15:0]}; // r3[42:0]
 end
 assign t_r3 = r3[31];
 assign a_r3   = r3[15:0];
 assign b_r3   = r3[23:16];
 assign rem_r3 = r3[30:24];
 
 // tang 3
cas_1bit cas_3_0 (a_r3[3],b_r3[0],t_r3,t_r3,rem3[0],c_t3[0]);
cas_1bit cas_3_1 (rem_r3[0],b_r3[1],t_r3,c_t3[0],rem3[1],c_t3[1]);
cas_1bit cas_3_2 (rem_r3[1],b_r3[2],t_r3,c_t3[1],rem3[2],c_t3[2]);
cas_1bit cas_3_3 (rem_r3[2],b_r3[3],t_r3,c_t3[2],rem3[3],c_t3[3]);
cas_1bit cas_3_4 (rem_r3[3],b_r3[4],t_r3,c_t3[3],rem3[4],c_t3[4]);
cas_1bit cas_3_5 (rem_r3[4],b_r3[5],t_r3,c_t3[4],rem3[5],c_t3[5]);
cas_1bit cas_3_6 (rem_r3[5],b_r3[6],t_r3,c_t3[5],rem3[6],c_t3[6]);
cas_1bit cas_3_7 (rem_r3[6],b_r3[7],t_r3,c_t3[6],rem3[7],q_tmp[3]);

// tang 2
cas_1bit cas_2_0 (a_r3[2],b_r3[0],q_tmp[3],q_tmp[3],rem2[0],c_t2[0]);
cas_1bit cas_2_1 (rem3[0],b_r3[1],q_tmp[3],c_t2[0],rem2[1],c_t2[1]);
cas_1bit cas_2_2 (rem3[1],b_r3[2],q_tmp[3],c_t2[1],rem2[2],c_t2[2]);
cas_1bit cas_2_3 (rem3[2],b_r3[3],q_tmp[3],c_t2[2],rem2[3],c_t2[3]);
cas_1bit cas_2_4 (rem3[3],b_r3[4],q_tmp[3],c_t2[3],rem2[4],c_t2[4]);
cas_1bit cas_2_5 (rem3[4],b_r3[5],q_tmp[3],c_t2[4],rem2[5],c_t2[5]);
cas_1bit cas_2_6 (rem3[5],b_r3[6],q_tmp[3],c_t2[5],rem2[6],c_t2[6]);
cas_1bit cas_2_7 (rem3[6],b_r3[7],q_tmp[3],c_t2[6],rem2[7],q_tmp[2]);


// tang 1
cas_1bit cas_1_0 (a_r3[1],b_r3[0],q_tmp[2],q_tmp[2],rem1[0],c_t1[0]);
cas_1bit cas_1_1 (rem2[0],b_r3[1],q_tmp[2],c_t1[0],rem1[1],c_t1[1]);
cas_1bit cas_1_2 (rem2[1],b_r3[2],q_tmp[2],c_t1[1],rem1[2],c_t1[2]);
cas_1bit cas_1_3 (rem2[2],b_r3[3],q_tmp[2],c_t1[2],rem1[3],c_t1[3]);
cas_1bit cas_1_4 (rem2[3],b_r3[4],q_tmp[2],c_t1[3],rem1[4],c_t1[4]);
cas_1bit cas_1_5 (rem2[4],b_r3[5],q_tmp[2],c_t1[4],rem1[5],c_t1[5]);
cas_1bit cas_1_6 (rem2[5],b_r3[6],q_tmp[2],c_t1[5],rem1[6],c_t1[6]);
cas_1bit cas_1_7 (rem2[6],b_r3[7],q_tmp[2],c_t1[6],rem1[7],q_tmp[1]);


// tang 0
cas_1bit cas_0_0 (a_r3[0],b_r3[0],q_tmp[1],q_tmp[1],rem0[0],c_t0[0]);
cas_1bit cas_0_1 (rem1[0],b_r3[1],q_tmp[1],c_t0[0],rem0[1],c_t0[1]);
cas_1bit cas_0_2 (rem1[1],b_r3[2],q_tmp[1],c_t0[1],rem0[2],c_t0[2]);
cas_1bit cas_0_3 (rem1[2],b_r3[3],q_tmp[1],c_t0[2],rem0[3],c_t0[3]);
cas_1bit cas_0_4 (rem1[3],b_r3[4],q_tmp[1],c_t0[3],rem0[4],c_t0[4]);
cas_1bit cas_0_5 (rem1[4],b_r3[5],q_tmp[1],c_t0[4],rem0[5],c_t0[5]);
cas_1bit cas_0_6 (rem1[5],b_r3[6],q_tmp[1],c_t0[5],rem0[6],c_t0[6]);
cas_1bit cas_0_7 (rem1[6],b_r3[7],q_tmp[1],c_t0[6],rem0[7],q_tmp[0]);

assign q = { r3[42:31], q_tmp[3:0] };

endmodule



	
	
