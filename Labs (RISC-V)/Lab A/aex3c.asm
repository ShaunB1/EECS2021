addi t1, x0, 0x123
andi t2, t1, 0x00f
srli t1, t1, 4
slli t2, t2, 60
or t0, t1, t2