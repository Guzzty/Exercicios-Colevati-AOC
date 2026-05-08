.data
	msg1: .asciiz "\nDigite um numero inteiro negativo ou positivo: "
	msg2: .asciiz "\nO resultado e: "
.text
main:
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	bge $t0, 0, se
	j senao
	se:
		mul $t1, $t0, 2
		j fimse
	
	senao:
		mul $t1, $t0, 3
	
	fimse:
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1
	add $a0, $t1, 0
	syscall