a: DD -1, 55, -3, 7, 0

add t1, x0, x0 // counter
ld t0, a(t1)

loop: ld t2, a(t1)
beq t2, x0, exit
blt t1, t2, swap
addi t1, t1, 8
jal x0, loop

swap: add t0, x0, t2
addi t1, t1, 8
jal x0, loop

exit: ebreak x0, x0, 0