module OR_16bit(
  input [15:0] A, B, 
  output [15:0] RESULTADO
);
    or (RESULTADO[0], A[0], B[0]);
    or (RESULTADO[1], A[1], B[1]);
    or (RESULTADO[2], A[2], B[2]);
    or (RESULTADO[3], A[3], B[3]);
    or (RESULTADO[4], A[4], B[4]);
    or (RESULTADO[5], A[5], B[5]);
    or (RESULTADO[6], A[6], B[6]);
    or (RESULTADO[7], A[7], B[7]);
    or (RESULTADO[8], A[8], B[8]);
    or (RESULTADO[9], A[9], B[9]);
    or (RESULTADO[10], A[10], B[10]);
    or (RESULTADO[11], A[11], B[11]);
    or (RESULTADO[12], A[12], B[12]);
    or (RESULTADO[13], A[13], B[13]);
    or (RESULTADO[14], A[14], B[14]);
    or (RESULTADO[15], A[15], B[15]);
endmodule