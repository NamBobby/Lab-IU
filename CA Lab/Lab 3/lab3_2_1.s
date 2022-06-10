.data
.text
.globl main
main:
	ori $t1, 1

	or $t2, $t1, $t2
	sll $t2, $t2, 1

	or $t3, $t2, $t3
	sll $t3, $t3, 1

	or $t4, $t3, $t4
	sll $t4, $t4, 1

	or $t5, $t4, $t5
	sll $t5, $t5, 1

	or $t6, $t5, $t6
	sll $t6, $t6, 1

	or $t7, $t6, $t7
	sll $t7, $t7, 1

	or $t8, $t7, $t8
	sll $t8, $t8, 1
exit: 
	jr $ra