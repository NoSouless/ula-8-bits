module EQ_16bit(
    input [15:0] A, B,
    output RESULTADO
);
    wire [15:0] eq_bits;

    // Comparar cada bit usando portas XOR e inverter o resultado
    assign eq_bits[0] = ~(A[0] ^ B[0]);
    assign eq_bits[1] = ~(A[1] ^ B[1]);
    assign eq_bits[2] = ~(A[2] ^ B[2]);
    assign eq_bits[3] = ~(A[3] ^ B[3]);
    assign eq_bits[4] = ~(A[4] ^ B[4]);
    assign eq_bits[5] = ~(A[5] ^ B[5]);
    assign eq_bits[6] = ~(A[6] ^ B[6]);
    assign eq_bits[7] = ~(A[7] ^ B[7]);
    assign eq_bits[8] = ~(A[8] ^ B[8]);
    assign eq_bits[9] = ~(A[9] ^ B[9]);
    assign eq_bits[10] = ~(A[10] ^ B[10]);
    assign eq_bits[11] = ~(A[11] ^ B[11]);
    assign eq_bits[12] = ~(A[12] ^ B[12]);
    assign eq_bits[13] = ~(A[13] ^ B[13]);
    assign eq_bits[14] = ~(A[14] ^ B[14]);
    assign eq_bits[15] = ~(A[15] ^ B[15]);

    // Combinar todos os bits de igualdade usando portas AND
    assign RESULTADO = eq_bits[0] & eq_bits[1] & eq_bits[2] & eq_bits[3] & 
                    eq_bits[4] & eq_bits[5] & eq_bits[6] & eq_bits[7] & 
                    eq_bits[8] & eq_bits[9] & eq_bits[10] & eq_bits[11] & 
                    eq_bits[12] & eq_bits[13] & eq_bits[14] & eq_bits[15];
endmodule