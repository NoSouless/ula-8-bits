module AND_16bit(
  input [15:0] A, B,
  output [15:0] RESULTADO
);
  and (RESULTADO[0], A[0], B[0]);
  and (RESULTADO[1], A[1], B[1]);
  and (RESULTADO[2], A[2], B[2]);
  and (RESULTADO[3], A[3], B[3]);
  and (RESULTADO[4], A[4], B[4]);
  and (RESULTADO[5], A[5], B[5]);
  and (RESULTADO[6], A[6], B[6]);
  and (RESULTADO[7], A[7], B[7]);
  and (RESULTADO[8], A[8], B[8]);
  and (RESULTADO[9], A[9], B[9]);
  and (RESULTADO[10], A[10], B[10]);
  and (RESULTADO[11], A[11], B[11]);
  and (RESULTADO[12], A[12], B[12]);
  and (RESULTADO[13], A[13], B[13]);
  and (RESULTADO[14], A[14], B[14]);
  and (RESULTADO[15], A[15], B[15]);
endmodule