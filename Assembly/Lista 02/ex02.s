.data
	msg1: .asciiz "\nInsira o valor do primeiro registrador: "
	msg2: .asciiz "\nInsira o valor do segundo registrador: "
	msg3: .asciiz "\nO primeiro registrador, apos a troca: "
	msg4: .asciiz "\nO segundo registrador, apos a troca: "
.text
main:
	# Coleta dos dados
	# Primeiro registrador
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Segundo registrador
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Troca do valor dos registradores
	add $t0, $t0, $t1
	sub $t1, $t0, $t1
	sub $t0, $t0, $t1
	
	# Print do resultado
	# Primeiro registrador
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t0, 0
	syscall
	
	# Segundo registrador
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t1, 0
	syscall