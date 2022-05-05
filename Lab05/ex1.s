.data

var: .word 3141592653
NUM = 10
n = 4

.text
.globl main
.ent main

main:

li $t0, 0
li $t1, 0
lw $t2, var
li $t3, NUM
j get

get:
      divu $t2, $t3
      mflo $s2
      mfhi $s3

      # insert in the stack
      subu $sp, $sp, 4
      sw $s3, ($sp)

      addi $t1, $t1, 1
      move $t2, $s2
      bne $s2, $t0, get

print:
      # extract from the stack
      lw $t5, ($sp)
      addu $sp, $sp, 4
      addi $t5, $t5, '0'

      move $a0, $t5
      li $v0, 11
      syscall

      addi $t0, $t0, 1
      beq $t0, $t1, done
      j print

done:
      
      li $v0, 10
      syscall

.end main
