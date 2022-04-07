.data

n1:  .byte 0x1       
n2:  .byte 0xFFFF       
a:   .asciiz "t0 = "
aaa:   .asciiz "t1 = "
aa:   .asciiz "t2 = "
aaaa:   .asciiz "t4 = "
cr:   .asciiz "\n"

.text
.globl main
.ent main

main: 

      lb $t1, n1
      lb $t2, n2

      addiu	$t0, $t1, 0xFFFF			# $t0 = $t1 + 0xFFFF
      add	$t4, $t1, $t2			      # $t0 = $t1 + $t4
      
      la $a0, a
      li $v0, 4
      syscall
      
      la $a0, cr
      li $v0, 4
      syscall

      la $a0, aaa
      li $v0, 1
      syscall

      la $a0, cr
      li $v0, 4
      syscall

      la $a0, aaaa
      li $v0, 1
      syscall

      move $a0, $t0
      li $v0,1
      syscall

      la $a0, cr
      li $v0, 4
      syscall

      la $a0, aa
      li $v0, 4
      syscall
      
      move $a0, $t2
      li $v0,1
      syscall

      li $v0,10           # code for program exit
      syscall             # end

.end main