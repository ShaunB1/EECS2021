loop: ecall t1, x0, 5
ecall t2, x0, 5
add t0, t1, t2
ecall x0, t0, 0
beq x0, x0, loop