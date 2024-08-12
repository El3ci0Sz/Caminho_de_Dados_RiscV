module Testbench;

    reg clk;
    reg reset;
    wire [31:0] saida_pc;

    // Instancia o módulo Caminho_de_Dados.
    Caminho_de_Dados uut (
        .clk(clk),
        .reset(reset),
        .saida_pc(saida_pc)
    );

    // Clock.
    always begin
        #5 clk = ~clk;
    end

    // Inicialização dos sinais e execução do teste.
    initial begin
        
        // Inicializa o clock e o reset
        clk = 0;
        reset = 0;

        // Configuração para gerar o arquivo VCD
        $dumpfile("exec.vcd");   // Nome do arquivo VCD
        $dumpvars(0, Testbench);      // Adiciona todos os sinais do testbench ao arquivo VCD

        // Reset geral.
        reset = 1;
        #10;
        reset = 0;

        // Delay, para as instruções executarem.
        #200; 

        $display("Teste completo.");

        // Imprimir o conteúdo dos registradores.
        $display("==================INICIO===================");
        $display("Registrador[0]  %0d", uut.RF.reg_vetor[0]);
        $display("Registrador[1]  %0d", uut.RF.reg_vetor[1]);
        $display("Registrador[2]  %0d", uut.RF.reg_vetor[2]);
        $display("Registrador[3]  %0d", uut.RF.reg_vetor[3]);
        $display("Registrador[4]  %0d", uut.RF.reg_vetor[4]);
        $display("Registrador[5]  %0d", uut.RF.reg_vetor[5]);
        $display("Registrador[6]  %0d", uut.RF.reg_vetor[6]);
        $display("Registrador[7]  %0d", uut.RF.reg_vetor[7]);
        $display("Registrador[8]  %0d", uut.RF.reg_vetor[8]);
        $display("Registrador[9]  %0d", uut.RF.reg_vetor[9]);
        $display("Registrador[10] %0d", uut.RF.reg_vetor[10]);
        $display("Registrador[11] %0d", uut.RF.reg_vetor[11]);
        $display("Registrador[12] %0d", uut.RF.reg_vetor[12]);
        $display("Registrador[13] %0d", uut.RF.reg_vetor[13]);
        $display("Registrador[14] %0d", uut.RF.reg_vetor[14]);
        $display("Registrador[15] %0d", uut.RF.reg_vetor[15]);
        $display("Registrador[16] %0d", uut.RF.reg_vetor[16]);
        $display("Registrador[17] %0d", uut.RF.reg_vetor[17]);
        $display("Registrador[18] %0d", uut.RF.reg_vetor[18]);
        $display("Registrador[19] %0d", uut.RF.reg_vetor[19]);
        $display("Registrador[20] %0d", uut.RF.reg_vetor[20]);
        $display("Registrador[21] %0d", uut.RF.reg_vetor[21]);
        $display("Registrador[22] %0d", uut.RF.reg_vetor[22]);
        $display("Registrador[23] %0d", uut.RF.reg_vetor[23]);
        $display("Registrador[24] %0d", uut.RF.reg_vetor[24]);
        $display("Registrador[25] %0d", uut.RF.reg_vetor[25]);
        $display("Registrador[26] %0d", uut.RF.reg_vetor[26]);
        $display("Registrador[27] %0d", uut.RF.reg_vetor[27]);
        $display("Registrador[28] %0d", uut.RF.reg_vetor[28]);
        $display("Registrador[29] %0d", uut.RF.reg_vetor[29]);
        $display("Registrador[30] %0d", uut.RF.reg_vetor[30]);
        $display("Registrador[31] %0d", uut.RF.reg_vetor[31]);
        $display("===================FIM====================");

        $finish;
    end

endmodule
