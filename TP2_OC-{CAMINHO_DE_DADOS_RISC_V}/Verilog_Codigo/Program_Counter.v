module Program_Counter (clk, reset, pc_next, pc);

input clk;
input reset;
input [31:0] pc_next;
output reg [31:0] pc;

always @(posedge clk or posedge reset)begin
    if(reset)begin //Zera, se reset =1.
        pc <= 0;
    end
    else begin //Se nao, pc é igual ao proximo pc.
        pc <= pc_next;
    end
end

endmodule