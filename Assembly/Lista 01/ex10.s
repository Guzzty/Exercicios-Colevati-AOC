.data
	msg1: .asciiz "\nDigite um numero inteiro: "
	msg2: .asciiz "\nDigite outro numero inteiro: "
	msg3: .asciiz "\nResto = "
.text
main:
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
	
	bgt $t0, $t1, se
	j senao
	se:
		div $t2, $t0, $t1
		mul $t3, $t2, $t1
		sub $t4, $t0, $t3
		
		li $v0 4
		la $a0 msg3
		syscall
		
		li $v0 1
		add $a0, $t4, 0
		syscall
		j fimse
	senao:
		div $t2, $t1, $t0
		mul $t3, $t2, $t0
		sub $t4, $t1, $t3
		
		li $v0 4
		la $a0 msg3
		syscall
		
		li $v0 1
		add $a0, $t4, 0
		syscall
	fimse: