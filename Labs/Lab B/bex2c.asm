a: DD 1, 5, -7, 23, -5
b: DD 3, -2, 4, 11, -7

c: DM 5

add t1, x0, x0
addi t4, x0, 5

loop: beq t4, x0, exit
ld t2, a(t1)
ld t3, b(t1)
add t0, t2, t3
sd t0, c(t1)
addi t1, t1, 8
addi t4, t4, -1
jal x0, loop

exit: ebreak x0, x0, 0
