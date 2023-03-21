module yAlu(z, ex, a, b, op);

    input[31:0] a, b;
    input[2:0] op;
    output[31:0] z;
    output ex;
    wire [31:0] alu_and, alu_or, alu_arith, slt;
    wire cout;

    assign slt = 0; // not supported
    assign ex = 0; // not supported
    
    and and1[31:0](alu_and, a, b);
    or or1[31:0](alu_or, a, b);
    yArith arith1[31:0](alu_arith, cout, a, b, op[2]);
    yMux4to1 #(.SIZE(32)) mux1(z, alu_and, alu_or, alu_arith, slt, op[1:0]);


endmodule