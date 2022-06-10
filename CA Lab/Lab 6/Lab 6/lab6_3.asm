	.data
	name : 	.asciiz "Le Thanh Phuong Nam - ITITUN19008\n"
	.text
	.globl main
main:
	la $a0, name
	li $v0, 4
	syscall
#input the string
	li $v0, 8		#service code
	la $a0, str		#address of buffer
	li $a1, 128		#buffer lenght
	syscall

	li $t1, 0		#index of first char in str buffer
	li $t2, 0		#counter for push or pop

scan:
	lbu $t0, str($t1)
	beqz $t0, next   	#end of string
	addu $t1, 1		# inc str counter
	j scan			# loop

#push each character onto the stack
next:
	addu $t1, -1		#index of last char in str buffer
push1:
	lbu $t0, str($t1)   	# get current char into a full word
	bltz $t1, stend     	# end of string

#if the char is a vowel then skip it
	li $t3,65		#A
	beq $t0,$t3,skip

	li $t3,69		#E
	beq $t0,$t3,skip

	li $t3,73		#I
	beq $t0,$t3,skip

	li $t3,79		#O
	beq $t0,$t3,skip

	li $t3,85		#U
	beq $t0,$t3,skip

	li $t3,97		#a
	beq $t0,$t3,skip

	li $t3,101		#e
	beq $t0,$t3,skip

	li $t3,105		#i
	beq $t0,$t3,skip

	li $t3,111		#o
	beq $t0,$t3,skip

	li $t3,117		#u
	beq $t0,$t3,skip
	
	subu $sp,$sp,4		#push the full word
	sw $t0,0($sp)		#holding the char

	addu $t2,1 		#inc the counter
skip:
	sb $zero, str($t1)
	addu $t1, -1    	#decrease the index
	j push1         	#loop

#pop chars from stack back into the buffer
stend:
	li $t1, 0       	#index of first byte of str buffer
pop1:
	lw $t0, 0($sp)  	#pop a char off the stack
	addu $sp, $sp, 4
	beqz $t2, done  	#empty stack

	sb $t0, str($t1)  	#store at string [$t1]
	addu $t1, 1       	#inc the index
	addu $t2, -1		#decrease the counter
	j pop1			#loop

#print the reversed string
done:
	li $v0, 4         	#service code
	la $a1, str       	#address of string
	syscall
	li $v0, 10        	#exit

	.data
str:	.space 128	#character buffer