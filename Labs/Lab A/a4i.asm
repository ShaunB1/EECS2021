c: EQU 0x1234567811223344

lui t1, (c & 0xffffffff) > 12
addi t1, t1, c & 0xfff
lui t2, c >> 44
addi t2, t2, (c & 0xfff00000000) >> 32
slli t2, t2, 32
or t0, t1, t2