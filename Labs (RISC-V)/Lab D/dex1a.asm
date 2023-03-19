a: DC "n! Enter n: \0"
b: DC " != \0"

addi sp, sp, 0
addi t0, x0, a
addi t1, x0, b

ecall x1, t0, 4 // Enter n:
ecall a0, x0, 5 // Take value

addi a1, x0, 1
jal x1, fact
ecall x0, a1, 0
ebreak x0, x0, 0

fact: blt x0, a0, recu
addi a0, x0, 1 // base case
jalr x0, 0(x1)
recu: addi sp, sp, -8
sd x1, 0(sp)
mul a1, a1, a0
addi a0, a0, -1
jal x1, fact
ld x1, 0(sp)
addi sp, sp, 8
jalr x0, 0(x1)





