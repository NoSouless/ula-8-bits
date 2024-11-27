module AND_16bit(output [15:0] result, input [15:0] a, b);
    assign result = a & b;
endmodule

module OR_16bit(output [15:0] result, input [15:0] a, b);
    assign result = a | b;
endmodule

module XOR_16bit(output [15:0] result, input [15:0] a, b);
    assign result = a ^ b;
endmodule

module NAND_16bit(output [15:0] result, input [15:0] a, b);
    assign result = ~(a & b);
endmodule

module NOR_16bit(output [15:0] result, input [15:0] a, b);
    assign result = ~(a | b);
endmodule

module ADD_16bit(output [15:0] result, output carry_out, input [15:0] a, b, input carry_in);
    assign {carry_out, result} = a + b + carry_in;
endmodule

module SUB_16bit(output [15:0] result, output borrow_out, input [15:0] a, b, input borrow_in);
    assign {borrow_out, result} = a - b - borrow_in;
endmodule

module INC_16bit(output [15:0] result, input [15:0] a);
    assign result = a + 1;
endmodule

module MUL_16bit(output [15:0] result, input [15:0] a, b);
    assign result = a * b;
endmodule

module DIV_16bit(output [15:0] result, input [15:0] a, b);
    assign result = a / b;
endmodule

module EQ_16bit(output result, input [15:0] a, b);
    assign result = (a == b);
endmodule

module GE_16bit(output result, input [15:0] a, b);
    assign result = (a >= b);
endmodule

module LE_16bit(output result, input [15:0] a, b);
    assign result = (a <= b);
endmodule

module MUX16to1_16bit(output [15:0] result, input [15:0] and_res, or_res, xor_res, nand_res, nor_res, add_res, sub_res, inc_res, mul_res, div_res, eq_res, ge_res, le_res, input [3:0] op);
    assign result = (op == 4'b0000) ? and_res : // 0000 = AND
                    (op == 4'b0001) ? or_res : // 0001 = OR
                    (op == 4'b0010) ? xor_res : // 0010 = XOR
                    (op == 4'b0011) ? nand_res : // 0011 = NAND
                    (op == 4'b0100) ? nor_res : // 0100 = NOR
                    (op == 4'b0101) ? add_res : // 0101 = ADD
                    (op == 4'b0110) ? sub_res : // 0110 = SUB
                    (op == 4'b0111) ? inc_res : // 0111 = INC
                    (op == 4'b1000) ? mul_res : // 1000 = MUL
                    (op == 4'b1001) ? div_res : // 1001 = DIV
                    (op == 4'b1010) ? eq_res : // 1010 = EQ
                    (op == 4'b1011) ? ge_res : // 1011 = GE
                    (op == 4'b1100) ? le_res : 16'b0; // 1100 = LE
endmodule

module ULA(output [15:0] result, input [15:0] a, b, input [3:0] op);
    wire [15:0] and_res, or_res, xor_res, nand_res, nor_res, add_res, sub_res, inc_res, mul_res, div_res, eq_res;
    wire ge_res, le_res;
    wire carry_out, borrow_out;

    AND_16bit and_gate(and_res, a, b);
    OR_16bit or_gate(or_res, a, b);
    XOR_16bit xor_gate(xor_res, a, b);
    NAND_16bit nand_gate(nand_res, a, b);
    NOR_16bit nor_gate(nor_res, a, b);
    ADD_16bit adder(add_res, carry_out, a, b, 1'b0);
    SUB_16bit subtractor(sub_res, borrow_out, a, b, 1'b0);
    INC_16bit incrementer(inc_res, a);
    MUL_16bit multiplier(mul_res, a, b);
    DIV_16bit divider(div_res, a, b);
    EQ_16bit equal(eq_res, a, b);
    GE_16bit greater_equal(ge_res, a, b);
    LE_16bit less_equal(le_res, a, b);

    MUX16to1_16bit mux(result, and_res, or_res, xor_res, nand_res, nor_res, add_res, sub_res, inc_res, mul_res, div_res, eq_res, ge_res, le_res, op);
endmodule