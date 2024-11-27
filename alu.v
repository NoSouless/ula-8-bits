// Módulo de somador
// Este módulo serve para realizar a operação de soma entre duas entradas de 8 bits.
// A operação de soma retorna a soma dos bits de entrada e um sinal de carry out.
module adder( 
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] sum, // Saída de 8 bits
  output wire carry_out  // Sinal de carry out
);
  assign {carry_out, sum} = a + b; // Soma de 8 bits
endmodule


// Módulo de subtrator
// Este módulo serve para realizar a operação de subtração entre duas entradas de 8 bits.
// A operação de subtração retorna a diferença entre os bits de entrada e um sinal de carry out.
module subtractor(
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] diff, // Saída de 8 bits
  output wire carry_out // Sinal de carry out
);
  assign {carry_out, diff} = a - b; // Subtração de 8 bits
endmodule

// Módulo de porta AND
// Este módulo serve para realizar a operação de AND entre duas entradas de 8 bits.
// A operação de AND retorna 1 se ambos os bits de entrada forem 1 e 0 se pelo menos um dos bits de entrada for 0.
module and_gate(
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] result // Saída de 8 bits
);
  assign result = a & b; // Operação de AND
endmodule

// Módulo de porta OR
// Este módulo serve para realizar a operação de OR entre duas entradas de 8 bits.
// A operação de OR retorna 1 se pelo menos um dos bits de entrada for 1 e 0 se ambos os bits de entrada forem 0.
module or_gate( 
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] result // Saída de 8 bits
);
  assign result = a | b; // Operação de OR
endmodule

// Módulo de porta XOR
// Este módulo serve para realizar a operação de XOR entre duas entradas de 8 bits.
// A operação de XOR retorna 1 se os bits de entrada forem diferentes e 0 se os bits de entrada forem iguais.
module xor_gate( // Módulo de porta XOR
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] result // Saída de 8 bits
);
  assign result = a ^ b; // Operação de XOR
endmodule

// Módulo de porta NOT
// Este módulo serve para inverter os bits de uma entrada de 8 bits.
// Desta forma, o bit 0 é invertido para 1 e o bit 1 é invertido para 0.
module not_gate( 
  input wire [7:0] a, // Entrada de 8 bits
  output wire [7:0] result // Saída de 8 bits
);
  assign result = ~a; // Operação de NOT
endmodule

// Módulos de shift left
// Este módulo serve para deslocar os bits de uma entrada de 8 bits para a esquerda.
// Desta forma, o bit mais significativo é deslocado para a esquerda e o bit menos significativo é descartado.
module shift_left( 
  input wire [7:0] a, // Entrada de 8 bits
  output wire [7:0] result // Saída de 8 bits
);
  assign result = a << 1; // Operação de shift left
endmodule

// Módulo de shift right
// Este módulo serve para deslocar os bits de uma entrada de 8 bits para a direita.
// Desta forma, o bit menos significativo é deslocado para a direita e o bit mais significativo é descartado.
module shift_right( 
  input wire [7:0] a, // Entrada de 8 bits
  output wire [7:0] result // Saída de 8 bits
);
  assign result = a >> 1; // Operação de shift right
endmodule

// Módulo ALU
// Este módulo serve para realizar operações aritméticas e lógicas com duas entradas de 8 bits, a e b, e um código de operação de 3 bits.
// O módulo ALU possui uma saída de 8 bits para o resultado da operação, um sinal de carry out e um sinal de zero.
// O módulo ALU utiliza módulos básicos para realizar as operações, como somador, subtrator, porta AND, porta OR, porta XOR, porta NOT, shift left e shift right.
// O módulo ALU seleciona a operação com base no código de operação e define o resultado, o sinal de carry out e o sinal de zero de acordo com a operação selecionada.
module alu (
  input wire [7:0] a, b,  // Entradas de 8 bits
  input wire [2:0] opcode, // Código de operação de 3 bits
  output wire [7:0] result, // Resultado de 8 bits
  output wire carry_out,    // Sinal de carry out
  output wire zero          // Sinal de zero
);

  // Fios
  wire [7:0] sum, diff, and_res, or_res, xor_res, not_res, shl_res, shr_res; // Saídas dos módulos básicos
  // sum: soma
  // diff: diferença
  // and_res: resultado da operação AND
  // or_res: resultado da operação OR
  // xor_res: resultado da operação XOR
  // not_res: resultado da operação NOT
  // shl_res: resultado do shift left
  // shr_res: resultado do shift right
  wire add_carry_out, sub_carry_out; // Sinais de carry out dos módulos básicos
  // add_carry_out: carry out do somador
  // sub_carry_out: carry out do subtrator

  // Instancia os módulos básicos
  adder add_inst(.a(a), .b(b), .sum(sum), .carry_out(add_carry_out)); // Somador
  subtractor sub_inst(.a(a), .b(b), .diff(diff), .carry_out(sub_carry_out)); // Subtrator
  and_gate and_inst(.a(a), .b(b), .result(and_res)); // Porta AND
  or_gate or_inst(.a(a), .b(b), .result(or_res)); // Porta OR
  xor_gate xor_inst(.a(a), .b(b), .result(xor_res)); // Porta XOR
  not_gate not_inst(.a(a), .result(not_res)); // Porta NOT
  shift_left shl_inst(.a(a), .result(shl_res)); // Shift left
  shift_right shr_inst(.a(a), .result(shr_res)); // Shift right

  // Multiplexador para selecionar a operação com base no opcode
  assign result = (opcode == 3'b000) ? sum : // Soma, quando opcode = 000
                  (opcode == 3'b001) ? diff : // Subtração, quando opcode = 001
                  (opcode == 3'b010) ? and_res : // AND, quando opcode = 010
                  (opcode == 3'b011) ? or_res : // OR, quando opcode = 011
                  (opcode == 3'b100) ? xor_res : // XOR, quando opcode = 100
                  (opcode == 3'b101) ? not_res : // NOT, quando opcode = 101
                  (opcode == 3'b110) ? shl_res : // Shift left, quando opcode = 110
                  (opcode == 3'b111) ? shr_res :  // Shift right, quando opcode = 111
                  8'b00000000; // Resultado zero, para outros opcodes

  // Sinal de carry out
  assign carry_out = (opcode == 3'b000) ? add_carry_out : // Soma
                     (opcode == 3'b001) ? sub_carry_out :  // Subtração
                     1'b0; // Outras operações

  // Sinal de zero
  assign zero = (result == 8'b00000000); // Verifica se o resultado é zero
  // Se o resultado for zero, o sinal de zero é 1, caso contrário, o sinal de zero é 0

endmodule