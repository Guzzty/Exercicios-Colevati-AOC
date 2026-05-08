.data
	msg1: .asciiz "\nInsira o mes de nascimento: "
	msg2: .asciiz "\nInsira o ano de nascimento: "
	msg3: .asciiz "\nInsira o mes atual: "
	msg4: .asciiz "\nInsira o ano atual: "
	msg5: .asciiz "\nSua idade atual, em meses: "
.text
main:
	# Coleta dos dados
	# Mes de nascimento
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	# Ano de nascimento
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	# Mes atual
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 5
	syscall
	add $t2, $v0, 0
	
	# Ano atual
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 5
	syscall
	add $t3, $v0, 0
	
	# Calculo da idade em meses	Formula utilizada: (anoAtual*12+mesAtual)-(anoNasc*12+mesNasc)
	mul $t4, $t1, 12 # anoNasc*12
	add $t4, $t4, $t0 # anoNasc*12+mesNasc
	
	mul $t5, $t3, 12 # anoAtual*12
	add $t5, $t5, $t2 # anoAtual*12+mesAtual
	
	sub $t6, $t5, $t4
	
	# Print do resultado
	li $v0 4
	la $a0 msg5
	syscall
	
	li $v0 1
	add $a0, $t6, 0
	syscall