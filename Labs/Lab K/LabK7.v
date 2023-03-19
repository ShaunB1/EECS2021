// Name: Shaun Bautista
// ID: 218750935

module labK;

reg flag, a, b, c;
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

    if(flag == "")
        $display("ERROR: Missing arguments.");
    else 
        #1 $display("a = %b, b = %b, c = %b z = %b", a, b, c, z);
    
    $finish;

end

endmodule
