module yMux1(z, a, b, c);

output z;
input a, b, c;
integer i, j, k;

wire notC, upper, lower;

not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);

endmodule

module LabL1;

reg a, b, c, expect;
wire z;
integer i, j, k;

yMux1 mux(z, a, b, c);


initial
begin
    
    for(i = 0; i < 2; i = i + 1) begin

        for(j = 0; j < 2; j = j + 1) begin

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