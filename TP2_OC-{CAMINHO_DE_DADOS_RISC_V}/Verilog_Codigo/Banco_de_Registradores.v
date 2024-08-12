module Banco_de_Registradores(clk,reset,RegWrite,rs1,rs2,rd,Write_Data,Register1,Register2);
    input clk;
    input reset;
    input RegWrite;
    input [4:0] rs1, rs2, rd;
    input [31:0] Write_Data;
    output [31:0] Register1, Register2;
    reg [31:0] reg_vetor [31:0]; // Vetor com 32 registradores.
    integer i;
    //Os 2 registradores usado nas operações.
    assign Register1 = reg_vetor[rs1];
    assign Register2 = reg_vetor[rs2];

    //Inicia os registradores como 0.
    always @(posedge clk or posedge reset) begin
        if (reset) begin //Reseta todos os registradores para 0.
            for (i = 0; i < 32; i = i + 1) begin
                reg_vetor[i] <= 0;
            end
        end else if (RegWrite) begin // Se RegWrite for 1, escreve o resultado de uma operação no endereço de rd.
            reg_vetor[rd] <= Write_Data;
        end
    end

endmodule
