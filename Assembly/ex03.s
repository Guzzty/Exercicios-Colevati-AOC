.data
	msg1: .asciiz "\nInsira as horas normais trabalhadas: "
	msg2: .asciiz "\nInsira as horas extras: "
	msg3: .asciiz "\nInsira o desconto (valor inteiro): "
	msg4: .asciiz "\nO salario bruto é R$"
	msg5: .asciiz "\nO salario liquido é R$" 
.text
main:
	# Horas normais
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	mul $t0, $t0, 10
	
	# Horas extras
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	mul $t1, $t1, 15
	
	# Desconto
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 5
	syscall
	add $t2, $v0, 0
	
	# Salario bruto
	add $t3, $t0, $t1
	
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall
	
	# Salario liquido
	mul $t4, $t3, $t2
 	div $t4, $t4, 100
	sub $t4, $t3, $t4
	
	li $v0 4
	la $a0 msg5
	syscall
	
	li $v0 1
	add $a0, $t4, 0
	syscall