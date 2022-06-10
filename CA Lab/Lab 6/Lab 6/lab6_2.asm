#3ab - 2bc - 5a + 20ac - 16	
.data 
name : 	.asciiz "Le Thanh Phuong Nam - ITITUN19008\n"
prompt : 	.asciiz "Input the string with lenght 100: "
answer : 	.asciiz "Reversed String is: "
string: 	.space 100
.text
.globl main
main:
	la $a0, name
	li $v0, 4
	syscall

	la $a0, prompt
	li $v0, 4
	syscall
	
	la $a0, string
	li $a1, 100
	
	li $v0, 8
	syscall
	
	li $t0, 0

pushChartoStack:
	lb $t1, string($t0)
	beqz $t1, end
	
	addi $sp, $sp, -1
	sb $t1, 0($sp)
	
	addi $t0, $t0, 1
	j pushChartoStack

end:
	la $a0, answer
	li $v0, 4
	syscall
	
popStack:
	lb $t1, 0($sp)
	addi $sp, $sp, 1
	
	or $a0, $t1, $zero
	li $v0, 11
	syscall
	
	addi $t0, $t0, -1
	beqz $t0, return
	
	j popStack

return:
	
	jr $ra
	

	

	
	
	jr $ra
	