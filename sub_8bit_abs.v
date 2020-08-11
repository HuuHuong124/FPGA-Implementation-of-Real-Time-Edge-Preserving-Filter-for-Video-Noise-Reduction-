// b4.v  Verilog 8 bits bided by 4 bits made with  cas modules
// run  verilog -q -l b4_v.out b4.v
module cas(T, rem, b, cin, rout, cout); // from schematic
  input  T;     // T input, quotient bit or 1
  input  rem;   // remainder_in input
  input  b;   // bisor input
  input  cin;   // carry_in
  output rout;  // remainder_out
  output cout;  // carry_out
  assign rout = (T^b)^rem^cin;
  assign cout = ((T^b)&rem)|((T^b)&cin)|(rem&cin);
endmodule // cas

module sub_8bit_abs(a, b,sub_abs);  // test bench
  // signals used in test bench (the interconnections)
  
  input   [7:0] a; // so bi tru
  input   [7:0] b;  // so tru
 
  output  [7:0] sub_abs;   // result value after first block sub

 wire [8:0] result_sub1; 
 wire [8:0] cout;
  // tang 1: khoi tru
  //         T        rem       b     cin      rout      cout

  cas bit03(1'b1,a[0],b[0],1'b1,result_sub1[0], cout[0]);
  cas bit04(1'b1,a[1],b[1],cout[0],result_sub1[1], cout[1]);
  cas bit05(1'b1,a[2],b[2],cout[1],result_sub1[2], cout[2]);
  cas bit06(1'b1,a[3],b[3],cout[2],result_sub1[3], cout[3]);
  cas bit07(1'b1,a[4],b[4],cout[3],result_sub1[4], cout[4]);
  cas bit08(1'b1,a[5],b[5],cout[4],result_sub1[5], cout[5]);
  cas bit09(1'b1,a[6],b[6],cout[5],result_sub1[6], cout[6]);
  cas bit00(1'b1,a[7],b[7],cout[6],result_sub1[7], cout[7]);
  cas bit01(1'b1,1'b0,1'b0,cout[7],result_sub1[8], cout[8]);
  
  assign sub_abs = (result_sub1[8]) ? (~result_sub1[7:0] + 1'b1) : result_sub1[7:0];

endmodule // b4 



