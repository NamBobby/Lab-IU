.data
name : 	.asciiz "Le Thanh Phuong Nam - ITITUN19008\n"
a:		.double 5.4
bb:		.double -12.3
c:		.double 18.23
d:		.double -8.23
promptX:	.asciiz "Enter x:"
promptY:	.asciiz "Enter y:"
answer:		.asciiz " 5.4xy - 12.3y + 18.23x - 8.23 = "
.text
.globl main
main:
	la $a0, name
	li $v0, 4
	syscall
	
	la	$a0, promptX
	li	$v0, 4
	syscall
	
	li	$v0, 7
	syscall
	
	mov.d $f2, $f0
	
	la $a0, promptY
	li $v0, 4
	syscall
	
	li $v0, 7
	syscall
	
	mov.d 	$f4, $f0
	mul.d 	$f8, $f2, $f4
	l.d 	$f6, a
	mul.d	$f8, $f8, $f6
	
	l.d 	$f6, bb
	mul.d	$f6, $f6, $f4
	add.d 	$f8, $f8, $f6
	
	l.d 	$f6, c
	mul.d	$f6, $f6, $f2
	add.d 	$f8, $f8, $f6
	
	l.d 	$f6, d
	add.d 	$f8, $f8, $f6
	
	la $a0, answer
	li $v0, 4
	syscall
	
	mov.d 	$f12, $f8
	li	$v0, 3
	syscall
	
	jr $ra