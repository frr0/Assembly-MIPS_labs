.data

var: .word 0x3FFFFFF0

.text
.globl main
.ent main

main: lb $t1, var         # caricamento dati

      add $t1, $t1, $t1

      move $a0, $t1       # metto il valore del registro in $a0
      li $v0, 1           # system call – stampa stringa
      syscall

      li $v0,10          # codice per uscita dal programma
      syscall            # fine

.end main