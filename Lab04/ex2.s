.data

opa: .word 2043
opb: .word 5
res: .word 0

message: .asciiz "Enter a number:\n1-summation\n2-subtraction\n3-multiplication\n4-division\n\n"
newline: .asciiz "\n"

tab: .word summ, subt, multi, divi

.text
.globl main
.ent main

main:
        lw $t1, opa
        lw $t2, opb

        la $a0, message     # Print message
        li $v0, 4
        syscall

        li $v0, 5           # system call – read integer
        syscall
        move $t0, $v0       # first number

        mul $t0, $t0, 4
        add $t0, $t0, -4

        lw $t3, tab($t0)
        jr $t3

        li $v0, 10
        syscall
        
summ:
        add $t0, $t1, $t2   # opa + opb in $t0
        sw $t0, res         # saving result in memory

        move $a0, $t0       # put register vaule in $a0
        li $v0, 1           # system call – print string
        syscall

        li $v0, 10
        syscall

subt:
        sub $t0, $t1, $t2   # opa - opb in $t0
        sw $t0, res         # saving result in memory

        move $a0, $t0       # put register vaule in $a0
        li $v0, 1           # system call – print string
        syscall

        li $v0, 10
        syscall

multi:
        mul $t0, $t1, $t2   # opa * opb in $t0
        sw $t0, res         # saving result in memory

        move $a0, $t0       # put register vaule in $a0
        li $v0, 1           # system call – print string
        syscall

        li $v0, 10
        syscall

divi:
        div $t0, $t1, $t2   # opa / opb in $t0
        sw $t0, res         # saving result in memory

        move $a0, $t0       # put register vaule in $a0
        li $v0, 1           # system call – print string
        syscall

        li $v0, 10
        syscall

.end main
