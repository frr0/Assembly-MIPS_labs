.data

DIM = 3
L = 2
RDIM = DIM*4

matrix1:  .word 4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
matrix2:  .word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
#matrix3:  .word 4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
#matrix4:  .word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
result:   .space RDIM

.text
.globl main
.ent main

main:

          subu $sp, $sp, 4
          sw $ra, ($sp)

          la $a0, matrix1
          la $a1, matrix2
          la $a2, result

          li $a3, DIM
          li $t0, L
          subu $sp, 4
          sw $t0, ($sp)

          jal variazione

          lw $ra, ($sp)
          addu $sp, $sp, 4
          jr $ra

.end main

.ent variazione

variazione:
  
          #counters
          li $t0, 0
          li $t1, 1
          li $t2, 0
          li $t3, 0
          li $t4, 1
          li $t5, 1
          li $t6, 1
          li $t7, 0

          # DIM = t2
          move $t2, $a3

          # l = t3
          lw $t3, ($sp)
          addu $sp, $sp, 4

precycle:

          # t1 = 2 
          mul $t1, $t1, $t3
          # t1 = 6 
          mul $t1, $t1, $t2

          # t4 = 2 
          mul $t4, $t4, $t3
          sll $t1, $t1, 2
          sll $t4, $t4, 2

cycle:

          # t0 = 6, 7, 8
          add $t0, $a0, $t1
          # load number
          lw $t5, ($t0)
          add $t0, $a1, $t4
          lw $t6, ($t0)

          # calcolo
          sub $t6, $t6, $t5
          mul $t6, $t6, 100
          mflo $t6
          div $t6, $t6, $t5
          # t5 non mi serve piu e ne faccio un altro uso 
          sll $t5, $t7, 2
          add $t0, $a2, $t5
          # in t6 c'è il risultato
          sw $t6, ($t0)
          # mul $t0, $t2, 4
          sll $t0, $t2, 2
          add $t4, $t4, $t0
          addi $t1, $t1, 4
          addi $t7, $t7, 1

          blt $t7, $t2, cycle
          jr $ra

print:

    move $a0, $t0
    li $v0, 1
    syscall

.end variazione
