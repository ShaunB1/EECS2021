a: DC "Enter a string: \0"

STACK: EQU 0x100000
lui sp, STACK >> 12

addi t0, x0, a

ecall x0, t0, 4
ecall t1, t0, 9

L1: lb t2, 0(t1)
addi sp, sp, -8
sb t2, 0(sp)
addi t1, t1, 1
bne t2, x0, L1

L2: addi sp, sp, 8
lb t3, 0(sp)
ecall x1, t3, 3
bne t3, x0, L2
