module labK;

reg flag, a, b, c, expect;
integer i, j, k;

parameter MISSING_ARG_1 = 0;
parameter MISSING_ARG_2 = 0;
parameter MISSING_ARG_3 = 0;

not notc(notOutput1, c);
and and1(notOutput2, a, notOutput1);
and and2(notOutput3, c, b);
or or1(z, notOutput2, notOutput3);

assign lowerInput = notOutput1;
assign zUpperInput = notOutput2;
assign zLowerInput = notOutput3;

initial
begin

    flag = $value$plusargs("a=%b", a);
    flag = $value$plusargs("b=%b", b);
    flag = $value$plusargs("c=%b", c);

    if(flag == "") begin
        $display("ERROR: Missing arguments.");
    end
    else begin
        #1 $display("a = %b, b = %b, c = %b z = %b", a, b, c, z);
    end

    // bitwise operators
    //#1 expect = (a & ~c) | (c & b);

    // logical operators
    #1 expect = (a && !c) || (c && b);

    if(expect === z) begin
        $display("PASS: a = %b, b = %b, c = %b z = %b", a, b, c, z);
        $finish;
    end
    else begin
        $display("FAIL: a = %b, b = %b, c = %b z = %b", a, b, c, z);
        $finish;
    end
    
    $finish;

end

endmodule
