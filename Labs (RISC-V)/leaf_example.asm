STACK: EQU 0x100000

leaf_example:
addi sp, sp, -24
sd t0, 16(sp)
sd t1, 8(sp)
sd x20, 0(sp)

add t0, x10, x11
add t1, x12, x13
sub x20, t0, t1
addi x10, x20, 0

ld x20, 0(sp)
ld t1, 8(sp)
ld t0, 0(sp)
addi sp, sp, 24

jalr x0, 0(x1)