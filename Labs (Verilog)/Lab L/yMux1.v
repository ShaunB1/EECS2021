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