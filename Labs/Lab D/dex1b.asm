a: DC "Enter n: \0"
addi sp, x0, 0

addi t0, x0, a

ecall x1, t0, 4
ecall a0, x0, 5

addi a1, x0, 0 // accumulator
jal x1, sum
ecall x0, a1, 0
ebreak x0, x0, 0

sum: blt x0, a0, recu
jalr x0, 0(x1)
recu: addi sp, sp, -8
sd x1, 0(sp)
addi a0, a0, -1
add a1, a1, a0
jal x1, sum
ld x1, 0(sp)
addi sp, sp, 8
jalr x0, 0(x1)
