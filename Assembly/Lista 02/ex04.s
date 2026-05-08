.data
	msg1: .asciiz "\nInsira o salario atual do funcionario: "
	msg2: .asciiz "\nO aumento de 25% sera, em reais: R$"
	msg3: .asciiz "\nO novo salario, com 25% de aumento: R$"
.text
main:
	# Coleta dos dados
	# Salario atual
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Calculo do novo salario
	mul $t1, $t0, 25
	div $t1, $t1, 100
	add $t2, $t1, $t0 # Salario antes do aumento + 25%
	
	# Print do resultado
	# Valor bruto do aumento
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1
	add $a0, $t1, 0
	syscall
	
	# Valor do novo salario
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall