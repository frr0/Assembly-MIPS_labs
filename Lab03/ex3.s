
.data

#space:   .byte " "
#newline: .byte "\n"

.text
.globl main
.ent main

main: 

      li $v0, 12 
      syscall
      move $t1, $v0

      move $a0, $t1       # put register vaule in $a0
      li $v0, 11
      syscall

    # CR or Enter (go to next line)
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall
      
      # lb $t1, n1
      # la $a0,  n1       # is to print the address of n1
      move $a0, $t1       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

.end main
