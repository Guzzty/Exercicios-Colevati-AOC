.data
	msg1: .asciiz "\nInsira o comprimento: "
	msg2: .asciiz "\nInsira a largura:  "
	msg3: .asciiz "\nInsira a altura : "
	msg4: .asciiz "\nVolume = "
.text
main:
	# Coleta dos dados
	# Comprimento
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Largura
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
	
	# Calculo e print do volume
	mul $t3, $t0, $t1
	mul $t3, $t3, $t2
	
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall