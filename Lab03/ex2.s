.data

space:   .asciiz " "
newline: .asciiz "\n"

.text
.globl main
.ent main

main: 

      li $v0, 12
      syscall
      move $t1, $v0

      li $v0, 12 
      syscall
      move $t2, $v0

      li $v0, 12 
      syscall
      move $t3, $v0

      # syscall 4 print a string  (you have to load the string address)
      la $a0, newline
      li $v0, 4
      syscall

      move $a0, $t1       # put register vaule in $a0
      li $v0, 11
      syscall

      move $a0, $t2       # put register vaule in $a0
      li $v0, 11
      syscall

      move $a0, $t3       # put register vaule in $a0
      li $v0, 11
      syscall

      # this prints a ascii number of a char in reg $t1
      move $a0, $t1       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

.end main
