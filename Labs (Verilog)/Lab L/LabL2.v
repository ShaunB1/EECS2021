module LabL2;

integer i ,j, k;
reg a, b, c, expect;
wire z;

yMux1 mux(z, a, b, c);

initial
begin

    for(i = 0; i < 4; i = i + 1) begin

        for(j = 0; j < 4; j = j + 1) begin 

            for(k = 0; k < 2; k = k + 1) begin

                a = i; b = j; c = k;
                expect = c ? b : a;

                #1
                if(expect === z) begin
                    $display("PASS: a = %b b = %b c = %b z = %b", a, b, c, z);
                end

                else begin
                    $display("FAIL: a = %b b = %b c = %b z = %b", a, b, c, z);
                end

            end

        end

    end

    $finish;

end

endmodule