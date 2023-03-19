a: DF 1.0
b: DF -1.0
c: DF 2.0

ecall f3, x0, 6
ecall x5, x0, 5

fld f1, a(x0)
fld f2, b(x0)
fld f31, c(x0)

addi x2, x0, 1

fadd.d f4, f3, f1
fadd.d f5, f0, f1

loop: beq x5, x0, end
addi x5, x5, -1
fadd.d f6, f4, f5
fdiv.d f7, f6, f31
fmul.d f8, f7, f7
flt.d x1, f3, f8
beq x1, x2, high
beq x1, x0, low
	
high: fadd.d f4, f0, f7
beq x0, x0, loop

low: fadd.d f5, f0, f7
beq x0, x0, loop

end: ebreak x0, x0, 0