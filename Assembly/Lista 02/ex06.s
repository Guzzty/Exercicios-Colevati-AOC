.data
	msg1: .asciiz "\nInsira um numero inteiro: "
	msg2: .asciiz "\nInsira outro numero inteiro: "
	msg3: .asciiz "\nOs numeros sao iguais."
	msg4: .asciiz "\nNumero maior: "
	msg5: .asciiz "\nNumero menor: "
.text
main:
	# Coleta dos dados
	# Primeiro numero
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Segundo numero
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Condicional para verificar se sao iguais e, se nao forem, qual e maior e qual e menor
	beq $t0, $t1, igual
	bgt $t0, $t1, maior
	j menor
	
	igual:
		li $v0 4
		la $a0 msg3
		syscall
		
		j final
		
	maior:
		# Print caso $t0 > $t1
		# Numero maior
		li $v0 4
		la $a0 msg4
		syscall
		
		li $v0 1
		add $a0, $t0, 0
		syscall
		
		# Numero menor
		li $v0 4
		la $a0 msg5
		syscall
		
		li $v0 1
		add $a0, $t1, 0
		syscall
		
		j final
	
	menor:
		# Print caso $t1 > $t0
		# Numero maior
		li $v0 4
		la $a0 msg4
		syscall
		
		li $v0 1
		add $a0, $t1, 0
		syscall
		
		# Numero menor
		li $v0 4
		la $a0 msg5
		syscall
		
		li $v0 1
		add $a0, $t0, 0
		syscall
	
	final: