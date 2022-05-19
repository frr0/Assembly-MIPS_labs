.data

star: .asciiz "*"
nl:   .asciiz "\n"
NUM = 8

.text
.globl main
.ent main

main:

      # t1 cycle counter
      li $t1, 0

      li $t8, NUM
      j precycle

# ===================================
# First part
# ===================================

precycle:
      
      # t2 cycle counter
      li $t2, 0
      j cycle

cycle:

      la $a0, nl
      li $v0, 4
      syscall
      # cycle 
      addi $t1, $t1, 1
      # bgt $t1, $t8, done # not done but go to part 2 
      bgt $t1, $t8, second_part # not done but go to part 2 
      blt $t2, $t8, cycle2

cycle2:
      # cycle 
      addi $t2, $t2, 1
      # blt $t2, $t8, cycle

      la $a0, star
      li $v0, 4
      syscall

      blt $t2, $t8, cycle2
      j precycle

# ====================================
# Second part
second_part:

      li $t1, 0

      la $a0, nl
      li $v0, 4
      syscall
# ====================================

n2_precycle:
      
      # t2 cycle counter
      li $t2, 0
      j n2_cycle

n2_cycle:

      la $a0, nl
      li $v0, 4
      syscall
      # cycle 
      addi $t1, $t1, 1
      bgt $t1, $t8, done
      blt $t2, $t8, n2_cycle2

n2_cycle2:
      # cycle 
      addi $t2, $t2, 1
      # blt $t2, $t8, cycle

      la $a0, star
      li $v0, 4
      syscall

      blt $t2, $t1, n2_cycle2 # t1 < t2, not NUM
      j n2_precycle

# ====================================

done:
      
      li $v0, 10
      syscall

.end main
