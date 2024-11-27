module DIV_16bit(
    input [15:0] A, B,
    output reg [15:0] RESULT
);
    reg [15:0] dividend, divisor, quotient, remainder;
    reg [4:0] bit; // 5 bits to count from 0 to 16

    always @(*) begin
        dividend = A;
        divisor = B;
        quotient = 16'b0;
        remainder = 16'b0;

        for (bit = 0; bit < 16; bit = bit + 1) begin
            remainder = {remainder[14:0], dividend[15-bit]};
            if (remainder >= divisor) begin
                remainder = remainder - divisor;
                quotient[15-bit] = 1'b1;
            end
        end

        RESULT = quotient;
    end
endmodule