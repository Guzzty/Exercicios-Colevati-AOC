.data
	msg1: .asciiz "\nInsira um valor inteiro: "
	msg2: .asciiz "\nInsira outro valor inteiro: "
	msg3: .asciiz "\nO resultado e: "
.text
main:
	# Coleta dos dados
	# Primeiro valor
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Segundo valor
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Condicional para descobrir o valor maior
	bgt $t0, $t1, se
	j senao
	se:
		sub $t2, $t0, $t1
		j fimse
	
	senao:
		sub $t2, $t1, $t0
	
	fimse:
	# Printar o resultado
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall