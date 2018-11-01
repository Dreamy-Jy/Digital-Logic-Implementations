// Code your testbench here
// or browse Examples
module halfadder(a_digit, b_digit, sum, carry);
    input a_digit, b_digit;
    
    output sum, carry;

    XOR2 delayed_xor(.f(sum), .a(a_digit), .b(b_digit));
    AND2 delayed_and(.f(carry), .a(a_digit), .b(b_digit));
endmodule

module fulladder(a_digit, b_digit, carry_in, sum, carry_out);
    input a_digit;
    input b_digit;
    input carry_in;

    output sum;
    output carry_out;

    wire inter_sum;
    wire inter_carry_1;
    wire inter_carry_2;

    halfadder first_add(.a_digit(a_digit), .b_digit(b_digit), .sum(inter_sum), .carry(inter_carry_1));
    halfadder second_add(.a_digit(inter_sum), .b_digit(carry_in), .sum(sum), .carry(inter_carry_2));

    OR2 get_carry(.f(carry_out), .a(inter_carry_1), .b(inter_carry_2));
endmodule

module adder_four_bit(d0, d1, d2, d3, c_out, a0, a1, a2, a3, b0, b1, b2, b3, c_in);
  input a0, a1, a2, a3, b0, b1, b2, b3, c_in;
  output d0, d1, d2, d3, c_out;
  
  wire inter_c1;
  wire inter_c2;
  wire inter_c3;
  
  fulladder least_sig_bit(.a_digit(a0), .b_digit(b0), .carry_in(c_in), .sum(d0), .carry_out(inter_c1));
  fulladder second_bit(.a_digit(a1), .b_digit(b1), .carry_in(inter_c1), .sum(d1), .carry_out(inter_c2));
  fulladder third_bit(.a_digit(a2), .b_digit(b2), .carry_in(inter_c2), .sum(d2), .carry_out(inter_c3));
  fulladder most_sig_bit(.a_digit(a3), .b_digit(b3), .carry_in(inter_c3), .sum(d3), .carry_out(c_out));
endmodule

module test;
  
  ////change start here: this is the deisgn part
  wire t_d0, t_d1, t_d2, t_d3, t_c_out; //hint: the connctions between modules, set them wire
  reg t_a0, t_a1, t_a2, t_a3, t_b0, t_b1, t_b2, t_b3, t_c_in; //hint: variable you set signals, set them reg

  //halfadder testHA(.a_digit(t_a), .b_digit(t_b), .sum(t_s), .carry(t_c_out));
  //fulladder testFA(.a_digit(t_a), .b_digit(t_b), .carry_in(t_c_in), .sum(t_s), .carry_out(t_c_out));
  adder_four_bit(.d0(t_d0), .d1(t_d1), .d2(t_d2), .d3(t_d3), .c_out(t_c_out), .a0(t_a0), .a1(t_a1), .a2(t_a2), .a3(t_a3), .b0(t_b0), .b1(t_b1), .b2(t_b2), .b3(t_b3), .c_in(t_c_in));

  ////change End here
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      
      ////change start here: this the test part
      // 248
      t_a0 	 = 1'b0;
      t_a1 	 = 1'b1;
      t_a2 	 = 1'b1;
      t_a3 	 = 1'b1;
      t_b0 	 = 1'b1;
      t_b1 	 = 1'b1;
      t_b2 	 = 1'b0;
      t_b3 	 = 1'b0;
      t_c_in = 1'b0;
      #10
      //352
      t_a0 	 = 1'b1;
      t_a1 	 = 1'b0;
      t_a2 	 = 1'b1;
      t_a3 	 = 1'b1;
      t_b0 	 = 1'b0;
      t_b1 	 = 1'b0;
      t_b2 	 = 1'b0;
      t_b3 	 = 1'b0;
      t_c_in = 1'b0;
      #10
      //440
      t_a0 	 = 1'b1;
      t_a1 	 = 1'b1;
      t_a2 	 = 1'b0;
      t_a3 	 = 1'b1;
      t_b0 	 = 1'b1;
      t_b1 	 = 1'b1;
      t_b2 	 = 1'b0;
      t_b3 	 = 1'b0;
      t_c_in = 1'b0;
      #10
      //409
      t_a0 	 = 1'b1;
      t_a1 	 = 1'b1;
      t_a2 	 = 1'b0;
      t_a3 	 = 1'b0;
      t_b0 	 = 1'b1;
      t_b1 	 = 1'b1;
      t_b2 	 = 1'b0;
      t_b3 	 = 1'b0;
      t_c_in = 1'b1;
      #10
      //18
      t_a0 	 = 1'b0;
      t_a1 	 = 1'b0;
      t_a2 	 = 1'b0;
      t_a3 	 = 1'b0;
      t_b0 	 = 1'b1;
      t_b1 	 = 1'b0;
      t_b2 	 = 1'b0;
      t_b3 	 = 1'b1;
      t_c_in = 1'b0;
      #10
      //507
      t_a0 	 = 1'b1;
      t_a1 	 = 1'b1;
      t_a2 	 = 1'b1;
      t_a3 	 = 1'b1;
      t_b0 	 = 1'b1;
      t_b1 	 = 1'b1;
      t_b2 	 = 1'b0;
      t_b3 	 = 1'b1;
      t_c_in = 1'b1;
      #10
      //213
      t_a0 	 = 1'b0;
      t_a1 	 = 1'b1;
      t_a2 	 = 1'b1;
      t_a3 	 = 1'b0;
      t_b0 	 = 1'b1;
      t_b1 	 = 1'b0;
      t_b2 	 = 1'b1;
      t_b3 	 = 1'b0;
      t_c_in = 1'b1;
      #10
      //79
      t_a0 	 = 1'b0;
      t_a1 	 = 1'b0;
      t_a2 	 = 1'b1;
      t_a3 	 = 1'b0;
      t_b0 	 = 1'b0;
      t_b1 	 = 1'b1;
      t_b2 	 = 1'b1;
      t_b3 	 = 1'b1;
      t_c_in = 1'b1;
      #10

      
      ////change End here
      $dumpoff;

    end
  initial
    //$monitor("Half Adder Debug data:\n\tinputes: a=%d b=%d \n\toutputs: sum=%d c_out=%d", t_a, t_b, t_s, t_c_out);
    //$monitor("Full Adder Debug data:\n\tinputes: a=%d b=%d c_in=%d\n\toutputs: sum=%d c_out=%d", t_a, t_b, t_c_in, t_s, t_c_out);
    $monitor("4-bit Adder Debug Data:\n\tInput a=%d%d%d%d b=%d%d%d%d carry in=%d\n\tOutput d=%d%d%d%d carry out=%d",t_a0, t_a1, t_a2, t_a3, t_b0, t_b1, t_b2, t_b3, t_c_in, t_d0, t_d1, t_d2, t_d3, t_c_out);
endmodule