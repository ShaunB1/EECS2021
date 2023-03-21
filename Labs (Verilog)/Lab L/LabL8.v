module LabL8;

reg signed[31:0] a, b, expect;
reg signed ctrl;
wire signed[31:0] z;
wire signed cout;

yArith arith(z, cout, a, b, ctrl);

    initial begin

        repeat(10) begin

            a = $random;
            b = $random;
            ctrl = $random % 2;
            
            expect = ctrl ? (a - b) : (a + b);

            #1;
            if(expect === z) begin
                $display("PASS: a = %b b = %b cin = %b z = %b", a, b, ctrl, z);
            end

            else begin
                $display("FAIL: a = %b b = %b cin = %b z = %b", a, b, ctrl, z);
            end

        end

        $finish;

    end

endmodule