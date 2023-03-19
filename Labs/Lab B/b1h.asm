ORG 0x10000000

c: DD 0x1234567811223344

lui t1, c >> 12
addi t1, t1, c & 0xfff
ld t0, 0(t1)