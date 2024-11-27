module MUX16to1_16bit(
    input [15:0] and_res, or_res, xor_res, nand_res, nor_res, add_res, sub_res, inc_res, mul_res, div_res, eq_res, ge_res, le_res, gt_res, lt_res,
    input [3:0] op,
    output [15:0] result
);
    wire [15:0] selected [15:0];
    wire [15:0] not_op;
    wire [15:0] and_op [15:0];

    // Inverter cada bit do sinal de seleção
    not (not_op[0], op[0]);
    not (not_op[1], op[1]);
    not (not_op[2], op[2]);
    not (not_op[3], op[3]);

    // Gerar sinais de seleção para cada entrada
    and (and_op[0], not_op[3], not_op[2], not_op[1], not_op[0]);
    and (and_op[1], not_op[3], not_op[2], not_op[1], op[0]);
    and (and_op[2], not_op[3], not_op[2], op[1], not_op[0]);
    and (and_op[3], not_op[3], not_op[2], op[1], op[0]);
    and (and_op[4], not_op[3], op[2], not_op[1], not_op[0]);
    and (and_op[5], not_op[3], op[2], not_op[1], op[0]);
    and (and_op[6], not_op[3], op[2], op[1], not_op[0]);
    and (and_op[7], not_op[3], op[2], op[1], op[0]);
    and (and_op[8], op[3], not_op[2], not_op[1], not_op[0]);
    and (and_op[9], op[3], not_op[2], not_op[1], op[0]);
    and (and_op[10], op[3], not_op[2], op[1], not_op[0]);
    and (and_op[11], op[3], not_op[2], op[1], op[0]);
    and (and_op[12], op[3], op[2], not_op[1], not_op[0]);
    and (and_op[13], op[3], op[2], not_op[1], op[0]);
    and (and_op[14], op[3], op[2], op[1], not_op[0]);
    and (and_op[15], op[3], op[2], op[1], op[0]);

    // Selecionar a entrada correta
    and (selected[0][0], and_res[0], and_op[0]);
    and (selected[1][0], or_res[0], and_op[1]);
    and (selected[2][0], xor_res[0], and_op[2]);
    and (selected[3][0], nand_res[0], and_op[3]);
    and (selected[4][0], nor_res[0], and_op[4]);
    and (selected[5][0], add_res[0], and_op[5]);
    and (selected[6][0], sub_res[0], and_op[6]);
    and (selected[7][0], inc_res[0], and_op[7]);
    and (selected[8][0], mul_res[0], and_op[8]);
    and (selected[9][0], div_res[0], and_op[9]);
    and (selected[10][0], eq_res[0], and_op[10]);
    and (selected[11][0], ge_res[0], and_op[11]);
    and (selected[12][0], le_res[0], and_op[12]);
    and (selected[13][0], gt_res[0], and_op[13]);
    and (selected[14][0], lt_res[0], and_op[14]);
    and (selected[15][0], 16'b0, and_op[15]);

    // Combinar todas as entradas selecionadas
    or (result[0], selected[0][0], selected[1][0], selected[2][0], selected[3][0], selected[4][0], selected[5][0], selected[6][0], selected[7][0], selected[8][0], selected[9][0], selected[10][0], selected[11][0], selected[12][0], selected[13][0], selected[14][0], selected[15][0]);

    // Repetir para os outros bits
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : mux_loop
            and (selected[0][i], and_res[i], and_op[0]);
            and (selected[1][i], or_res[i], and_op[1]);
            and (selected[2][i], xor_res[i], and_op[2]);
            and (selected[3][i], nand_res[i], and_op[3]);
            and (selected[4][i], nor_res[i], and_op[4]);
            and (selected[5][i], add_res[i], and_op[5]);
            and (selected[6][i], sub_res[i], and_op[6]);
            and (selected[7][i], inc_res[i], and_op[7]);
            and (selected[8][i], mul_res[i], and_op[8]);
            and (selected[9][i], div_res[i], and_op[9]);
            and (selected[10][i], eq_res[i], and_op[10]);
            and (selected[11][i], ge_res[i], and_op[11]);
            and (selected[12][i], le_res[i], and_op[12]);
            and (selected[13][i], gt_res[i], and_op[13]);
            and (selected[14][i], lt_res[i], and_op[14]);
            and (selected[15][i], 16'b0, and_op[15]);

            or (result[i], selected[0][i], selected[1][i], selected[2][i], selected[3][i], selected[4][i], selected[5][i], selected[6][i], selected[7][i], selected[8][i], selected[9][i], selected[10][i], selected[11][i], selected[12][i], selected[13][i], selected[14][i], selected[15][i]);
        end
    endgenerate
endmodule