module LE_16bit(
    input [15:0] A, B,
    output RESULTADO
);
    wire [15:0] eq_bits;
    wire [15:0] lt_bits;
    wire [15:0] temp;

    // Comparar cada bit usando portas XOR e inverter o resultado para igualdade
    xor (temp[0], A[0], B[0]);
    not (eq_bits[0], temp[0]);

    xor (temp[1], A[1], B[1]);
    not (eq_bits[1], temp[1]);

    xor (temp[2], A[2], B[2]);
    not (eq_bits[2], temp[2]);

    xor (temp[3], A[3], B[3]);
    not (eq_bits[3], temp[3]);

    xor (temp[4], A[4], B[4]);
    not (eq_bits[4], temp[4]);

    xor (temp[5], A[5], B[5]);
    not (eq_bits[5], temp[5]);

    xor (temp[6], A[6], B[6]);
    not (eq_bits[6], temp[6]);

    xor (temp[7], A[7], B[7]);
    not (eq_bits[7], temp[7]);

    xor (temp[8], A[8], B[8]);
    not (eq_bits[8], temp[8]);

    xor (temp[9], A[9], B[9]);
    not (eq_bits[9], temp[9]);

    xor (temp[10], A[10], B[10]);
    not (eq_bits[10], temp[10]);

    xor (temp[11], A[11], B[11]);
    not (eq_bits[11], temp[11]);

    xor (temp[12], A[12], B[12]);
    not (eq_bits[12], temp[12]);

    xor (temp[13], A[13], B[13]);
    not (eq_bits[13], temp[13]);

    xor (temp[14], A[14], B[14]);
    not (eq_bits[14], temp[14]);

    xor (temp[15], A[15], B[15]);
    not (eq_bits[15], temp[15]);

    // Comparar cada bit usando portas AND e NOT para menor que
    and (lt_bits[15], ~A[15], B[15]);
    and (lt_bits[14], ~A[14], B[14]);
    and (lt_bits[13], ~A[13], B[13]);
    and (lt_bits[12], ~A[12], B[12]);
    and (lt_bits[11], ~A[11], B[11]);
    and (lt_bits[10], ~A[10], B[10]);
    and (lt_bits[9], ~A[9], B[9]);
    and (lt_bits[8], ~A[8], B[8]);
    and (lt_bits[7], ~A[7], B[7]);
    and (lt_bits[6], ~A[6], B[6]);
    and (lt_bits[5], ~A[5], B[5]);
    and (lt_bits[4], ~A[4], B[4]);
    and (lt_bits[3], ~A[3], B[3]);
    and (lt_bits[2], ~A[2], B[2]);
    and (lt_bits[1], ~A[1], B[1]);
    and (lt_bits[0], ~A[0], B[0]);

    // Combinar todos os bits de igualdade e menor que usando portas OR
    or (RESULTADO, 
        lt_bits[15], 
        eq_bits[15] & lt_bits[14], 
        eq_bits[15] & eq_bits[14] & lt_bits[13], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & lt_bits[12], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & lt_bits[11], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & lt_bits[10], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & lt_bits[9], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & lt_bits[8], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & lt_bits[7], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & lt_bits[6], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & lt_bits[5], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & eq_bits[5] & lt_bits[4], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & lt_bits[3], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & lt_bits[2], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & eq_bits[2] & lt_bits[1], 
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & eq_bits[2] & eq_bits[1] & lt_bits[0],
        eq_bits[15] & eq_bits[14] & eq_bits[13] & eq_bits[12] & eq_bits[11] & eq_bits[10] & eq_bits[9] & eq_bits[8] & eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & eq_bits[2] & eq_bits[1] & eq_bits[0]
    );
endmodule