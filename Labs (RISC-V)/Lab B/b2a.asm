src: DD -3

ld t0, src(x0)
bge t0, x0, skip
sub t0, x0, t0

skip: sd t0, dst(x0)
ebreak x0, x0, 0

dst: DM 1