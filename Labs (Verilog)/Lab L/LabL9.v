module LabL9;

    reg[31:0] a, b;
    reg[31:0] expect;
    reg[2:0] op;
    wire ex;
    wire[31:0] z;
    reg ok = 0, flag;
    reg [1*7:0] operator;

    yAlu alu(z, ex, a, b, op);

    initial begin
        
        repeat(100) begin

            a = $random;
            b = $random;
            //flag = $value$plusargs("op = %d", op);
            op = $random%7;

            // The oracle: computer "expect" based on "op"
            // Compare the circuit's output with "expect"
            // and set "ok" accordingly
            // Display ok and the various signals

            #1;

            if(op === 3'b000) begin // op = 0
                
                expect = a & b;
                operator = "&";

                #1;
                ok = (expect === z) ? 1 : 0;

                if(ok) begin
                    $display("PASS (AND): a = %b b = %b a%sb = %b", a, b, operator, z);
                end

                else begin
                    $display("FAIL (AND): a = %b b = %b a%sb = %b", a, b, operator, z);
                end
                
            end

            else if(op == 3'b001) begin // op = 1
                
                expect = a | b;
                operator = "|";
                
                #1;
                ok = (expect === z) ? 1 : 0;

                if(ok) begin
                    $display("PASS (OR): a = %b b = %b a%sb = %b", a, b, operator, z);
                end

                else begin
                    $display("FAIL (OR): a = %b b = %b a%sb = %b", a, b, operator, z);
                end

            end

            else if(op == 3'b010) begin // op = 2
                
                expect = a + b;
                operator = "+";

                #1;
                ok = (ok) ? 1 : 0;

                if(expect === z) begin
                    $display("PASS (ADD): a = %b b = %b a%sb = %b", a, b, operator, z);
                end
                
                else begin
                    $display("FAIL (ADD): a = %b b = %b a%sb = %b", a, b, operator, z);
                end

            end

            else if(op == 3'b110) begin // op = 6

                expect = a - b;
                operator = "-";

                #1;
                ok = (expect === z) ? 1 : 0;

                if(ok) begin
                    $display("PASS (SUB): a = %b b = %b a%sb = %b", a, b, operator, z);
                end

                else begin
                    $display("FAIL (SUB): a = %b b = %b a%sb = %b", a, b, operator, z);
                end
                
            end



        end

        $finish;

    end

endmodule