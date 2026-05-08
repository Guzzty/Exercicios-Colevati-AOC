.data
	msg1: .asciiz "\nInsira 10 numeros inteiros reais (negativos serao desconsiderados): "
	msg2: .asciiz "\nValor invalido"
	msg3: .asciiz "\nO menor valor e: "
	msg4: .asciiz "\nO maior valor e: "
.text
main:
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	blt $t0, 0, invalido
	beq $t1, 0, exec1 # Primeira execução, pois o registrador começa em 0 e não tem como verificar o numero menor
	blt $t0, $t2, menor
	bgt $t0, $t3, maior
	j final
	
	invalido:
		li $v0 4
		la $a0 msg2
		syscall
		j main
	
	menor:
		mul $t2, $t2, 0
		add $t2, $t0, 0
		j final
	
	maior:
		mul $t3, $t3, 0
		add $t3, $t0, 0
		j final
	
	exec1:
		add $t2, $t0, 0
		add $t3, $t0, 0
	final:
	add $t1, $t1, 1
	blt $t1, 10, main
	
	# Print dos resultados
	# Valor menor
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall
	
	# Valor maior
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall