module labK;

reg a, b, c, expect;
integer i, j, k;

not notc(notOutput1, c);
and and1(notOutput2, a, notOutput1);
and and2(notOutput3, c, b);
or or1(z, notOutput2, notOutput3);

assign lowerInput = notOutput1;
assign zUpperInput = notOutput2;
assign zLowerInput = notOutput3;

initial
begin

    for(i = 0; i < 2; i = i + 1)
    begin

        for(j = 0; j < 2; j = j + 1)
        begin

            for(k = 0; k < 2; k = k + 1)
            begin

                a = i; b = j; c = k;

                #1 expect = (a & ~c) | (c & b);

                if(expect === z) begin
                    $display("PASS: a = %b, b = %b, c = %b z = %b", a, b, c, z);
                    $finish;
                end
                else begin
                    #1 $display("FAIL: a = %b, b = %b, c = %b z = %b", a, b, c, z);
                    $finish;
                end

            end

        end

    end
    $finish;

end

endmodule
