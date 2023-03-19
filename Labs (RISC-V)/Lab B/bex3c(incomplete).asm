dir:	DC "John"
	DC "11111"
	DC "Nick"
	DC "22222"
	DC "Sara"
	DC "11111"
	DC "Nick"
	DC "33333"
	DD 0

a: DC "Enter a phone or a name to search for: \0"
addi t1, x0, a
add t3, x0, x0

loop: ecall x1, t1, 4
ecall t2, t2, 8

exit: ebreak x0, x0, 0


