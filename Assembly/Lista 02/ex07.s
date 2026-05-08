.data
	msg1: .asciiz "\nInsira um numero inteiro entre 100 e 999 (valores fora desse intervalo serao desconsiderados): "
	msg2: .asciiz "\nValor invalido."
	msg3: .asciiz "\nCENTENA = "
	msg4: .asciiz "\nDEZENA = "
	msg5: .asciiz "\nUNIDADE = "
.text
main:
	# Coleta dos dados
	# Numero entre 100 e 999
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Condicional para verificar se o valor esta dentro do intervalo
	blt $t0, 100, menor
	bgt $t0, 999, maior
	j intervalo
	
	menor:
		li $v0 4
		la $a0 msg2
		syscall
		
		j main
	
	maior:
		li $v0 4
		la $a0 msg2
		syscall
		
		j main
		
	intervalo:
		# Calculos para exibir centena, dezena e unidade separadamente
		div $t1, $t0, 100
		rem $t2, $t0, 100
		div $t3, $t2, 10
		rem $t4, $t2, 10
		
		# Print do resultado
		# Centena
		li $v0 4
		la $a0 msg3
		syscall
		
		li $v0 1
		add $a0, $t1, 0
		syscall
		
		# Dezena
		li $v0 4
		la $a0 msg4
		syscall
		
		li $v0 1
		add $a0, $t3, 0
		syscall
		
		# Unidade
		li $v0 4
		la $a0 msg5
		syscall
		
		li $v0 1
		add $a0, $t4, 0
		syscall