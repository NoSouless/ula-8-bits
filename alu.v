// M�dulo de somador
// Este m�dulo serve para realizar a opera��o de soma entre duas entradas de 8 bits.
// A opera��o de soma retorna a soma dos bits de entrada e um sinal de carry out.
module adder( 
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] sum, // Sa�da de 8 bits
  output wire carry_out  // Sinal de carry out
);
  assign {carry_out, sum} = a + b; // Soma de 8 bits
endmodule


// M�dulo de subtrator
// Este m�dulo serve para realizar a opera��o de subtra��o entre duas entradas de 8 bits.
// A opera��o de subtra��o retorna a diferen�a entre os bits de entrada e um sinal de carry out.
module subtractor(
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] diff, // Sa�da de 8 bits
  output wire carry_out // Sinal de carry out
);
  assign {carry_out, diff} = a - b; // Subtra��o de 8 bits
endmodule

// M�dulo de porta AND
// Este m�dulo serve para realizar a opera��o de AND entre duas entradas de 8 bits.
// A opera��o de AND retorna 1 se ambos os bits de entrada forem 1 e 0 se pelo menos um dos bits de entrada for 0.
module and_gate(
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] result // Sa�da de 8 bits
);
  assign result = a & b; // Opera��o de AND
endmodule

// M�dulo de porta OR
// Este m�dulo serve para realizar a opera��o de OR entre duas entradas de 8 bits.
// A opera��o de OR retorna 1 se pelo menos um dos bits de entrada for 1 e 0 se ambos os bits de entrada forem 0.
module or_gate( 
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] result // Sa�da de 8 bits
);
  assign result = a | b; // Opera��o de OR
endmodule

// M�dulo de porta XOR
// Este m�dulo serve para realizar a opera��o de XOR entre duas entradas de 8 bits.
// A opera��o de XOR retorna 1 se os bits de entrada forem diferentes e 0 se os bits de entrada forem iguais.
module xor_gate( // M�dulo de porta XOR
  input wire [7:0] a, b, // Entradas de 8 bits
  output wire [7:0] result // Sa�da de 8 bits
);
  assign result = a ^ b; // Opera��o de XOR
endmodule

// M�dulo de porta NOT
// Este m�dulo serve para inverter os bits de uma entrada de 8 bits.
// Desta forma, o bit 0 � invertido para 1 e o bit 1 � invertido para 0.
module not_gate( 
  input wire [7:0] a, // Entrada de 8 bits
  output wire [7:0] result // Sa�da de 8 bits
);
  assign result = ~a; // Opera��o de NOT
endmodule

// M�dulos de shift left
// Este m�dulo serve para deslocar os bits de uma entrada de 8 bits para a esquerda.
// Desta forma, o bit mais significativo � deslocado para a esquerda e o bit menos significativo � descartado.
module shift_left( 
  input wire [7:0] a, // Entrada de 8 bits
  output wire [7:0] result // Sa�da de 8 bits
);
  assign result = a << 1; // Opera��o de shift left
endmodule

// M�dulo de shift right
// Este m�dulo serve para deslocar os bits de uma entrada de 8 bits para a direita.
// Desta forma, o bit menos significativo � deslocado para a direita e o bit mais significativo � descartado.
module shift_right( 
  input wire [7:0] a, // Entrada de 8 bits
  output wire [7:0] result // Sa�da de 8 bits
);
  assign result = a >> 1; // Opera��o de shift right
endmodule

// M�dulo ALU
// Este m�dulo serve para realizar opera��es aritm�ticas e l�gicas com duas entradas de 8 bits, a e b, e um c�digo de opera��o de 3 bits.
// O m�dulo ALU possui uma sa�da de 8 bits para o resultado da opera��o, um sinal de carry out e um sinal de zero.
// O m�dulo ALU utiliza m�dulos b�sicos para realizar as opera��es, como somador, subtrator, porta AND, porta OR, porta XOR, porta NOT, shift left e shift right.
// O m�dulo ALU seleciona a opera��o com base no c�digo de opera��o e define o resultado, o sinal de carry out e o sinal de zero de acordo com a opera��o selecionada.
module alu (
  input wire [7:0] a, b,  // Entradas de 8 bits
  input wire [2:0] opcode, // C�digo de opera��o de 3 bits
  output wire [7:0] result, // Resultado de 8 bits
  output wire carry_out,    // Sinal de carry out
  output wire zero          // Sinal de zero
);

  // Fios
  wire [7:0] sum, diff, and_res, or_res, xor_res, not_res, shl_res, shr_res; // Sa�das dos m�dulos b�sicos
  // sum: soma
  // diff: diferen�a
  // and_res: resultado da opera��o AND
  // or_res: resultado da opera��o OR
  // xor_res: resultado da opera��o XOR
  // not_res: resultado da opera��o NOT
  // shl_res: resultado do shift left
  // shr_res: resultado do shift right
  wire add_carry_out, sub_carry_out; // Sinais de carry out dos m�dulos b�sicos
  // add_carry_out: carry out do somador
  // sub_carry_out: carry out do subtrator

  // Instancia os m�dulos b�sicos
  adder add_inst(.a(a), .b(b), .sum(sum), .carry_out(add_carry_out)); // Somador
  subtractor sub_inst(.a(a), .b(b), .diff(diff), .carry_out(sub_carry_out)); // Subtrator
  and_gate and_inst(.a(a), .b(b), .result(and_res)); // Porta AND
  or_gate or_inst(.a(a), .b(b), .result(or_res)); // Porta OR
  xor_gate xor_inst(.a(a), .b(b), .result(xor_res)); // Porta XOR
  not_gate not_inst(.a(a), .result(not_res)); // Porta NOT
  shift_left shl_inst(.a(a), .result(shl_res)); // Shift left
  shift_right shr_inst(.a(a), .result(shr_res)); // Shift right

  // Multiplexador para selecionar a opera��o com base no opcode
  assign result = (opcode == 3'b000) ? sum : // Soma, quando opcode = 000
                  (opcode == 3'b001) ? diff : // Subtra��o, quando opcode = 001
                  (opcode == 3'b010) ? and_res : // AND, quando opcode = 010
                  (opcode == 3'b011) ? or_res : // OR, quando opcode = 011
                  (opcode == 3'b100) ? xor_res : // XOR, quando opcode = 100
                  (opcode == 3'b101) ? not_res : // NOT, quando opcode = 101
                  (opcode == 3'b110) ? shl_res : // Shift left, quando opcode = 110
                  (opcode == 3'b111) ? shr_res :  // Shift right, quando opcode = 111
                  8'b00000000; // Resultado zero, para outros opcodes

  // Sinal de carry out
  assign carry_out = (opcode == 3'b000) ? add_carry_out : // Soma
                     (opcode == 3'b001) ? sub_carry_out :  // Subtra��o
                     1'b0; // Outras opera��es

  // Sinal de zero
  assign zero = (result == 8'b00000000); // Verifica se o resultado � zero
  // Se o resultado for zero, o sinal de zero � 1, caso contr�rio, o sinal de zero � 0

endmodule