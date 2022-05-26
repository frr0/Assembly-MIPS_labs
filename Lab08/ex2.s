.data

vect:     .word 13, 1000, 2020, 1600
bise:     .asciiz "bisestile"
seco:     .asciiz "secolare"
bi_se:    .asciiz "bisestile e secolare"
null:     .asciiz "null"
space:    .asciiz " "
newline:  .asciiz "\n"

.text
.globl main
.ent main
main:

          subu $sp, $sp, 4
          sw $ra, ($sp)

          la $a0, vect
          # indirizzo di ora_out
          jal bisestile

          lw $ra, ($sp)
          addu $sp, $sp, 4
          jr $ra

.end main

.ent bisestile

bisestile:

          li $t6, 16

          li $t7, 0
          # lb $t1, vect($t0)

          # addi $t0, $t0, 4
          # lb $t2, vect($t0)

          # addi $t0, $t0, 4
          # lb $t3, vect($t0)

          # addi $t0, $t0, 4
          # lb $t4, vect($t0)

          lw $t0, vect($t7)
          j divide_100
pre: 

          addi $t7, $t7, 4
          beq $t7, $t6, done
          lw $t0, vect($t7)

divide_100:

          li $t1, 100
          divu $t0, $t1
          mfhi $t3
          beq $0, $t3 divide_400
          j divide_4

divide_400:

          li $t1, 400
          divu $t0, $t1
          mfhi $t3
          beq $0, $t3 print_b
          j print_null

divide_4:

          li $t1, 4
          divu $t0, $t1
          mfhi $t3
          beq $0, $t3 print_b
          j print_null


print_b:

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    la $a0, bise
    li $v0, 4
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    j pre

print_null:

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    la $a0, null
    li $v0, 4
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    j pre

done: 
    
    jr $ra

.end bisestile
