module LabL4;

reg[31:0] a0, a1, a2, a3, expect;
reg[1:0] c;
wire[31:0] z;

yMux4to1 #(.SIZE(32)) mux(z, a0, a1, a2, a3, c);

initial begin
    
    repeat(10) begin

        a0 = $random;
        a1 = $random;
        a2 = $random;
        a3 = $random;
        c = $random % 4;

        if(c === 0) begin
            expect = a0;
        end

        else if(c === 1) begin
            expect = a1;
        end

        else if(c === 2) begin
            expect = a2;
        end

        else begin
            expect = a3;
        end

        #1; 
        if(expect === z) begin
            $display("PASS: a0 = %b a1 = %b a2 = %b a3 = %b \nc = %b z = %b\n", a0, a1, a2, a3, c, z);
        end

        else begin
            $display("FAIL: a0 = %b a1 = %b a2 = %b a3 = %b \nc = %b z = %b\n", a0, a1, a2, a3, c, z);
        end

    end

    $finish;

end

endmodule;