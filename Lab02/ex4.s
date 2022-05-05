.data

message:      .asciiz "number in a crescent order: "
newline:      .asciiz "\n"
space:        .asciiz " "
n1:           .half 1834

.text
.globl main
.ent main

#; main:
#;               lb $t1, n1

#;               la $a0, message
#;               li $v0, 4
#;               syscall

#;               move $a0, $t1       # put register vaule in $a0
#;               li $v0, 1           # system call – print string
#;               syscall

#;               la $a0, space	
#;               li $v0, 4
#;               syscall

#;               li $v0,10           # code for program exit
#;               syscall             # end

#; .end main

main:  
       and $t3, $0, $0 # azzeramento risultato
       and $t4, $0, $0 # azzeramento indice
       lhu $t0, num
       li $t1, 1

ciclo: 
       and $t2, $t0, $t1
       beq $t2, 0, next
       addi $t3, $t3, 1

next: 
       sll $t1, $t1, 1
       addi $t4, $t4, 1
       bne $t4, 16, ciclo

       move $a0, $t3 # stampa risultato
       li $v0, 1
       syscall
       
       li $v0, 10
       syscall
.end main
