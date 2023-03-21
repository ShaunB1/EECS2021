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
            
            #1;

            if(op === 3'b000) begin // op = 0
                expect = a & b;
                operator = "&";
            end

            else if(op == 3'b001) begin // op = 1
                expect = a | b;
                operator = "|";
            end

            else if(op == 3'b010) begin // op = 2
                expect = a + b;
                operator = "+";
            end

            else if(op == 3'b110) begin // op = 6
                expect = a - b;
                operator = "-";
            end

            #1;

            // Compare the circuit's output with "expect"
            // and set "ok" accordingly
            ok = (expect === z) ? 1 : 0;

            // Display ok and the various signals
            if(ok) begin
                $display("PASS: a = %b b = %b a%sb = %b", a, b, operator, z);
            end

            else begin
                $display("FAIL: a = %b b = %b a%sb = %b", a, b, operator, z);
            end

        end

        $finish;

    end

endmodule