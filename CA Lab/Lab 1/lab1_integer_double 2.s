##	lab1_integer_double.s 
##	This program read in an integer and double it

#########################################################
#					DATA SEGMENT						#
#	This is where all strings, constants are declared	#
#########################################################

		.data		# the data segment
msg: .asciiz "\nLe Thanh Phuong Nam - ITITIU19008\n"
prompt:		.asciiz	"Enter an integer: "
result: 	.asciiz "The result is: "

#########################################################
#					TEXT SEGMENT						#
#	This is where all the instructions reside			#
#########################################################

		.text		# the code segment
		.globl main
main:
	
	
	la $a0, msg		
	li $v0, 4		
	syscall		
	
	li $v0, 4
	la $a0,prompt 			
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
mask:
	
	add $t1, $zero, 1
	sll $t1,$t1, 31
	addi $t2, $zero, 32
	li $v0, 4	
	la $a0, result
	syscall
loop:
	and $t3,$t0,$t1
	beq $t3, $zero, print
	add $t3, $zero, $zero
	addi $t3,$zero, 1
	j print
print:
	li$v0, 1
	move $a0, $t3
	syscall
	srl $t1,$t1, 1
	addi $t2,$t2, -1
	bne $t2, $zero, loop
	beq $t2, $zero, exit
exit: 	
	li $v0, 10
	syscall