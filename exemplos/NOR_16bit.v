module NOR_16bit(
  input [15:0] A, B, 
  output [15:0] RESULTADO
);
    nor (RESULTADO[0], A[0], B[0]);
    nor (RESULTADO[1], A[1], B[1]);
    nor (RESULTADO[2], A[2], B[2]);
    nor (RESULTADO[3], A[3], B[3]);
    nor (RESULTADO[4], A[4], B[4]);
    nor (RESULTADO[5], A[5], B[5]);
    nor (RESULTADO[6], A[6], B[6]);
    nor (RESULTADO[7], A[7], B[7]);
    nor (RESULTADO[8], A[8], B[8]);
    nor (RESULTADO[9], A[9], B[9]);
    nor (RESULTADO[10], A[10], B[10]);
    nor (RESULTADO[11], A[11], B[11]);
    nor (RESULTADO[12], A[12], B[12]);
    nor (RESULTADO[13], A[13], B[13]);
    nor (RESULTADO[14], A[14], B[14]);
    nor (RESULTADO[15], A[15], B[15]);
endmodule