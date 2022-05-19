.data

paris:    .asciiz "pari"
disparis: .asciiz "dispari"

.text
.globl main
.ent main

main:
    
    li $t0, 1

    subu $sp, $sp, 4
    sw $ra, ($sp)

    subu $sp, $sp, 4
    sw $t0, ($sp)

    # call procedure
    jal compute_next
  

    lw $t0, ($sp)
    addu $sp, $sp, 4

    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra

.end main

.ent compute_next

compute_next:

    lw $t0, 4($sp)

    andi $t0, $0, 1
    la $a0, paris
    beq $t0, $zero, salto
    la $a0, disparis

salto:

    li $v0, 4
    syscall

    move $v0, $t4
    jr $ra

.end compute_next
