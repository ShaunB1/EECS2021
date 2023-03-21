module yAlu(z, ex, a, b, op);

    input[31:0] a, b;
    input[2:0] op;
    output[31:0] z;
    output ex;
    wire [31:0] alu_and, alu_or, alu_arith, slt, tmp;
    wire cout;

    assign slt[31:1] = 0; // upper bits are always 0
    assign ex = 0; // not supported for now

    xor(condition, a[31], b[31]);
    assign tmp = a - b;
    yMux #(.SIZE(1)) slt_mux(slt[0], tmp[31], a[31], condition);
    
    and and1[31:0](alu_and, a, b);
    or or1[31:0](alu_or, a, b);
    yArith arith1[31:0](alu_arith, cout, a, b, op[2]);
    yMux4to1 #(.SIZE(32)) mux1(z, alu_and, alu_or, alu_arith, slt, op[1:0]);

endmodule