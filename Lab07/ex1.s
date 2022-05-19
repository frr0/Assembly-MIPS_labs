.data

.text
.globl main
.ent main

main:

    li $t0, 15
    li $t1, 16
    li $t2, 17
    li $t3, 18

    li $s0, 223
    li $s1, 224
    li $s2, 225
    li $s3, 226

    subu $sp, $sp, 4
    sw $ra, ($sp)

    # adding t0 to t4 to the stack
    subu $sp, $sp, 4
    sw $t0, ($sp)

    subu $sp, $sp, 4
    sw $t1, ($sp)

    subu $sp, $sp, 4
    sw $t2, ($sp)

    subu $sp, $sp, 4
    sw $t3, ($sp)
    
    subu $sp, $sp, 4
    sw $t4, ($sp)


    # call procedure
    jal sum
  
    lw $t4, ($sp)
    addu $sp, $sp, 4

    lw $t3, ($sp)
    addu $sp, $sp, 4

    lw $t2, ($sp)
    addu $sp, $sp, 4

    lw $t1, ($sp)
    addu $sp, $sp, 4

    lw $t0, ($sp)
    addu $sp, $sp, 4

    move $a0, $v0
    li $v0, 1
    syscall

    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra

.end main

.ent sum

sum:

    # changing $t only in sum
    li $t0, 0
    li $t1, 0
    li $t2, 0
    li $t3, 0
    li $t4, 0

    # get $t0 from the stack
    # subu $sp, $sp, -16
    lw $t0, 16($sp)

    # $t4 is the sum 
    add $t4, $t4, $t0
    add $t4, $t4, $s0

    # add $s to stack
    subu $sp, $sp, 4
    sw $s0, ($sp)

    subu $sp, $sp, 4
    sw $s1, ($sp)

    subu $sp, $sp, 4
    sw $s2, ($sp)

    subu $sp, $sp, 4
    sw $s3, ($sp)

    li $s0, 0
    li $s1, 0
    li $s2, 0
    li $s3, 0

    lw $s3, ($sp)
    addu $sp, $sp, 4

    lw $s2, ($sp)
    addu $sp, $sp, 4

    lw $s1, ($sp)
    addu $sp, $sp, 4

    lw $s0, ($sp)
    addu $sp, $sp, 4

    move $v0, $t4
    jr $ra

.end sum
