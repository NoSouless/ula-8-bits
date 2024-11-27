module full_adder(
  input a, b, carry_in,
  output sum, carry_out
);
  wire w1, w2, w3;

  xor (w1, a, b);
  xor (sum, w1, carry_in);
  and (w2, a, b);
  and (w3, w1, carry_in);
  or (carry_out, w2, w3);
endmodule

module ADD_16bit(
  input [15:0] A, B,
  input CARRY_IN,
  output [15:0] RESULTADO,
  output CARRY_OUT
);
  wire [15:0] carry;

  full_adder fa0 (.a(A[0]), .b(B[0]), .carry_in(CARRY_IN), .sum(RESULTADO[0]), .carry_out(carry[0]));
  full_adder fa1 (.a(A[1]), .b(B[1]), .carry_in(carry[0]), .sum(RESULTADO[1]), .carry_out(carry[1]));
  full_adder fa2 (.a(A[2]), .b(B[2]), .carry_in(carry[1]), .sum(RESULTADO[2]), .carry_out(carry[2]));
  full_adder fa3 (.a(A[3]), .b(B[3]), .carry_in(carry[2]), .sum(RESULTADO[3]), .carry_out(carry[3]));
  full_adder fa4 (.a(A[4]), .b(B[4]), .carry_in(carry[3]), .sum(RESULTADO[4]), .carry_out(carry[4]));
  full_adder fa5 (.a(A[5]), .b(B[5]), .carry_in(carry[4]), .sum(RESULTADO[5]), .carry_out(carry[5]));
  full_adder fa6 (.a(A[6]), .b(B[6]), .carry_in(carry[5]), .sum(RESULTADO[6]), .carry_out(carry[6]));
  full_adder fa7 (.a(A[7]), .b(B[7]), .carry_in(carry[6]), .sum(RESULTADO[7]), .carry_out(carry[7]));
  full_adder fa8 (.a(A[8]), .b(B[8]), .carry_in(carry[7]), .sum(RESULTADO[8]), .carry_out(carry[8]));
  full_adder fa9 (.a(A[9]), .b(B[9]), .carry_in(carry[8]), .sum(RESULTADO[9]), .carry_out(carry[9]));
  full_adder fa10 (.a(A[10]), .b(B[10]), .carry_in(carry[9]), .sum(RESULTADO[10]), .carry_out(carry[10]));
  full_adder fa11 (.a(A[11]), .b(B[11]), .carry_in(carry[10]), .sum(RESULTADO[11]), .carry_out(carry[11]));
  full_adder fa12 (.a(A[12]), .b(B[12]), .carry_in(carry[11]), .sum(RESULTADO[12]), .carry_out(carry[12]));
  full_adder fa13 (.a(A[13]), .b(B[13]), .carry_in(carry[12]), .sum(RESULTADO[13]), .carry_out(carry[13]));
  full_adder fa14 (.a(A[14]), .b(B[14]), .carry_in(carry[13]), .sum(RESULTADO[14]), .carry_out(carry[14]));
  full_adder fa15 (.a(A[15]), .b(B[15]), .carry_in(carry[14]), .sum(RESULTADO[15]), .carry_out(CARRY_OUT));

endmodule