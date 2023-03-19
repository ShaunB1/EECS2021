b20: EQU 6146 >> 12
b12: EQU 6146 & 0xfff

lui t1, b20 + 1
addi t1, t1, b12
addi t2, x0, 3
add t0, t1, t2