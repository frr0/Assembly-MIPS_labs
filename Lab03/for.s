.data
message: .asciiz "Text Test\n"
newline: .asciiz "\n"

.text
.globl main
.ent main

main:

    li $t0,0

loop:

    bgt  $t0, 15, exit # if $t0 is > than 15 exit
    addi $t0, $t0, 1   # t0++

    la $a0, message
    li $v0, 4
    syscall

    j loop

exit:

    li $v0, 10
    syscall

.end main
