main: subu $sp, $sp, 32
      sw $ra, 20($sp)
      sw $a0, 32 ($sp)
      sw $0, 24($sp)
      sw $0, 28($sp)

loop: lw $t6, 28($sp)
      lw $t8, 24($sp)
      mult $t4, $t6, $t6
      addu $t9, $t8, $t4
      addu $t9, $t8, $t7
      sw $t9, 24($sp)
      addu $t7, $t6, 1
      sw $t7, 28($sp)
      bne $t5, 100, loop
