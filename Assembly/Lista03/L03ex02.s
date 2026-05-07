.data
	msg1: .asciiz "\nInsira o raio da circunferência: "
	msg2: .asciiz "\nComprimento = "
.text
main:
	# Coleta dos dados
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Calculo e print do comprimento
	mul $t1, $t0, 6
	
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1
	add $a0, $t1, 0
	syscall