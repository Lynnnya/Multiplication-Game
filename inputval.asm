    	.data
    	new_line: .asciiz "\n"
    	input_prompt: .asciiz "your turn: "
    	inva_prompt: .asciiz "invalid input, please enter a number between 1 and 9"
    	try_again: .asciiz "press 0 to try again, anykey to exit: "

    	.text
    	user_input:
    	li $v0, 4
	la $a0, input_prompt
	syscall
	li $v0, 5
	syscall
    	j validation

    	validation:
    	li $t0, 1
   	while:
        	beq $t0, 10, invalid
        	beq $v0, $t0, valid
        	addi $t0, $t0, 1
        	j while
    	j invalid

    	invalid:
    	li $v0, 4
	la $a0, inva_prompt
	syscall
    	li $v0, 4
	la $a0, new_line
	syscall
	li $v0, 4
	la $a0, try_again
	syscall
    	li $v0, 5
	syscall
    	beq $v0, 0, user_input
    	j exit

    	valid:
    	move $t1, $v0

    	exit:
    	li $v0, 10
	syscall
