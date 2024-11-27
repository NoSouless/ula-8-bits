module XOR_16bit(
  input [15:0] A, B, 
  output [15:0] RESULTADO
);
    xor (RESULTADO[0], A[0], B[0]);
    xor (RESULTADO[1], A[1], B[1]);
    xor (RESULTADO[2], A[2], B[2]);
    xor (RESULTADO[3], A[3], B[3]);
    xor (RESULTADO[4], A[4], B[4]);
    xor (RESULTADO[5], A[5], B[5]);
    xor (RESULTADO[6], A[6], B[6]);
    xor (RESULTADO[7], A[7], B[7]);
    xor (RESULTADO[8], A[8], B[8]);
    xor (RESULTADO[9], A[9], B[9]);
    xor (RESULTADO[10], A[10], B[10]);
    xor (RESULTADO[11], A[11], B[11]);
    xor (RESULTADO[12], A[12], B[12]);
    xor (RESULTADO[13], A[13], B[13]);
    xor (RESULTADO[14], A[14], B[14]);
    xor (RESULTADO[15], A[15], B[15]);
endmodule