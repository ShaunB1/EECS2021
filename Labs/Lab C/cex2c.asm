string1: DC "sample string              \0"
string2: DC "append\0"
STACK: EQU 0x100000
lui sp, STACK >> 12

addi a2, x0, string1+13
addi a3, x0, string2
jal x1, lench
ecall x0, s2, 0
jal x1, appch
addi t0, x0, string1
ecall x0, t0, 4
ebreak x0, x0, 0

lench: addi sp, sp, -24
sd x1, 16(sp)
sd t0, 8(sp)
sd t1, 0(sp)
addi t0, a3, 0 // t0 = string2
addi s2, x0, 0 // counter
loop1: lb t1, 0(t0) // load first char
beq x0, t1, exit1
addi t0, t0, 1
addi s2, s2, 1
jal x0, loop1

exit1: ld x1, 16(sp)
ld t0, 8(sp)
ld t1, 0(sp)
addi sp, sp, 24
jalr x0, 0(x1) // s2 stores the size of the string

appch: addi sp, sp, -24
sd x1, 0(sp)
sd t0, 8(sp)
sd t1, 16(sp)
loop2: lb t1, 0(a3)
beq s2, x0, exit2
beq t1, x0, exit2
addi t0, a2, 0
sb t1, 0(a2)
addi a2, a2, 1
addi a3, a3, 1
addi s2, s2, -1
jal x0, loop2

exit2: ld x1, 0(sp)
ld t0, 8(sp)
ld t1, 16(sp)
addi sp, sp, 24
jalr x0, 0(x1)
