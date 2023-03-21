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