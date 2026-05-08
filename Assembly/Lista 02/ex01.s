.data
	msg1: .asciiz "\nInsira um valor em dolar: "
	msg2: .asciiz "\nEm real, isso vale R$"
.text
main:
	# Coleta dos dados
	# Valor em dolar
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Calculo da conversão e print
	mul $t1, $t0, 5
	
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1
	add $a0, $t1, 0
	syscall