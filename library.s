.data

# varible
#int

n1:  .byte 10            # decimal
n2:  .byte 0x10          # hexadecimal 16
n3:  .byte '1'           # 1 byte
n4:  .space 1

# float

f1:  .float 4.6

# char

var_a: .byte 'a'             # 1 byte
var_A: .byte 'A'             # 1 byte
var1:  .byte 'm'             # 1 byte
var2:  .byte 'i'             # 1 byte
var3:  .byte 'p'             # 1 byte
var4:  .byte 's'             # 1 byte
var5:  .byte 0               # 1 byte

# string

message1:        .asciiz "Enter t1: "
message2:        .asciiz "Enter t2: "
message3:        .asciiz "t1: "
message4:        .asciiz "t2: "

.text
.globl main
.ent main

main: 

      ########################################################
      #  syscall
      ########################################################

      # print integers syscall 1
      lb $t1, n1
      # la $a0,  n1       # is to print the address of n1
      move $a0, $t1       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

      # CR
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      # print float syscall 2
      lb $t2, f1
      # la $a0,  f1       # is to print the address of n1
      move $a0, $t2       # put register vaule in $a0
      li $v0, 2           # system call – print string
      syscall
      
      # CR
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      # syscall 4 print a string  (you have to load the string address)
      la $a0, message1
      li $v0, 4
      syscall

      # syscall 5 read an integer 
      li $v0, 5           # system call – read integer
      syscall
      move $t1, $v0       # first number

      # CR or Enter (go to next line)
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      # syscall 8 print a char 
      la $a0, var3
      li $v0, 8
      syscall

      # CR or Enter (go to next line)
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      # syscall 11 print a char 
      la $a0, var3
      li $v0, 11
      syscall

      # CR or Enter (go to next line)
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      ########################################################
      #  operation
      ########################################################
      
      # addition
      add		$t5, $t3, $t4		# $t5 = $t3 + $t4
      sub		$t5, $t4, $t3		# $t5 = $t4 - $t3
      addi	$t0, $t1, 12		# $t0 = $t1 + 12
      addi	$t0, $t1, -2		# $t0 = $t1 + -2
      
      # switch # t1 => 5 => 2 # t2 => 2 => 5
      add	$t1, $t1, $t2		# $t1 = $t1 + $t2 => t1 = 7, t2 = 2
      sub	$t2, $t1, $t2		# $t2 = $t1 - $t2 => t1 = 7, t2 = 5
      sub	$t1, $t1, $t2		# $t1 = $t1 - $t2 => t1 = 2, t2 = 5
      
      
      #######################################################

      # Exit      
      li $v0,10           # code for program exit
      syscall             # end

.end main