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
      
      addi $a0, $0, 0xA   #ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      addi $t2, $t1, 40   # add immediate 40 to the content of t1 in the t2 register

      move $a0, $t2       # metto il valore del registro in $a0
      li $v0, 1           # system call – stampa stringa
      syscall

      li $v0,10           # codice per uscita dal programma
      syscall             # fine

.end main