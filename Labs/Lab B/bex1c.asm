a: DD 0xAAAABBBBCCCCDDDD
b: DD 0x4444333322221111

ORG 0x0000000000000010

c: DM 8

ORG 0x1000000000000000

lui t1, (a >> 12)
addi t1, t1, a & 0xfff
ld t1, 0(t1)

lui t2, (b >> 12)
addi t2, t2, b & 0xfff
ld t2, 0(t2)

add t0, t1, t2
sd t0, c(x0)

sub t0, t1, t2
sd t0, c+8(x0)

sub t0, t2, t1
sd t0, c+16(x0)

and t0, t1, t2
sd t0, c+24(x0)

or t0, t1, t2
sd t0, c+32(x0)

xor t0, t1, t2
sd t0, c+40(x0)

xori t0, t1, -1
sd t0, c+48(x0)

xori t0, t2, -1
sd t0, c+56(x0)