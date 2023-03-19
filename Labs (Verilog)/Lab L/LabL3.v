module LabL2;

reg[31:0] a, b, expect;
reg c;
wire[31:0] z;
integer i ,j, k;

yMux #(.SIZE(32)) mux(z, a, b, c);

initial
begin

    repeat(500)
    begin

        a = $random;
        b = $random;
        c = $random % 2;
        #1;

        expect = c ? b : a;

        if(expect === z) begin
            $display("PASS: a = %b b = %b c = %b z = %b", a, b, c, z);
        end

        else begin
            $display("PASS: a = %b b = %b c = %b z = %b", a, b, c, z);
        end

    end

    $finish;

end

endmodule