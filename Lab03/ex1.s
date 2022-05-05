.data

message: .asciiz "Enter a char:" 
space:   .asciiz " "
newline: .asciiz "\n"

.text
globl main
.ent main

main: 

    li $t0,0

loop:

    bgt  $t0, 15, exit # if $t0 is > than 15 exit
    addi $t0, $t0, 1   # t0++

    la $a0, message
    li $v0, 4
    syscall

    li $v0, 12 
    syscall
    move $t1, $v0

    move $a0, $t1       # put register vaule in $a0
    li $v0, 11
    syscall

    j loop

.end main
