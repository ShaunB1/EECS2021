a: DC "Enter an integer value: \0"
b: DC "Enter a memory address: \0"

addi t1, x0, a
addi t2, x0, b

loop: ecall x1, t1, 4
ecall t3, t3, 5
ecall x1, t2, 4
ecall t4, t4, 5
sd t3, 0(t4)
jal x0, loop
