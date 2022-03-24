# write 0 in $t0

# in c
# int a;
# a = 0;

.text
.globl main
.ent main

main: and $t1, $0, $0

      li $v0, 10
      syscall
.end main
