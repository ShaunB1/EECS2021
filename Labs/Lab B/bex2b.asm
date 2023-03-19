a: DD 121, 33, -5, 242, -45, -12, 0

add t1, x0, x0 // counter
ld t0, a(t1)

loop: ld t2, a(t1)
beq t2, x0, exit
blt t2, t0, swap
addi t1, t1, 8
jal x0, loop

swap: add t0, x0, t2
addi t1, t1, 8
jal x0, loop

exit: ebreak x0, x0, 0