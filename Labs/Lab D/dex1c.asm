a: DC "Find all divisors. \0"
b: DC "Enter i: \0"
c: DC "Divisors:\0"

addi sp, x0, 0
addi t0, x0, a
addi t1, x0, b
addi t2, x0, c
addi t3, x0, 1

ecall x0, t0, 4
ecall x1, t1, 4
ecall a2, x0, 5
ecall x0, t2, 4

jal x1, divisor
ebreak x0, x0, 0

divisor: blt a2, t3, exit
rem t4, a2, t3
bne t4, x0, loop
ecall x0, t3, 0
addi t3, t3, 1
jal x0, divisor

loop: addi t3, t3, 1
jal x0, divisor

exit: jalr x0, 0(x1)








