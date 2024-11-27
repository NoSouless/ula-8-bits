module half_adder(
  input a, b,
  output sum, carry
);
  xor (sum, a, b);
  and (carry, a, b);
endmodule

module full_adder(
  input a, b, cin,
  output sum, cout
);
  wire sum1, carry1, carry2;

  half_adder ha1 (.a(a), .b(b), .sum(sum1), .carry(carry1));
  half_adder ha2 (.a(sum1), .b(cin), .sum(sum), .carry(carry2));
  or (cout, carry1, carry2);
endmodule

module INC_16bit(
  input [15:0] a,
  output [15:0] result
);
  wire [15:0] carry;

  full_adder fa0 (.a(a[0]), .b(1'b1), .cin(1'b0), .sum(result[0]), .cout(carry[0]));
  full_adder fa1 (.a(a[1]), .b(1'b0), .cin(carry[0]), .sum(result[1]), .cout(carry[1]));
  full_adder fa2 (.a(a[2]), .b(1'b0), .cin(carry[1]), .sum(result[2]), .cout(carry[2]));
  full_adder fa3 (.a(a[3]), .b(1'b0), .cin(carry[2]), .sum(result[3]), .cout(carry[3]));
  full_adder fa4 (.a(a[4]), .b(1'b0), .cin(carry[3]), .sum(result[4]), .cout(carry[4]));
  full_adder fa5 (.a(a[5]), .b(1'b0), .cin(carry[4]), .sum(result[5]), .cout(carry[5]));
  full_adder fa6 (.a(a[6]), .b(1'b0), .cin(carry[5]), .sum(result[6]), .cout(carry[6]));
  full_adder fa7 (.a(a[7]), .b(1'b0), .cin(carry[6]), .sum(result[7]), .cout(carry[7]));
  full_adder fa8 (.a(a[8]), .b(1'b0), .cin(carry[7]), .sum(result[8]), .cout(carry[8]));
  full_adder fa9 (.a(a[9]), .b(1'b0), .cin(carry[8]), .sum(result[9]), .cout(carry[9]));
  full_adder fa10 (.a(a[10]), .b(1'b0), .cin(carry[9]), .sum(result[10]), .cout(carry[10]));
  full_adder fa11 (.a(a[11]), .b(1'b0), .cin(carry[10]), .sum(result[11]), .cout(carry[11]));
  full_adder fa12 (.a(a[12]), .b(1'b0), .cin(carry[11]), .sum(result[12]), .cout(carry[12]));
  full_adder fa13 (.a(a[13]), .b(1'b0), .cin(carry[12]), .sum(result[13]), .cout(carry[13]));
  full_adder fa14 (.a(a[14]), .b(1'b0), .cin(carry[13]), .sum(result[14]), .cout(carry[14]));
  full_adder fa15 (.a(a[15]), .b(1'b0), .cin(carry[14]), .sum(result[15]), .cout());

endmodule