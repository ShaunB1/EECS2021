str1: DC "sampled text\0"
STACK: EQU 0x100000
lui sp, STACK >> 12

addi a2, x0, str1+6
addi a3, x0, 6
jal x1, delch
addi t0, x0, str1
ecall x0, t0, 4
ebreak x0, x0, 0

delch: addi sp, sp, -24
sd x1, 16(sp)
sd s0, 8(sp)
sd s1, 0(sp)
addi s0, a2, 0
addi s1, a3, 0
bge x0, s1, exit
loop1: jal x1, delch1
addi a2, s0, 0
addi s1, s1, -1
bne s1, x0, loop1
jal x0, exit

delch1: lb t1, 0(a2)
loop2: beq t1, x0, exit2
lb t1, 1(a2)
sb t1, 0(a2)
addi a2, a2, 1
jal x0, loop2

exit: ld s1, 0(sp)
ld s0, 8(sp)
ld x1, 16(sp)
addi sp, sp, 24
jalr x0, 0(x1)

exit2: jalr x0, 0(x1)
