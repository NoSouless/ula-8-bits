module NAND_16bit(
  input [15:0] A, B, 
  output [15:0] RESULTADO
);
    nand (RESULTADO[0], A[0], B[0]);
    nand (RESULTADO[1], A[1], B[1]);
    nand (RESULTADO[2], A[2], B[2]);
    nand (RESULTADO[3], A[3], B[3]);
    nand (RESULTADO[4], A[4], B[4]);
    nand (RESULTADO[5], A[5], B[5]);
    nand (RESULTADO[6], A[6], B[6]);
    nand (RESULTADO[7], A[7], B[7]);
    nand (RESULTADO[8], A[8], B[8]);
    nand (RESULTADO[9], A[9], B[9]);
    nand (RESULTADO[10], A[10], B[10]);
    nand (RESULTADO[11], A[11], B[11]);
    nand (RESULTADO[12], A[12], B[12]);
    nand (RESULTADO[13], A[13], B[13]);
    nand (RESULTADO[14], A[14], B[14]);
    nand (RESULTADO[15], A[15], B[15]);
endmodule