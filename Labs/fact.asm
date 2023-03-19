STACK: EQU 0x100000
lui sp, STACK >> 12

fact: addi sp, sp, -16
sd x1, 8(sp)
sd x10, 0(sp)
addi t0, x10, -1
bge t0, x0, L1
addi x10, x0, 1
addi sp, sp, 16
jalr x0, 0(x1)

L1: addi, x10, x10 -1
jalr x1, fact
add t1, x10, x0
ld x10, 0(sp)
ld x1, 8(sp)
addi sp, sp, 16
mul x10, t1, x10
jalr x0, 0(x1)
