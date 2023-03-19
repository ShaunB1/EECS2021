c: DD a
d: DD b

ORG 0x1000100010001000
a: DD 0x2222333344445555
ORG 0x1000100010001100 
b: DD 0x1111222233334444

ld t1, c(x0)
ld t2, d(x0)

add t3, t1, t2
sub t4, t1, t2
or t5, t1, t2
xor t6, t1, t2