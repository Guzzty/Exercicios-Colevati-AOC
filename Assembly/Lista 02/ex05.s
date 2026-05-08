.data
	msg1: .asciiz "\nInsira o coeficiente A: "
	msg2: .asciiz "\nInsira o coeficiente B: "
	msg3: .asciiz "\nInsira o coeficiente C: "
	msg4: .asciiz "\nDUAS RAIZES REAIS"
	msg5: .asciiz "\nUMA RAIZ REAL"
	msg6: .asciiz "\nNAO EXISTEM RAIZES REAIS"
.text
main:
	# Coleta dos dados
	# Coeficiente A
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Coeficiente B
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Coeficiente C
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 5
	syscall
	add $t2, $v0, 0
	
	# Calculo de delta	delta = B**2-4*A*C
	mul $t3, $t1, $t1 # B**2
	mul $t4, $t0, -4 # -4*A
	mul $t4, $t4, $t2 # -4*A*C
	add $t5, $t3, $t4 # B**2-4*A*C	Foi utilizado add ao inves de sub, pois sub nao funciona quando o valor de (-4*A*C) e negativo
	
	# Condicional para verificar se delta e menor, igual ou maior que 0
	bgt $t5, 0, maior
	beq $t5, 0, igual
	j menor
	
	maior:
		li $v0 4
		la $a0 msg4
		syscall
		
		j final
		
	igual:
		li $v0 4
		la $a0 msg5
		syscall
		
		j final
	
	menor:
		li $v0 4
		la $a0 msg6
		syscall
		
	final: