.data

message:   .asciiz "Enter a string: "
newline:   .asciiz "\n"
w:         .asciiz "\n\n Not palindrome!\n"
o:         .asciiz "\n\n Palindrome!\n"

.text
.globl main
.ent main

main:

      la $a0, message
      li $v0, 4
      syscall

      li $t0, 0
      li $t1, 0

      # space
      li $t5, 10

      move $t9, $sp

read:

      li $v0, 12
      syscall

      # t1 = counter
      addi $t1, $t1, 1

      # insert in the stack
      subu $sp, $sp, 4
      sw $v0, ($sp)

      # cycle 
      bne $v0, '\n', read
      addu $sp, $sp, 4
      addi $t1, $t1, -1

pali: 

      # get from the stack
      
      # go to the first item with t9 and to the last to avoid \n 
      addi $t9, $t9, -4 
      lw $t3, ($t9)
      lw $t4, ($sp)
      addi $sp, $sp, 4 

      # cycle 
      addi $t1, $t1, -2
      bne $t3, $t4, wrong
      bgt $t1, $0, pali
      j ok


wrong:
        
      la $a0, w
      li $v0, 4
      syscall
      j done

ok:
        
      la $a0, o
      li $v0, 4
      syscall
      j done

done:
      
      li $v0, 10
      syscall

.end main









#     print:
#   
#     # get address from the stack and convert to an integer
#     lw $t4, ($sp)
#     addu $sp, $sp, 4
#     addi $t4, $t4, '0'

#     # print
#     move $a0, $t4
#     li $v0, 11
#     syscall
#     
#     # cycle 
#     addi $t0, $t0, 1
#     beq $t0, $t1, done
#     j print

#nline:
#       
#     la $a0, newline
#     li $v0, 4
#     syscall
#     j pali
