.data

var_a: .byte 'a'             # 1 byte
var_A: .byte 'A'             # 1 byte
var1:  .byte 'm'             # 1 byte
var2:  .byte 'i'             # 1 byte
var3:  .byte 'p'             # 1 byte
var4:  .byte 's'             # 1 byte
var5:  .byte 0               # 1 byte

.text
.globl main
.ent main

main: 
        lb $t1, var1         # caricamento dati
        lb $t2, var2         # caricamento dati
        lb $t3, var3         # caricamento dati
        lb $t4, var4         # caricamento dati
        lb $t5, var5         # caricamento dati
        lb $t6, var_a        # caricamento dati
        lb $t7, var_A        # caricamento dati

        sub $t1, $t1, $t6    # esecuzione sottrazione
        sub $t2, $t2, $t6    # esecuzione sottrazione
        sub $t3, $t3, $t6    # esecuzione sottrazione
        sub $t4, $t4, $t6    # esecuzione sottrazione

        add $t1, $t1, $t7    # esecuzione somma
        add $t2, $t2, $t7    # esecuzione somma
        add $t3, $t3, $t7    # esecuzione somma
        add $t4, $t4, $t7    # esecuzione somma

        sb $t1, var1         # cambiamento dati
        sb $t2, var2         # cambiamento dati
        sb $t3, var3         # cambiamento dati
        sb $t4, var4         # cambiamento dati
        sb $t5, var5         # cambiamento dati

        la $a0, var1         # indirizzo della stringa
        li $v0, 4            # system call – stampa stringa
        syscall

        li $v0,10            # codice per uscita dal programma
        syscall              # fine

.end main