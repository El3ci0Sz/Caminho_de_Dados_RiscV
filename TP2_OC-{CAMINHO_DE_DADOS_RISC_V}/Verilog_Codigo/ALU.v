module ALU(X, Y, ALUop, Resultado_ALU, zero);
    input [31:0] X, Y;
    input [2:0] ALUop;
    output reg [31:0] Resultado_ALU;
    output zero;

    assign zero = (Resultado_ALU == 0) ? 1 : 0;

    always @(*) begin
        case (ALUop)// Seleciona o tipo de operação.
            3'b000: Resultado_ALU = X & Y;  // AND
            3'b001: Resultado_ALU = X | Y;  // OR
            3'b010: Resultado_ALU = X + Y;  // ADD
            3'b011: Resultado_ALU = X - Y;  // SUB
            3'b100: Resultado_ALU = X >> Y; // SRL
            default: Resultado_ALU = 0;
        endcase
    end
endmodule
