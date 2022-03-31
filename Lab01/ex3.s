.data

op1: .byte 150
op2: .byte 100
res: .space 1

.text
.globl main
.ent main

main: 
        lbu $t1, op1        # caricamento dati
        lb $t2, op2         # caricamento dati
        lb $t3, res         # caricamento dati

        add $t1, $t1, $t2   # esecuzione somma

        # sb $t1, res       # cambiamento dati
        # lb $a0, res       # e poi li riprendo per stampare

        move $a0, $t1       # metto il valore del registro in $a0
        li $v0, 1           # system call – stampa stringa
        syscall

        li $v0,10           # codice per uscita dal programma
        syscall             # fine

.end main