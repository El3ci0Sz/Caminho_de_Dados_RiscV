module Caminho_de_Dados (clk, reset, saida_pc);

    input clk;
    input reset;
    output [31:0] saida_pc;
    //Definição de variaveis.
    wire [31:0] pc, pc_next, Instrucao, Register1, Register2, Resultado_ALU, mem_data, saida_Imm;
    wire [2:0] ALUop;
    wire zero, Mem_Read, Mem_Write, RegWrite, ALU_src, Mem_to_Reg, branch;
    //Instanciação e junção dos modulos.
    // PC Register.
    Program_Counter PC_Reg (
        .clk(clk),
        .reset(reset),
        .pc_next(pc_next),
        .pc(pc)
    );

    // Instruction Memory.
    Instruction_Memory IM (
        .Endereco(pc),
        .Instrucao(Instrucao)
    );

    // Control Unit.
    Unit_Control Control (
        .opcode(Instrucao[6:0]),
        .funct3(Instrucao[14:12]),
        .funct7(Instrucao[31:25]),
        .ALUop(ALUop),
        .Mem_Read(Mem_Read),
        .Mem_Write(Mem_Write),
        .RegWrite(RegWrite),
        .ALU_src(ALU_src),
        .Mem_to_Reg(Mem_to_Reg),
        .branch(branch)
    );

    // Banco de Registradores.
    Banco_de_Registradores RF (
        .clk(clk),
        .rs1(Instrucao[19:15]),
        .rs2(Instrucao[24:20]),
        .rd(Instrucao[11:7]),
        .Write_Data(Mem_to_Reg ? mem_data : Resultado_ALU),
        .RegWrite(RegWrite),
        .Register1(Register1),
        .Register2(Register2),
        .reset(reset)
    );

    // Immediatos.
    Imm_gen IG (
        .Instrucao(Instrucao),
        .saida_Imm(saida_Imm)
    );

    // ALU.
    ALU ALU (
        .X(Register1),
        .Y(ALU_src ? saida_Imm : Register2),
        .ALUop(ALUop),
        .Resultado_ALU(Resultado_ALU),
        .zero(zero)
    );

    // Data Memory.
    Data_Memory DM (
        .clk(clk),
        .Endereco(Resultado_ALU),
        .Write_Data(Register2),
        .Mem_Write(Mem_Write),
        .Mem_Read(Mem_Read),
        .Read_Data(mem_data)
    );

    // Logica do program counter.
    assign pc_next = (branch && zero) ? (pc + (saida_Imm << 1)) : (pc + 1);
    assign saida_pc = pc;

    
endmodule
