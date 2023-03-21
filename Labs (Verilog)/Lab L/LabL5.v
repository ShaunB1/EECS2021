module LabL5;

reg a, b, cin;
wire z, cout;
reg[1:0] expect;
integer i, j, k;

yAdder1 adder(z, cout, a, b, cin);

initial begin

    for(i = 0; i < 2; i = i + 1) begin

        for(j = 0; j < 2; j = j + 1) begin

            for(k = 0; k < 2; k = k + 1) begin

                a = i; b = j; cin = k;
                expect = a + b + cin;

                #1;
                if(expect[1] !== cout || expect[0] !== z) begin
                    $display("FAIL: a = %b b = %b cin = %b cout = %b z = %b", a, b, cin, cout, z);
                end

            end

        end

    end

    $finish;

end


endmodule