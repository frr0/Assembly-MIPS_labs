.data

# 10 - 16 + 49 = 43

n1:  .byte 10            # decimale
n2:  .byte 0x10          # esadecimale 16
n3:  .byte '1'           # 1 byte
res: .space 1

.text
.globl main
.ent main

main: lb $t1, n1         # caricamento dati
      lb $t2, n2         # caricamento dati
      lb $t3, n3         # caricamento dati

      sub $t1, $t1, $t2  # esecuzione sottrazione
      add $t1, $t1, $t3  # esecuzione somma
      sb $t1, res        # salvataggio del risultato in memoria

      li $v0,10          # codice per uscita dal programma
      syscall            # fine

.end main