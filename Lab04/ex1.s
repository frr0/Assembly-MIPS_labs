.data
message: .asciiz "Text Test\n"
newline: .asciiz "\n"

array: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
.ent main

main:

    li $t1, 0
    li $t2, 1

    li $t4, 0

    j loop_to_print

loop:

    add $t3, $t1, $t2   # t0 +t1 

    bgt  $t0, 20, main # if $t0 is > than 15 exit
    addi $t0, $t0, 1   # t0++

    mul $t4, $t0, 4
    # add $t4, $t0, -4

    #move array($t4), $t2
    #sw $s0, 4($t2)
    lw $t2, array($t4)

    j loop

loop_to_print:

    bgt  $t0, 20, exit # if $t0 is > than 15 exit
    addi $t0, $t0, 1   # t0++

    mul $t4, $t0, 4
    # add $t4, $t0, -4

    move $a0, array($t4)       # put register vaule in $a0
    li $v0, 1           # system call – print string
    syscall

    # move $t2, array($t3)

    j loop_to_print

exit:

    li $v0, 10
    syscall

.end main
