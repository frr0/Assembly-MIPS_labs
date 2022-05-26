.data

paris:    .asciiz "pari"
disparis: .asciiz "dispari"

.text
.globl main
.ent main

main:
    
    li $t0, 2

    # adding $ra to the stack
    subu $sp, $sp, 4
    sw $ra, ($sp)

    # adding t0 to the stack
    subu $sp, $sp, 4
    sw $t0, ($sp)

    # call procedure
    jal compute_next
  
    # removing t0 to the stack
    lw $t0, ($sp)
    addu $sp, $sp, 4

    # removing $ra to the stack
    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra

.end main

.ent compute_next

compute_next:

    li $t0, 0
    #lw $t0, 4($sp)
    lw $t0, ($sp)
    addu $sp, $sp, 4

    andi $t0, $0, 0
    beq $t0, $zero, pari
    j dispari

pari:

    la $a0, paris
    j print

dispari:

    la $a0, disparis
    j print

print:

    li $v0, 4
    syscall

    subu $sp, $sp, 4
    sw $t0, ($sp)

    move $v0, $t4
    jr $ra

.end compute_next
