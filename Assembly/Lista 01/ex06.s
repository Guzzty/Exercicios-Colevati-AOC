.data
	msg1: .asciiz "\nInsira o valor de A: "
	msg2: .asciiz "\nInsira o valor de B: "
	msg3: .asciiz "\nC = "
.text
main:
	# Receber o valor de A
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Receber o valor de B
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	beq $t0, $t1, se # Verifica se os números são iguais
	j senao # Se a verificação for falsa, pula para o senao:
	se:
		add $t2, $t0, $t1
		j fimse # Pula para o final da estrutura condicional
	
	senao:
		mul $t2, $t0, $t1
	
	fimse:
	# Printa o resultado final
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall