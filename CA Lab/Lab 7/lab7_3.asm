.data
name : 	.asciiz "Le Thanh Phuong Nam - ITITUN19008\n"
input:	.space 8
max:	.float 255.0
prompt:	.asciiz "Enter 6 digits hex code of a color: (RRGGBB) "
answer:	.asciiz "Color in code in fraction is: \n"
error:	.asciiz "Error, invalid input!"
R:		.asciiz "R: "
G:		.asciiz "\nG: "
B:		.asciiz "\nB: "
.text
.globl main
main:
	la $a0, name
	li $v0, 4
	syscall
	
	l.s		$f0, max
	
	la		$a0, prompt
	li		$v0, 4
	syscall
	
	li		$a1, 8
	la		$a0, input
	li		$v0, 8
	syscall

	move	$t5, $zero
	li		$t7, 20
	move	$t0, $zero
loop:
	lb		$t4, input($t5)
	beqz	$t4, convert
	
	li		$t6, 0x61
	bge		$t4, $t6, charLowerCase
	li		$t6, 0x41
	bge		$t4, $t6, charUpperCase
	li		$t6, 0x30
	bge		$t4, $t6, digit
	li 		$t6, 0x39
	ble		$t4, $t6, digit
	li 		$t6, 0x46
	ble		$t4, $t6, charUpperCase
	li 		$t6, 0x66
	ble		$t4, $t6, charLowerCase

exception:
	la		$a0, error
	li		$v0, 4
	syscall
	
	jr $ra
digit:
	addi $t4, $t4, -48
	j 	continue
	
charUpperCase:
	addi $t4, $t4, -55
	j 	continue
	
charLowerCase:
	addi $t4, $t4, -87
	j 	continue
	
continue:
	sllv 	$t4, $t4, $t7
	or		$t0, $t0, $t4
	addi	$t5, $t5, 1
	addi	$t7, $t7, -4
	j loop
	
convert:
	and		$t0, $t0, 0x00FFFFFF
	
	and		$t1, $t0, 0x00FF0000
	srl		$t1, $t1, 16
	
	and		$t2, $t0, 0x00FF0000
	srl		$t2, $t2, 8
	
	and		$t3, $t0, 0x000000FF
	
	la 		$a0, answer
	li		$v0, 4
	syscall
	
	la		$a0, R
	li		$v0, 4
	syscall
	
	mtc1	$t1, $f12
	cvt.s.w $f12, $f12
	div.s	$f12, $f12, $f0
	
	li $v0, 2
	syscall
	
	la		$a0, G
	li		$v0, 4
	syscall
	
	mtc1	$t2, $f12
	cvt.s.w $f12, $f12
	div.s	$f12, $f12, $f0
	
	li $v0, 2
	syscall
	
	la		$a0, B
	li		$v0, 4
	syscall
	
	mtc1	$t3, $f12
	cvt.s.w $f12, $f12
	div.s	$f12, $f12, $f0
	
	li $v0, 2
	syscall
	
	
	jr	$ra
	
	
	
