module Imm_gen (Instrucao,saida_Imm);
    input  [31:0] Instrucao;
    output reg [31:0] saida_Imm;


// tipo I
wire [31:0] saida_Imm_I = { {20{Instrucao[31]}}, Instrucao[31:20] };

// tipo S
wire [31:0] saida_Imm_S = { {20{Instrucao[31]}}, Instrucao[31:25], Instrucao[11:7] };

// tipo B
wire [31:0] saida_Imm_B = { {19{Instrucao[31]}}, Instrucao[31], Instrucao[7], Instrucao[30:25], Instrucao[11:8], 1'b0 };

// Seleção do imediato.
always @(*) begin
    case (Instrucao[6:0])
        7'b0000011: saida_Imm = saida_Imm_I;  //  tipo I
        7'b0100011: saida_Imm = saida_Imm_S;  //  tipo S 
        7'b1100011: saida_Imm = saida_Imm_B;  //  tipo B
        7'b0010011: saida_Imm = saida_Imm_I;  //  tipo I
        default:    saida_Imm = 32'b0;        // 0s
    endcase
end

endmodule
