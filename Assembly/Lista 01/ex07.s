.data
	msg1: .asciiz "\nInsira um numero inteiro: "
	msg2: .asciiz "\nO resultado e: "
.text
main:
	# Receber um valor
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	rem $t1, $t0, 2 # Calcula o resto da divisão por 2
	
	beq $t1, 0, se # Se $t1 == 0, pula para se
	j senao # Caso contrario, pula para senao
	se:
		add $t2, $t0, 5
		j fimse # Pula para fimse
	
	senao:
		add $t2, $t0, 8
	
	fimse:
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall