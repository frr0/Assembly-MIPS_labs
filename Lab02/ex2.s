.data

# Si scriva un programma che
# – Acquisisca due interi positivi
# – Verifichi che gli interi acquisiti siano
# rappresentabili su byte, e in questo caso esegua la
# seguente operazione logica bitwise e scriva sulla
# console il risultato ottenuto (intero):
# C = NOT(A AND (NOT(B))) OR (A XOR B)
# – Altrimenti, dia un messaggio di errore.

message:      .asciiz "Enter a number: "
out:          .asciiz "number: "
newline:      .asciiz "\n"
byte:         .byte 127
error_p:      .asciiz "error, number not storable in a byte!"

.text
.global main
.ent main

main:
              lb $t3, byte

              #-------------------------------------
              # first number
              #-------------------------------------

              la $a0, message
              li $v0, 4
              syscall

              li $v0, 5           # system call – read integer
              syscall
              move $t1, $v0       # first number
              
              # check

              bgt	$t1, $t3, error	# if $t1 > $t3 then target

              # good, prtint

              la $a0, out
              li $v0, 4
              syscall

              move $a0, $t1       # put register vaule in $a0
              li $v0, 1           # system call – print string
              syscall

              #-------------------------------------
              la $a0, newline
              li $v0, 4
              syscall
              #-------------------------------------

              #-------------------------------------
              # second number
              #-------------------------------------


              la $a0, message
              li $v0, 4
              syscall

              li $v0, 5           # system call – read integer
              syscall
              move $t2, $v0       # first number

              # check

              bgt	$t2, $t3, error	# if $t2 > $t3 then target

              # good, prtint

              la $a0, out
              li $v0, 4
              syscall

              move $a0, $t2       # put register vaule in $a0
              li $v0, 1           # system call – print string
              syscall

              #-------------------------------------
              # result
              #-------------------------------------
              

              not $t3, $t1 # not B
              and $t3, $t0, $t3 # A and (not B)
              not $t3, $t3 # not (A and (not B))
              xor $t0, $t0, $t1 # A xor B
              or $t0, $t0, $t3 # not (A and (not B)) or (A xor B)

              li $t1, 0x000000FF # azzeramento della parte più significativa
              and $t0, $t0, $t1 # del risultato prima della stampa

              move $a0, $t0
              li $v0, 1
              syscall


              li $v0,10           # code for program exit
              syscall             # end

error: 

              la $a0, error_p	
              li $v0, 4		# $v0 = odd
              syscall
              
              li $v0,10           # code for program exit
              syscall             # end

.end main

