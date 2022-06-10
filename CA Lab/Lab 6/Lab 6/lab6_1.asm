#3ab - 2bc - 5a + 20ac - 16	
.data 
name : 	.asciiz "Le Thanh Phuong Nam - ITITUN19008\n"
prompt : 	.asciiz "Enter next value: "
answer : 	.asciiz "The answer is: "
.text
.globl main
main:
	la $a0, name
	li $v0, 4
	syscall

	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	
	or $t0, $v0, $zero
	
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	or $t1, $v0, $zero
	
	la $a0, prompt
	li $v0,4
	syscall
	
	li $v0, 5
	syscall
	
	or $t2, $v0, $zero
	
	mult $t0, $t1
	mflo $t3
	ori $t4, $zero, 3
	mult $t3, $t4
	mflo $t3
	addi $sp, $sp, -4
	sw $t3, ($sp)
	
	mult $t1, $t2
	mflo $t3
	addi $t4, $zero, -2
	mult $t3, $t4
	mflo $t3
	addi $sp, $sp, -4
	sw $t3, ($sp)
	
	addi $t4, $zero, -5
	mult $t0, $t4
	mflo $t3
	addi $sp, $sp, -4
	sw $t3, ($sp)
	
	mult $t0, $t2
	mflo $t3
	addi $t4, $zero, 20
	mult $t3, $t4
	mflo $t3
	addi $sp, $sp, -4
	sw $t3, ($sp)
	
	addi $t3, $zero, -16
	
	lw $t4, ($sp)
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4
	
	lw $t4, ($sp)
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4
	
	lw $t4, ($sp)
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4
	
	lw $t4, ($sp)
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4
	
	la $a0, answer
	li $v0, 4
	syscall
	
	or $a0, $t3, $zero
	li $v0, 1
	syscall
	
	jr $ra
	