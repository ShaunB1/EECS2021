a: DD c
ORG 0x1000000000000000
c: DD 0x1234567811223344

ld t1, a(x0)
ld t0, 0(t1)