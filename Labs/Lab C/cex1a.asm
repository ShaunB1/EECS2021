a: DC "Enter an unsigned integer: \0"

STACK: EQU 0x100000
lui sp, STACK >> 12

addi t0, x0, a

add t4, t4, x0
ecall x1, t0, 4
ecall t1, x0, 5

loop1: 
andi t2, t1, 1
sd t2, 0(sp)
addi sp, sp, -8
srli t1, t1, 1
addi t4, t4, 1
bne t1, x0, loop1

loop2: addi sp, sp, 8
ld t3, 0(sp)
ecall x1, t3, 0
addi t4, t4, -1
bne t4, x0, loop2

