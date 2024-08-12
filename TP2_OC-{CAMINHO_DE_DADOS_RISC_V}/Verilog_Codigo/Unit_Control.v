module Unit_Control (opcode,funct3,funct7,ALUop,Mem_Read,Mem_Write,RegWrite,ALU_src,Mem_to_Reg,branch);
    input [6:0] opcode;
    input [2:0] funct3;
    input [6:0] funct7;
    output reg [2:0] ALUop;
    output reg Mem_Read;
    output reg Mem_Write;
    output reg RegWrite;
    output reg ALU_src;
    output reg Mem_to_Reg;
    output reg branch;

    always @(*) begin
        // Inicializar os sinais de controle
        ALUop = 3'b000;
        Mem_Read = 0;
        Mem_Write = 0;
        RegWrite = 0;
        ALU_src = 0;
        Mem_to_Reg = 0;
        branch = 0;

        case (opcode)
            7'b0000011: begin  // LB
                ALUop = 3'b010; 
                Mem_Read = 1;
                Mem_Write = 0;
                RegWrite = 1;
                ALU_src = 1;
                Mem_to_Reg = 1;
                branch = 0;
            end
            7'b0100011: begin  // SB
                ALUop = 3'b010;  
                Mem_Read = 0;
                Mem_Write = 1;
                RegWrite = 0;
                ALU_src = 1;
                Mem_to_Reg = 0;
                branch = 0;
            end
            7'b1100011: begin  // BEQ
                ALUop = 3'b011;  
                Mem_Read = 0;
                Mem_Write = 0;
                RegWrite = 0;
                ALU_src = 0;
                Mem_to_Reg = 0;
                branch = 1;
            end
            7'b0010011: begin  // TIPO I
                case (funct3)
                    3'b000: ALUop = 3'b010;  // ADDI
                    3'b110: ALUop = 3'b001;  // ORI
                    3'b101: ALUop = 3'b100;  // SRL
                    default: ALUop = 3'b000;
                endcase
                Mem_Read = 0;
                Mem_Write = 0;
                RegWrite = 1;
                ALU_src = 1;
                Mem_to_Reg = 0;
                branch = 0;
            end
             7'b0110011: begin  // TIPO R
                case ({funct7, funct3})
                    {7'b0000000, 3'b000}: ALUop = 3'b010;  // ADD
                    {7'b0100000, 3'b000}: ALUop = 3'b011;  // SUB
                    {7'b0000000, 3'b111}: ALUop = 3'b101;  // AND
                    default: ALUop = 3'b000;
                endcase
                Mem_Read = 0;
                Mem_Write = 0;
                RegWrite = 1;
                ALU_src = 0;
                Mem_to_Reg = 0;
                branch = 0;
             end
            default: begin
                ALUop = 3'b000;
                Mem_Read = 0;
                Mem_Write = 0;
                RegWrite = 0;
                ALU_src = 0;
                Mem_to_Reg = 0;
                branch = 0;
            end
        endcase
    end
endmodule
