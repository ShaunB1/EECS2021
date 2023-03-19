// Name: Shaun Bautista
// ID: 218750935

module labK;

reg a, b, cin;
reg [1:0] expect;
integer i, j, k;

xor xor1(notOutput1, b, a);
and and1(notOutput2, b, a);
xor xor2(z, cin, notOutput1);
and and2(notOutput3, notOutput1, cin);
or or1(cout, notOutput3, notOutput2);

assign lowerInput1 = notOutput1;
assign lowerInput2 = notOutput2;
assign upperInput1 = notOutput3;

initial 
begin
    
    for(i = 0; i < 2; i = i + 1) begin

        for(j = 0; j < 2; j = j + 1) begin

            for(k = 0; k < 2; k = k + 1) begin

                a = i; b = j; cin = k;

                expect[0] = (b ^ a) ^ cin;
                expect[1] = ((b ^ a) & (cin)) | ((b & a));

                if(expect[0] === z && expect[1] === cout) begin
                    #1 $display("PASS: a = %b b = %b cin = %b z = %b", a, b, cin, z);                    
                    $finish;
                end

                else begin
                    #1 $display("PASS: a = %b b = %b cin = %b z = %b", a, b, cin, z);
                    $finish;
                end

            end

        end

    end
    $finish;

end


endmodule
