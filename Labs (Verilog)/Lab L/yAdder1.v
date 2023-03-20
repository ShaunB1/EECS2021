module yAdder1(z, cout, a, b, cin);

input a, b, cin;
output z, cout;

xor xor1(upper1, a, b);
xor xor2(z, cin, upper1);
and and1(lower1, a, b);
and and2(lower2, upper1, cin);
or or1(cout, lower2, lower1);

endmodule