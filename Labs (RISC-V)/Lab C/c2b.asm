str1: DC "sampled text\0"

addi a2, x0, str1+6
jal x1, delch1
addi t1, x0, str1
ecall x0, t1, 4
ebreak x0, x0, 0

delch1: lb t0, 0(a2)
loop1: beq t0, x0, exit
lb t0, 1(a2)
sb t0, 0(a2)
addi a2, a2, 1
jal x0, loop1 

exit: jalr x0, 0(x1)