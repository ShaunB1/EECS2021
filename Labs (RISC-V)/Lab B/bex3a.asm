a: DC "What is your name?"
b: DC "Hello "
c: DC "!"

addi t1, x0, a
addi t2, x0, b
addi t3, x0, c

ecall x0, t1, 4
ecall t4, t4, 8

ecall x1, t2, 4 // Hello
ecall x1, t4, 3 // name
ecall x1, t3, 4 // !
