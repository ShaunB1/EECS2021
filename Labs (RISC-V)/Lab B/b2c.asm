src: DD -1, 5, -3, 7, 0

add t1, x0, x0

loop: ld t0, src(t1)
beq t0, x0, end
bge t0, x0, skip
sub t0, x0, t0

skip: sd t0, dst(t1)
addi t1, t1, 8
beq x0, x0, loop

end: ebreak x0, x0, 0

dst: DM 1