module yArith(z, cout, a, b, ctrl);

    // add if ctrl = 0, subtract if ctrl = 1
    output[31:0] z;
    output cout;
    input[31:0] a, b;
    input ctrl;
    wire[31:0] notB, tmp;
    wire cin;

    yMux #(.SIZE(32)) mux(tmp, b, notB, cin);
    not not1[31:0](notB, b);
    yAdder adder(z, cout, a, tmp, ctrl);
    assign cin = ctrl;
    
endmodule