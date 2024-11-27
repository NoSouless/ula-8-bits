module MUL_16bit(
    input [15:0] A, B,
    output [31:0] RESULTADO
);
    wire [31:0] partial [15:0];
    wire [31:0] sum [15:0];

    // Gerar produtos parciais
    assign partial[0] = {16'b0, A[0] ? B : 16'b0};
    assign partial[1] = {15'b0, A[1] ? B : 16'b0, 1'b0};
    assign partial[2] = {14'b0, A[2] ? B : 16'b0, 2'b0};
    assign partial[3] = {13'b0, A[3] ? B : 16'b0, 3'b0};
    assign partial[4] = {12'b0, A[4] ? B : 16'b0, 4'b0};
    assign partial[5] = {11'b0, A[5] ? B : 16'b0, 5'b0};
    assign partial[6] = {10'b0, A[6] ? B : 16'b0, 6'b0};
    assign partial[7] = {9'b0, A[7] ? B : 16'b0, 7'b0};
    assign partial[8] = {8'b0, A[8] ? B : 16'b0, 8'b0};
    assign partial[9] = {7'b0, A[9] ? B : 16'b0, 9'b0};
    assign partial[10] = {6'b0, A[10] ? B : 16'b0, 10'b0};
    assign partial[11] = {5'b0, A[11] ? B : 16'b0, 11'b0};
    assign partial[12] = {4'b0, A[12] ? B : 16'b0, 12'b0};
    assign partial[13] = {3'b0, A[13] ? B : 16'b0, 13'b0};
    assign partial[14] = {2'b0, A[14] ? B : 16'b0, 14'b0};
    assign partial[15] = {1'b0, A[15] ? B : 16'b0, 15'b0};

    // Somar produtos parciais
    assign sum[0] = partial[0];
    assign sum[1] = sum[0] + partial[1];
    assign sum[2] = sum[1] + partial[2];
    assign sum[3] = sum[2] + partial[3];
    assign sum[4] = sum[3] + partial[4];
    assign sum[5] = sum[4] + partial[5];
    assign sum[6] = sum[5] + partial[6];
    assign sum[7] = sum[6] + partial[7];
    assign sum[8] = sum[7] + partial[8];
    assign sum[9] = sum[8] + partial[9];
    assign sum[10] = sum[9] + partial[10];
    assign sum[11] = sum[10] + partial[11];
    assign sum[12] = sum[11] + partial[12];
    assign sum[13] = sum[12] + partial[13];
    assign sum[14] = sum[13] + partial[14];
    assign sum[15] = sum[14] + partial[15];

    // Resultado final
    assign RESULTADO = sum[15];
endmodule