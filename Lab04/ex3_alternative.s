# Si scriva un programma MIPS che, dati due vettori di
# 4 word ciascuno come matrici riga e colonna, ne
# calcoli il prodotto.

.data

NUM_ELEM = 4
DIM = 4 * NUM_ELEM

vectrow:  .word 12, 56, 1, -5
vectcol:  .word -51, 11, 0, 4
matrix:   .space DIM * NUM_ELEM


.text
.globl main
.ent main

      # load counter for i and j
      li $t0, 0
      li $t1, 0
      j for_j

for_i: 

      addi $t0, $t0, 4
      # j for_j
      blt $t0, DIM, for_j

      syscall
      li $v0, 10

      for_j:
            sw $t3, wVet($t0)
            addi $t1, $t1, 4
            blt $t0, NUM_ELEM, for_j
            j for_i


.end main
