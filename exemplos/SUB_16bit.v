module full_subtractor(
  input a, b, borrow_in,
  output diff, borrow_out
);
  wire w1, w2, w3;

  xor (w1, ~a, b);
  xor (diff, w1, borrow_in);
  and (w2, a, ~b);
  and (w3, w1, borrow_in);
  or (borrow_out, w2, w3);
endmodule

module SUB_16bit(
  input [15:0] A, B,
  input BORROW_IN,
  output [15:0] RESULTADO,
  output BORROW_OUT
);
  wire [15:0] borrow;

  full_subtractor fs0 (.a(A[0]), .b(B[0]), .borrow_in(BORROW_IN), .diff(RESULTADO[0]), .borrow_out(borrow[0]));
  full_subtractor fs1 (.a(A[1]), .b(B[1]), .borrow_in(borrow[0]), .diff(RESULTADO[1]), .borrow_out(borrow[1]));
  full_subtractor fs2 (.a(A[2]), .b(B[2]), .borrow_in(borrow[1]), .diff(RESULTADO[2]), .borrow_out(borrow[2]));
  full_subtractor fs3 (.a(A[3]), .b(B[3]), .borrow_in(borrow[2]), .diff(RESULTADO[3]), .borrow_out(borrow[3]));
  full_subtractor fs4 (.a(A[4]), .b(B[4]), .borrow_in(borrow[3]), .diff(RESULTADO[4]), .borrow_out(borrow[4]));
  full_subtractor fs5 (.a(A[5]), .b(B[5]), .borrow_in(borrow[4]), .diff(RESULTADO[5]), .borrow_out(borrow[5]));
  full_subtractor fs6 (.a(A[6]), .b(B[6]), .borrow_in(borrow[5]), .diff(RESULTADO[6]), .borrow_out(borrow[6]));
  full_subtractor fs7 (.a(A[7]), .b(B[7]), .borrow_in(borrow[6]), .diff(RESULTADO[7]), .borrow_out(borrow[7]));
  full_subtractor fs8 (.a(A[8]), .b(B[8]), .borrow_in(borrow[7]), .diff(RESULTADO[8]), .borrow_out(borrow[8]));
  full_subtractor fs9 (.a(A[9]), .b(B[9]), .borrow_in(borrow[8]), .diff(RESULTADO[9]), .borrow_out(borrow[9]));
  full_subtractor fs10 (.a(A[10]), .b(B[10]), .borrow_in(borrow[9]), .diff(RESULTADO[10]), .borrow_out(borrow[10]));
  full_subtractor fs11 (.a(A[11]), .b(B[11]), .borrow_in(borrow[10]), .diff(RESULTADO[11]), .borrow_out(borrow[11]));
  full_subtractor fs12 (.a(A[12]), .b(B[12]), .borrow_in(borrow[11]), .diff(RESULTADO[12]), .borrow_out(borrow[12]));
  full_subtractor fs13 (.a(A[13]), .b(B[13]), .borrow_in(borrow[12]), .diff(RESULTADO[13]), .borrow_out(borrow[13]));
  full_subtractor fs14 (.a(A[14]), .b(B[14]), .borrow_in(borrow[13]), .diff(RESULTADO[14]), .borrow_out(borrow[14]));
  full_subtractor fs15 (.a(A[15]), .b(B[15]), .borrow_in(borrow[14]), .diff(RESULTADO[15]), .borrow_out(BORROW_OUT));

endmodule