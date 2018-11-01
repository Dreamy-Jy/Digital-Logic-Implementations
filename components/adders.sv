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