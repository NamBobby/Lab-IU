.data
message0: .asciiz "Le Thanh Phuong Nam ITITUN19008 :"
message1: .asciiz "\nEnter input 1 :"
message2: .asciiz "\nEnter input 2 :"
message3: .asciiz "\nThe subtraction of the two inputs is "
message4: .asciiz "\nThe sum of the two inputs is "

.text
.globl main
main:
li $v0 4        #print out message1
            la $a0 message0
            syscall


li $v0 4        #print out message1
            la $a0 message1
            syscall

            li $v0 5        #read message1 as number1
            syscall
            move $t0,$v0    # set $t0 to the content of $v0

            li $v0 4        #print out message2
            la $a0 message2
            syscall

            li $v0 5        #read message2 as number2
            syscall

            move $t1,$v0
            li $v0 4
            la $a0 message3
            syscall

            sub $a0, $t0, $t1   #   a0 = t0 + t1

            li $v0, 1       #   print subtraction
            syscall         #   run
			
			li $v0 4
			la $a0 message4
			syscall
			
			
			add $a0, $t0, $t1   #a0 = t0 + t1
			li $v0, 1      #print sum
			syscall
