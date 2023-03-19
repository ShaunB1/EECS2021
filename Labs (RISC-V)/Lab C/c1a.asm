a: DC "Number of integers: \0"
b: DC "Int: \0"

STACK: EQU 0x100000
lui sp, STACK >> 12

addi t0, x0, a
addi t1, x0, b
addi t2, x0, 1

ecall x1, t0, 4
ecall t3, x0, 5

loop1: ecall x1, t1, 4
ecall t4, x0, 5
sd t4, 0(sp)
addi sp, sp, -8
addi t2, t2, 1
bge t3, t2, loop1 // loops until user has inputted necessary number of int

loop2: beq t4, x0, exit
ecall x1, t1, 4
addi sp, sp, 8
ld t4, 0(sp)
ecall x0, t4, 0
addi t4, t4, -1
jal x0, loop2

exit: ebreak x0, x0, 0
