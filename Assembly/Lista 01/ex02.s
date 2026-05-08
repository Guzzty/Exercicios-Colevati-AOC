.data
	msg1: .asciiz "\nDigite a quantidade de camisetas pequenas: "
	msg2: .asciiz "\nDigite a quantidade de camisetas medias: "
	msg3: .asciiz "\nDigite a quantidade de camisetas grandes: "
	msg4: .asciiz "\nO valor final arrecadado é R$"
.text
main:
	# Camisetas pequenas
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	mul $t0, $t0, 10
	
	# Camisetas medias
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	mul $t1, $t1, 12
	
	# Camisetas grandes
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 5
	syscall
	add $t2, $v0, 0
	
	mul $t2, $t2, 15
	
	# Valor final
	add $t3, $t0, $t1
	add $t3, $t3, $t2
	
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall