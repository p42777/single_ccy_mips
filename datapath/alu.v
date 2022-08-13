module alu(busA, busB, ALUctr, zero, Alu_out, Addr);
    input [31:0] busA, busB;
    input [1:0] ALUctr;

    output [31:0] zero;
    output reg[31:0] Alu_out;

    // add, sub, or
    parameter ADD = 2'b00;
    parameter SUB = 2'b01;
    parameter OR = 2'b10;

    // conditions
    always@(*) begin
        case(ALUctr)
            ADD: begin
                Alu_out = busA + busB;
            end
            SUB: begin
                Alu_out = busA - busB;
            end
            OR: begin
                Alu_out = busA|busB;
            end
        endcase
    end

    assign zero = Alu_out;
    assign Addr = Alu_out;


endmodule