.data
	msg1: .asciiz "\nInsira o valor do primeiro cateto: "
	msg2: .asciiz "\nInsira o valor do segundo cateto: "
	msg3: .asciiz "\nO valor da hipotenusa é: "
.text
main:
	# Primeiro cateto
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	mul $t0, $t0, $t0 # cateto**2
	
	# Segundo cateto
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	mul $t1, $t1, $t1
	
	# Calculo hipotenusa
	# Convertendo int para float para calcular a raiz
	add $t2, $t0, $t1
	mtc1 $t2, $f0
	cvt.s.w $f0, $f0
	
	# Calculando a raiz e exibindo o resultado
	sqrt.s $f12, $f0
	
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 2
	syscall