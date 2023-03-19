exp: DC "12+34-*\0"

STACK: EQU 0x100000
lui sp, STACK >> 12

addi t0, x0, exp
addi t1, x0, '+'
addi t2, x0, '-'
addi t3, x0, '*'
addi t4, x0, '/'
addi x9, x0, '0'

L1: lb t5, 0(t0)

beq t5, t1, add
beq t5, t2, sub
beq t5, t3, mul
beq t5, t4, div
beq t5, x0, L2

addi sp, sp, -8
sub t5, t5, x9
sd t5, 0(sp)
addi t0, t0, 1
jal x0, L1

add: ld t6, 0(sp)
ld x8, 8(sp)
addi sp, sp, 16
add t6, t6, x8
addi sp, sp, -8
sd t6, 0(sp)
addi t0, t0, 1
jal x0, L1

sub: ld t6, 0(sp)
ld x8, 8(sp)
addi sp, sp, 16
sub t6, x8, t6
addi sp, sp, -8
sd t6, 0(sp)
addi t0, t0, 1
jal x0, L1

mul: ld t6, 0(sp)
ld x8, 8(sp)
addi sp, sp, 16
mul t6, t6, x8
addi sp, sp, -8
sd t6, 0(sp)
addi t0, t0, 1
jal x0, L1

div: ld t6, 0(sp)
ld x8, 8(sp)
addi sp, sp, 16
div t6, t6, x8
addi sp, sp, -8
sd t6, 0(sp)
addi t6, t6, 8
addi t0, t0, 1
jal x0, L1

L2: ld t6, 0(sp)
addi sp, sp, 8
