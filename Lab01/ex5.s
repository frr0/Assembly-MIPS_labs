.data

message1:        .asciiz "Enter t1: "
message2:        .asciiz "Enter t2: "
message3:        .asciiz "t1: "
message4:        .asciiz "t2: "

.text
.globl main
.ent main

main: 
      la $a0, message1
      li $v0, 4
      syscall
      
      li $v0, 5           # system call – read integer
      syscall

      move $t1, $v0       # first number

      la $a0, message2
      li $v0, 4
      syscall

      li $v0, 5           # system call – read integer
      syscall

      move $t2, $v0       # second number

      # t1 => 5 => 2
      # t2 => 2 => 5

      # switch
      add	$t1, $t1, $t2		# $t1 = $t1 + $t2 => t1 = 7, t2 = 2
      sub	$t2, $t1, $t2		# $t2 = $t1 - $t2 => t1 = 7, t2 = 5
      sub	$t1, $t1, $t2		# $t1 = $t1 - $t2 => t1 = 2, t2 = 5
      
      la $a0, message3
      li $v0, 4
      syscall

      move $a0, $t1       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      la $a0, message4
      li $v0, 4
      syscall

      move $a0, $t2       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

      li $v0,10           # code for program exit
      syscall             # end

.end main