// addi: I-format
// slli: I-format
// srli: I-format

addi t1, x0, 0x123 // add constant to t1
slli t2, t1, 56 // shift t1 56 bits to the left and store in t2
srli t0, t2, 60 // shift t2 60 bits to the right