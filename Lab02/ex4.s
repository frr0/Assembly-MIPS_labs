
.data

message:      .asciiz "number in a crescent order: "
newline:      .asciiz "\n"
space:        .asciiz " "
byte:         .byte 127
n1:           .byte 34
n2:           .byte 4
n3:           .byte 67
error_p:      .asciiz "error, number not storable in a byte!"

.text
.globl main
.ent main

main:
              lb $t1, n1
              lb $t2, n2
              lb $t3, n3

              # check


move1:
              blt	$t1, $t2, move2	# if $t1 > $t2 then target
              move 	$t4, $t1		# $t4 = $t1
              move 	$t1, $t2		# $t1 = $t2
              move 	$t2, $t4		# $t2 = $t4

move2:
              blt	$t1, $t3, move3	# if $t1 > $t3 then target
              move 	$t4, $t1		# $t4 = $t1
              move 	$t1, $t3		# $t1 = $t3
              move 	$t3, $t4		# $t3 = $t4

move3:
              blt	$t2, $t3, end	# if $t2 > $t3 then target
              move 	$t4, $t2		# $t4 = $t2
              move 	$t2, $t3		# $t2 = $t3
              move 	$t3, $t4		# $t3 = $t4


end:

              la $a0, message	
              li $v0, 4		# $v0 = odd
              syscall
              move $a0, $t1       # put register vaule in $a0
              li $v0, 1           # system call – print string
              syscall

              la $a0, space	
              li $v0, 4		# $v0 = odd
              syscall

              move $a0, $t2       # put register vaule in $a0
              li $v0, 1           # system call – print string
              syscall

              la $a0, space	
              li $v0, 4		# $v0 = odd
              syscall

              move $a0, $t3       # put register vaule in $a0
              li $v0, 1           # system call – print string
              syscall

              li $v0,10           # code for program exit
              syscall             # end

.end main