str1: DC "sampled text\0 "
str2: DC " new\0 "
STACK: EQU 0x100000 ;stack
lui sp, STACK>>12
addi a2, x0, str1+7 ;chaddr
addi a3, x0, str2 ;chaddr
jal x1, insch
addi x6, x0, str1 ;output
ecall x0, x6, 4
ebreak x0, x0, 0 ;finish 

insch1: lb x5, 0(a2)
sb a3, 0(a2)
addi a3, x5, 0
addi a2, a2, 1
bne a3, x0, insch1
sb a3, 0(a2)
jalr x0, 0(x1) 

insch: addi t6, x1, 0
addi s0, a2, 0
addi s1, a3, 0

loop3: lb a3, 0(s1)
beq a3, x0, end3
jal x1, insch1
addi s0, s0, 1
addi a2, s0, 0
addi s1, s1, 1
beq x0, x0, loop3

delch: addi s0, a2, 0
addi s1, a3, 0
bge x0, s1, exit
loop1: jal x1, delch1
addi a2, s0, 0
addi s1, s1, -1
bne s1, x0, loop1
jal x0, exit

delch1: lb t1, 0(a2)
loop2: beq t1, x0, end3
lb t1, 1(a2)
sb t1, 0(a2)
addi a2, a2, 1
jal x0, loop2

end3: jalr x0, 0(t6) ;return 

