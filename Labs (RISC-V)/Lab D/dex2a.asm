a: DF 1.21, 5.85, -7.3, 23.1, -5.55
b: DF 3.14, -2.1, 44.2, 11.0, -7.77

c: DM 5

addi t0, x0, 0
addi t1, x0, 5

loop: beq t1, x0, exit
fld f2, a(t1)
fld f3, b(t1)
fmul.d f4, f2, f3
fsd f4, c(t0)
addi t0, t0, 8
addi t1, t1, -1
jal x0, loop

exit: ebreak x0, x0, 0