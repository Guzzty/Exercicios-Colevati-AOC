.data
	msg1: .asciiz "\nInsira o valor da base maior do trapezio: "
	msg2: .asciiz "\nInsira o valor da base menor do trapezio: "
	msg3: .asciiz "\nInsira o valor da altura do trapezio"
	msg4: .asciiz "\nArea = "
.text
main:
	# Coleta dos valores
	# Base maior
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Base menor
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Altura
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 5
	syscall
	add $t2, $v0, 0
	
	# Calculo da area
	add $t3, $t0, $t1
	mul $t3, $t3, $t2
	div $t3, $t3, 2
	
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall