module yMux2(z, a, b, c);

input[1:0] a, b;
input c;
output[1:0] z;

yMux1 mux1(z[0], a[0], b[0], c);
yMux1 mux2(z[1], a[1], b[1], c);

endmodule