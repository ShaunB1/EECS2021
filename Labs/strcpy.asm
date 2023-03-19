STACK: EQU 0x100000
lui sp, STACK >> 12

strcpy: add sp, sp, -8
sd x19, 0(sp)
addi x19, x0, 0

L1: add t0, x19, x11
lbu t1, 0(t0)
add t2, x19, x10
sb t1, 0(t2)
beq t1, x0, L2
addi x19, x19, 1
jal x0, L1

L2: ld x19, 0(sp)
addi sp, sp, 8
jalr x0, 0(x1)
