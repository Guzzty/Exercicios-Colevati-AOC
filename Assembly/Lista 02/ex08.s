.data
	msg1: .asciiz "\nDigite o valor da compra (minimo: R$1000, maximo: R$9999): "
	msg2: .asciiz "\nDigite o valor da parcela (minimo: R$100, maximo: R$500): "
	msg3: .asciiz "\nValor da compra invalido."
	msg4: .asciiz "\nValor da parcela invalido."
	msg5: .asciiz "\nQuantidade de parcelas: "
.text
main:
	# Coleta dos dados
	# Valor da compra
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Condicional para validar valor da compra
	blt $t0, 1000, compra_invalida
	bgt $t0, 9999, compra_invalida
	
	# Coleta do valor da parcela
	le_parcela:
		li $v0 4
		la $a0 msg2
		syscall
		
		li $v0 5
		syscall
		add $t1, $v0, 0
	
	# Condicional para validar valor da parcela
	blt $t1, 100, parcela_invalida
	bgt $t1, 500, parcela_invalida
	
	# Calcular as parcelas
	div $t2, $t0, $t1 # Compra / Parcela = Quantidade de parcelas
	rem $t3, $t0, $t1 # Compra % Parcela = Valor da ultima parcela, caso a divisao nao seja exata
	
	beq $t3, 0, resultado # Se o resto for diferente de 0, vai somar 1 na quantidade de parcelas
	add $t2, $t2, 1
	
	resultado:
		li $v0 4
		la $a0 msg5
		syscall
		
		li $v0 1
		add $a0, $t2, 0
		syscall
		
		j final
	
	compra_invalida:
		li $v0 4
		la $a0 msg3
		syscall
		
		j main
	
	parcela_invalida:
		li $v0 4
		la $a0 msg4
		syscall
		
		j le_parcela
	
	final: