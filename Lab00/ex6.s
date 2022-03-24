# reading 2 values from memory, adding and writing them back
# in c
# int opd1, opd2, result;
# result = opd1 + opd2;

.data

opd1:   .word 0x00005678
opd2:   .word 0x12340000
result: .space 4

.text
.globl main
.ent main

main: la$t0, opd1
      lw$t1, ($t0)
      la$t0, opd2
      lw$t2, ($t0)
      add$t3, $t1, $t2
      la$t0, result
      sw$t3, ($t0)
      li$v0, 10
      syscall
.end main
