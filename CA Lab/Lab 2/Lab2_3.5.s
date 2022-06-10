		.data		# the data segment
prompt: .asciiz "Guess a number (1 - 1000): "
win: 	.asciiz	"You win!!\n"
lose: 	.asciiz	"You lose!!\n"
smaller:.asciiz "Your number is smaller than the secret number!!\n"
bigger: .asciiz "Your number is bigger than the secret number!!\n"
flag: 	.asciiz "Game Over\n"


		.text		# the code segment
		.globl main
main:
	
	li $t0, 0x1fa
	li $t2, 0

Guessing:
	# print out the prompt
	la $a0, prompt		
	li $v0, 4		
	syscall
	
	# read in an integer
	li $v0, 5			
	syscall
	move $t1, $v0
	
Compare:
	beq $t2, $t1, FLAG
	blt $t0, $t1, SMALLER
	bgt $t0, $t1, BIGGER
	beq $t0, $t1, WIN
	
WIN:
	
	# print out "win"
	la $a0, win		
	li $v0, 4		
	syscall
	j exit
BIGGER:
	# print out "bigger"
	la $a0, smaller	
	li $v0, 4		
	syscall	
	j LOSE
SMALLER:
	# print out "smaller"
	la $a0, bigger	
	li $v0, 4		
	syscall	
	j LOSE
LOSE:
	# print out "lose"
	la $a0, lose		
	li $v0, 4		
	syscall	
	j Guessing
FLAG:
	# print out "flag"
	la $a0, flag	
	li $v0, 4		
	syscall	
	j exit

exit:	
	li $v0, 10,
	syscall