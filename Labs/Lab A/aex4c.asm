lui t1, (23456 >> 12) + 1
addi t1, t1, 23456 & 0xfff

lui t2, (12345 >> 12)
addi t2, t2, (12345 & 0xfff)

sub t0, t1, t2