module yMux1(z, a, b, c);

    input a, b, c;
    output z;
    wire notC, upper, lower;

    not not1(notC, c);
    and and1(upper, a, notC);
    and and2(lower, c, b);
    or or1(z, upper, lower);

endmodule

module yMux(z, a, b, c);

    parameter SIZE = 2;
    output[SIZE-1:0] z;
    input[SIZE-1:0] a, b;
    input c;

    yMux1 mine[SIZE-1:0](z, a, b, c);

endmodule

module yMux4to1(z, a0, a1, a2, a3, c);

    parameter SIZE = 2;
    output[SIZE-1:0] z;
    input[SIZE-1:0] a0, a1, a2, a3;
    input[1:0] c;
    wire[SIZE-1:0] zLo, zHi;

    yMux #(SIZE) lo(zLo, a0, a1, c[0]);
    yMux #(SIZE) hi(zHi, a2, a3, c[0]);
    yMux #(SIZE) final(z, zLo, zHi, c[1]);

endmodule

module yAdder1(z, cout, a, b, cin);

    input a, b, cin;
    output z, cout;

    xor xor1(upper1, a, b);
    xor xor2(z, cin, upper1);
    and and1(lower1, a, b);
    and and2(lower2, upper1, cin);
    or or1(cout, lower2, lower1);

endmodule

module yAdder(z, cout, a, b, cin);

    output[31:0] z;
    output cout;
    input[31:0] a, b;
    input cin;
    wire[31:0] in, out;

    yAdder1 mine[31:0](z, out, a, b, in);

    assign in[0] = cin;
    assign in[31:1] = out[30:0];
    assign cout = out[31];

endmodule

module yArith(z, cout, a, b, ctrl);

    // add if ctrl = 0, subtract if ctrl = 1
    output signed[31:0] z;
    output cout;
    input signed[31:0] a, b;
    input ctrl;
    wire signed[31:0] notB, tmp;
    wire cin;

    yMux #(.SIZE(32)) mux(tmp, b, notB, cin);
    not not1[31:0](notB, b);
    yAdder adder(z, cout, a, tmp, ctrl);
    assign cin = ctrl;
    
endmodule

module yAlu(z, ex, a, b, op);

    /* 
    op = 000: z = a & b
    op = 001: z = a | b
    op = 010: z = a + b
    op = 110: z = a - b
    */

    input[31:0] a, b;
    input[2:0] op;
    output[31:0] z;
    output ex;
    wire [31:0] alu_and, alu_or, alu_arith, slt, tmp;
    wire cout;
    
    wire [15:0] z16;
    wire [7:0] z8;
    wire [3:0] z4;
    wire [1:0] z2;
    wire z1, z0;

    assign slt[31:1] = 0; // upper bits are always 0
    assign ex = 0; // not supported for now

    or or16[15:0](z16, z[15:0], z[31:16]);
    or or8[7:0](z8, z16[7:0], z16[15:8]);
    or or4[3:0](z4, z8[3:0], z8[7:4]);
    or or2[1:0](z2, z4[1:0], z4[3:2]);
    or or1(z1, z2[0], z2[1]);
    not ex_not(z0, z1);
    assign ex = z0;

    xor(condition, a[31], b[31]);
    assign tmp = a - b;
    yMux #(.SIZE(1)) slt_mux(slt[0], tmp[31], a[31], condition);
    
    and and1[31:0](alu_and, a, b);
    or my_or[31:0](alu_or, a, b);
    yArith arith1[31:0](alu_arith, cout, a, b, op[2]);
    yMux4to1 #(.SIZE(32)) mux1(z, alu_and, alu_or, alu_arith, slt, op[1:0]);

endmodule

module yIF(ins, PCp4, PCin, clk);

    output[31:0] ins, PCp4;
    input[31:0] PCin;
    input clk;
    wire ex;
    wire[31:0] regOut;

    // build and connect the circuit
    register #(32) my_reg(regOut, PCin, clk, 1'b1);
    yAlu my_alu(PCp4, ex, 4, regOut, 3'b010);
    mem my_mem(ins, regOut, , clk, 1'b1, 1'b0);

endmodule
