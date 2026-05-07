.data
	msg1: .asciiz "\nInsira a nota do primeiro bimestre: "
	msg2: .asciiz "\nInsira a nota do segundo bimestre: "
	msg3: .asciiz "\nInsira a nota do terceiro bimestre: "
	msg4: .asciiz "\nInsira a nota do quarto bimestre: "
	msg5: .asciiz "\nAPROVADO"
	msg6: .asciiz "\nEXAME"
	msg7: .asciiz "\nRETIDO"
.text
main:
	# Coleta dos dados
	# Primeiro bimestre
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Segundo bimestre
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Terceiro bimestre
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 5
	syscall
	add $t2, $v0, 0
	
	# Quarto bimestre
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 5
	syscall
	add $t3, $v0, 0
	
	# Calculo da media
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	add $t4, $t4, $t3
	div $t4, $t4, 4
	
	# Condicional e print das mensagens
	bge $t4, 6, aprovado
	bge $t4, 3, exame
	j retido
	aprovado:
		li $v0 4
		la $a0 msg5
		syscall
		j final
	exame:
		li $v0 4
		la $a0 msg6
		syscall
		j final
	retido:
		li $v0 4
		la $a0 msg7
		syscall
	final: