module Data_Memory (clk,Endereco,Write_Data,Mem_Write,Mem_Read,Read_Data);
    input wire clk;
    input wire [31:0] Endereco;
    input wire [31:0] Write_Data;
    input wire Mem_Write;
    input wire Mem_Read;
    output reg [31:0] Read_Data;
    reg [31:0] vetor_memoria [0:54];  // Vetor que representa a memória de dados.

    // Carrega dados da memória de um arquivo.
    initial begin
        $readmemb("Memoria_Dados.bin", vetor_memoria);
    end

    always @(posedge clk) begin
        if (Mem_Write) //Se 1, escreve na posição do vetor, do endereço especifico.
            vetor_memoria[Endereco[7:0]] <= Write_Data;
    end

    always @(*) begin
        if (Mem_Read) //Se 1, le um dado.
            Read_Data = vetor_memoria[Endereco[7:0]];
        else
            Read_Data = 32'b0;
    end
endmodule
