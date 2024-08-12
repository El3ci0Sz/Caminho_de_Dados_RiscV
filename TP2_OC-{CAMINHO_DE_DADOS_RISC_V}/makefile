OUTPUT = exec

SIMULATOR = iverilog

LOCAL = Verilog_Codigo
# Arquivo do test bench
TESTBENCH = $(LOCAL)/Caminho_de_Dados_tb.v

SOURCES = $(LOCAL)/ALU.v \
          $(LOCAL)/Data_Memory.v \
          $(LOCAL)/Imm_gen.v \
          $(LOCAL)/Instruction_Memory.v \
          $(LOCAL)/Program_Counter.v \
          $(LOCAL)/Banco_de_Registradores.v \
          $(LOCAL)/Unit_Control.v \
		  $(LOCAL)/Caminho_de_Dados.v

all: $(OUTPUT)



# Nome do arquivo de saída do simulador
OUT_FILE = $(OUTPUT).out

# Arquivo de memória inicial (opcional)
MEMORY_FILE = Dados.bin

# Regra padrão para compilar e simular
all: $(OUT_FILE) run

# Regra para compilar os arquivos Verilog junto com o test bench
$(OUT_FILE): $(SOURCES) $(TESTBENCH)
	$(SIMULATOR) -o $(OUT_FILE) $(SOURCES) $(TESTBENCH)

# Regra para rodar a simulação
run:
	vvp $(OUT_FILE)

# Regra para abrir o GTKWave (se o arquivo .vcd for gerado)
view:
	gtkwave $(OUTPUT).vcd &

# Regra para limpar os arquivos gerados
clean:
	rm -f $(OUT_FILE) $(OUTPUT).vcd