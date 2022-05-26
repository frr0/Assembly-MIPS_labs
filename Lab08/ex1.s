.data

ora_in:  .byte 12, 47
ora_out: .byte 13, 14
X:       .byte 1
Y:       .byte 40

.text
.globl main
.ent main

main:

          la $a0, ora_in
          # indirizzo di ora_in
          la $a1, ora_out
          # indirizzo di ora_out
          lbu $a2, X
          lbu $a3, Y
          jal costoParcheggio

.end main

.ent costoParcheggio

costoParcheggio:
  
          li $t0, 0
          li $t1, 1

          li $s4, 60

          lb $t2, ora_in($t0)
          lb $t3, ora_in($t1)
          lb $t4, ora_out($t0)
          lb $t5, ora_out($t1)

          mul $t6, $t2, $s4 
          mul $t7, $t4, $s4 

          add $t6, $t6, $t3
          add $t7, $t7, $t5

          sub $t0, $t7, $t6 
          
          divu $t0, $a3
          mflo $s2
          mfhi $s3

          beq $0, $s2, periodo_aggiuntivo
          mul $t0, $s2, $a2

periodo_aggiuntivo:

          mul $t0, $s2, $a2
          add $t0, $t0, $a2

print:

    move $a0, $t0
    li $v0, 1
    syscall

.end costoParcheggio
