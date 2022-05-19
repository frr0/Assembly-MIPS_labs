.data

stringa: .asciiz "parola"

.text
.globl main
.ent main

main:

        li $s0, 0

ciclo:        
        lbu $a0, stringa($s0)
        beq $a0, 0, fine
        jal converti

        sb $v0, stringa($s0)
        addi $s0, $s0, 1
        j ciclo
        li $v0, 10
        syscall

fine:
      
      li $v0, 10
      syscall

.end main

.ent converti

converti:

        addi $a0, $a0, 'A'
        li $v0, 'a'
        sub $v0, $a0, $v0
        jr $ra

.end converti
