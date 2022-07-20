.data

# varible
#int

n1:  .byte 0x1            # decimal
n2:  .byte 0xffff          # hexadecimal 16
n3:  .byte 0xffffffff           # 1 byte
n4:  .byte 0x12345678

message1:        .asciiz "0xffff + 0x1 =  "
message2:        .asciiz "0xffff + 0xffffffff =  "

.text
.globl main
.ent main

main: 


      lb $t1, n1
      lb $t2, n2
      lb $t3, n3
      lb $t0, n4

      add	$t1, $t1, $t2
      add	$t2, $t2, $t3

      ########################################################
      #  syscall
      ########################################################

      la $a0, message1
      li $v0, 4
      syscall

      move $a0, $t1       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

      # CR
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      la $a0, message2
      li $v0, 4
      syscall

      move $a0, $t2       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

      # CR
      addi $a0, $0, 0xA   # ascii code for LF, if you have any trouble try 0xD for CR.
      addi $v0, $0, 0xB   # syscall 11 prints the lower 8 bits of $a0 as an ascii character.
      syscall

      sw $t0, 0($0)
      lb $s0, 1($0)

      move $a0, $s0       # put register vaule in $a0
      li $v0, 1           # system call – print string
      syscall

      #######################################################

      # Exit      
      li $v0,10           # code for program exit
      syscall             # end

.end main
