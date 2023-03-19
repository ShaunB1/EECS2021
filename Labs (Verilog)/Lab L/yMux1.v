module yMux1(z, a, b, c);

input a, b, c;
output z;
wire notC, upper, lower;

not not1(notC, c);
and and1(upper, a, notC);
and and2(lower, c, b);
or or1(z, upper, lower);

endmodule