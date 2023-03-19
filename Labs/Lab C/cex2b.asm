string1: DC "sampled text\0"
string2: DC "r\0"
STACK: EQU 0x100000
lui sp, STACK >> 12

addi a2, x0, string1+6 // starting character
addi a3, x0, 1 // number of char to substitute
addi a4, x0, string2
lb a4, 0(a4)
jal x1, subch
addi a2, x0, string1
ecall x0, a2, 4
ebreak x0, x0, 0

subch: addi sp, sp, -32
sd x1, 0(sp)
sd t0, 8(sp)
sd t1, 16(sp)
sd t3, 24(sp)
add t0, x0, a2
add t1, x0, a3
add t3, x0, a4
bge x0, t1, exit
loop1: lb t2, 0(a2)
beq t1, x0, exit
lb t2, 1(a2)
sb t3, 0(a2)
addi a2, a2, 1
addi t1, t1, -1
jal x0, loop1

exit: ld x1, 0(sp)
ld t0, 8(sp)
ld t1, 16(sp)
jalr x0, 0(x1)
