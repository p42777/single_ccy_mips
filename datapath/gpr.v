module gpr(RegWr, ra, rb, rw, busW, clk, rst, busA, busB, Data_in);
    
    input clk, rst, RegWr;
    input [31:0] busW;
    input [4:0] ra, rb, rw;
    output [31:0] busA, busB, Data_in;

    reg [31:0]regi[31:0];

    // reset
    integer i;
    always@(posedge rst)
    begin
        if(rst)
            for(i=0; i<32; i++)
                regi[i] = 0;
    end

    // set busA & busB
    assign busA = regi[ra];
    assign busB = regi[rb];
    assign Data_in = busB;

    // register write in 
    always@(posedge clk)
    begin
        if(RegWr) begin
            regi[rw] <= busW;
            reg[0] <= 0; // can't write in reg[0]
        end
    end
   
endmodule

