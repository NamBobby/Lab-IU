.data		# the data segment
prompt: .asciiz "The input: "
output: .asciiz "The output: "
buffer: .space 100
.text		# the code segment
.globl main
main:	
	# print out the prompt
	la $a0, prompt		
	li $v0, 4		
	syscall	
	
	# read a string
	li $v0,8
    la $a0, buffer
    li $a1, 100
    syscall
	
	la $t0, buffer
	
	# &t1 = 0
	li $t1, 0
	lb $t1, 0($t0)

	ble	$t1, 97, loop
	
	addi $t1, $t1, -32
	
	sb $t1, 0($t0)

	addi $t0, $t0, 1
	
loop:
	# t1 = t0[0]
	lb $t1, 0($t0)
	
	beqz $t1, done

	beq $t1, ' ', toUpper

	addi $t0, $t0, 1
	j loop

toUpper:
	addi $t0, $t0, 1
	
	lb $t1, 0($t0)	
	
	beq $t1, ' ', toUpper

	addi $t1, $t1, -32

	sb $t1, 0($t0)

	addi $t0, $t0, 1
	j loop
	
done:
	# print out the result
	la $a0, output
	li $v0, 4		
	syscall
	la $a0, buffer
	li $v0, 4		
	syscall	
	jr $ra