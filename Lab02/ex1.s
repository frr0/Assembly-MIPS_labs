.data

# Si scriva un programma che richieda all’utente
# un intero positivo e quindi dica se il valore
# introdotto è pari oppure dispari

# • Per la determinazione del pari/dispari si
# utilizzi un’operazione di and logico tra il valore
# introdotto e 1. Se il risultato dell’operazione è
# 0, il numero introdotto è pari; altrimenti è
# dispari.

message:   .asciiz "Enter a number: "
odd:       .asciiz "odd number"
even:      .asciiz "even number"

.text
.globl main
.ent main

main: 

          la $a0, message
          li $v0, 4
          syscall
          
          li $v0, 5           # system call – read integer
          syscall
          move $t1, $v0       # first number
          
          andi $t2, $t1, 1			# $t2 = $t1 & 1
          li $t3, 0		# $t3 = 0
          
          bne	$t2, $t3, target	# if $t2 != $t3 then target

          la $a0, even		# 
          li $v0, 4		# $v0 = even
          syscall

          li $v0,10           # code for program exit
          syscall             # end

target: 

          la $a0, odd		# 
          li $v0, 4		# $v0 = odd
          syscall
          
          li $v0,10           # code for program exit
          syscall             # end

.end main