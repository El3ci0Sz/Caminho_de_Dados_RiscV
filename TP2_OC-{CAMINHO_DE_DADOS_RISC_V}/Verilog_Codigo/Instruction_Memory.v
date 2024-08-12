module Instruction_Memory(Endereco, Instrucao);
    input [31:0] Endereco;
    output reg [31:0] Instrucao;
    reg [31:0] Instruction_Mem [0:255]; // Memoria de instruções, onde as memorias do programa estao/serao armazenadas.

    initial begin 
       //Instruções que deixamos de padrão.
        Instruction_Mem[0] = 32'b00000000101100000000001110010011; // addi x7, x0, 11
        Instruction_Mem[1] = 32'b00000000000100000000000010000011; // lb x1, 1(x0) 
        Instruction_Mem[2] = 32'b00000000001000001000000100100011; // sb x2, 2(x1)
        Instruction_Mem[3] = 32'b01000000001000001000000110110011; // sub x3, x1, x2
        Instruction_Mem[4] = 32'b00000000000100010111001000110011; // and x4, x2, x1
        Instruction_Mem[5] = 32'b00000000000100001110001010010011; // ori x5, x1, 1
        Instruction_Mem[6] = 32'b00000000000100010101001100010011; // srl x6, x2, 1
        Instruction_Mem[7] = 32'b00000000000100010000000011100011; // beq x1, x2, 1


    end
    //Le uma instrução por vez.
    always @(*)begin
        Instrucao = Instruction_Mem[Endereco[7:0]];
    end
endmodule
