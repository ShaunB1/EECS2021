// addi: I-format
// srli: I-format
// slli: I-format
// sub: R-format

addi t1, x0, 888
srli t1, t1, 3
addi t2, x0, 123
slli t2, t2, 2
sub t0, t1, t2
slli t0, t0, 1