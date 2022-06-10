.data
name : 		.asciiz "Le Thanh Phuong Nam - ITITUN19008\n"
prompt:		.asciiz "Enter number of the terms: "
answer:		.asciiz "Value of series is: "
numerator:	.double 1.0
.text
.globl main
main:
	la $a0, name
	li $v0, 4
	syscall
	
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	
	move $t0, $v0
	
	li $t1, 1
	
	l.d $f2, numerator
	
	mtc1.d $zero, $f4
	cvt.d.w $f4, $f4
	
loop:
	mtc1.d		$t1, $f6
	cvt.d.w 	$f6, $f6
	div.d 		$f6, $f2, $f6
	add.d		$f4, $f4, $f6

continue:
	addi	$t1, $t1, 1
	blt		$t0, $t1, return
	j		loop
	
return:
	la		$a0, answer
	li		$v0, 4
	syscall
	
	mov.d 	$f12, $f4
	li 		$v0, 3
	syscall
		
	jr $ra