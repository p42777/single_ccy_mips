module ifu(nPC_sel, zero, clk, rst, instruction);
    input clk, rst;
    input [1:0] nPC_sel;
    input [31:0] zero;
    output [31:0] instruction;

    reg [31:0] pc;
    reg [31:0] pcnew;
    reg [7:0]im[1023:0];
    wire [31:0] temp, t0, t1;
    wire [15:0] // hexidecimal
    reg [31:0] extout;

    // give instruction values
    assign instruction = {im[pc[9:0]], im[pc[9:0]+1], im[pc[9:0]+2], im[pc[9:0]+3]};

    // set extout
    assign temp = {{16{imm16[15]}}, imm16}; // sign extention
    always@(*) begin
        extout = temp[31:0]<<2; // left shift 2 bits
    end


    // set pcnew
    assign t0 = pc + 4;
    assign t1 = to + extout;

    always@(*)
    begin
        if (nPC_sel == 2'b00) begin // 2 bits binary representation 00
            pcnew = t0;
        end
        else if (nPC_sel == 2'b01) begin // 2 bits binary representation 01
            pcnew = t1; // branch
        end
    end


    // reset
    always@(posedge clk, posedge rst) 
    begin
        if(rst) pc = 32'h0000_3000; // 32 bits hexidecimal representation
        else pc = pcnew;
    end

endmodule







