.data
	msg1: .asciiz "\nInsira um valor inteiro: "
	msg2: .asciiz "\nInsira outro valor inteiro: "
	msg3: .asciiz "\nA somatoria dos impares entre eles e: "
.text
main:
	# Coleta dos dados
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Contador para somar os impares
	add $t2, $t2, 1
	
	# Condicional para descobrir o valor maior
	bgt $t0, $t1, se
	j senao
	se:
		enq1:
			blt $t2, $t1, increment1
			add $t3, $t3, $t2
			increment1:
				add $t2, $t2, 2
		ble $t2, $t0, enq1 # Vai repetir enquanto o contador for menor ou igual ao valor maior ($t0)
		j fimse
	
	senao:
		enq2:
			blt $t2, $t0, increment2
			add $t3, $t3, $t2
			increment2:
				add $t2, $t2, 2
		ble $t2, $t1, enq2
	
	fimse:
	# Print do resultado
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall