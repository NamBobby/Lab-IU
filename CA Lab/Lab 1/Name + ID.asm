.data
msg: .asciiz "Le Thanh Phuong Nam ITITUN19008 "

.text
.globl main
main:
	la $a0, msg	
	li $v0 4       
        syscall
	jr $ra

            
	