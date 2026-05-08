.data
	msg1: .asciiz "\nDigite um numero em um dos intervalos ([0-25], [26-50], [51-75], [76-100]) ou valor negativo para encerrar: "
	msg2: .asciiz "\nValor invalido"
	msg3: .asciiz "\nNo primeiro intervalo [0-25], a quantidade de valores foi: "
	msg4: .asciiz "\nNo segundo intervalo [26-50], a quantidade de valores foi: "
	msg5: .asciiz "\nNo terceiro intervalo [51-75], a quantidade de valores foi: "
	msg6: .asciiz "\nNo quarto intervalo [76-100], a quantidade de valores foi: "
.text
main:
		li $v0 4
		la $a0 msg1
		syscall
		
		li $v0 5
		syscall
		add $t0, $v0, 0
		
		bgt $t0, 100, semaior
		blt $t0, 0, final
		j contadores
		semaior:
			li $v0 4
			la $a0 msg2
			syscall
			j final
		contadores: # Começar vendo os intervalos maiores, pois se começar com o intervalo menor (exemplo: bge $t0, 0, sei1), terei que executar varias vezes no caso de um numero maior
			bge $t0, 76, sei4 # Condicional quarto intervalo
			bge $t0, 51, sei3 # Condicional terceiro intervalo
			bge $t0, 26, sei2 # Condicional segundo intervalo
			j sei1 # Condicional primeiro intervalo
			sei4:
				add $t4, $t4, 1
				j final
			sei3:
				add $t3, $t3, 1
				j final
			sei2:
				add $t2, $t2, 1
				j final
			sei1:
				add $t1, $t1, 1
		final:
	bge $t0, 0, main
	
	# Primeiro intervalo
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t1, 0
	syscall
	
	# Segundo intervalo
	li $v0 4
	la $a0 msg4
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall
	
	# Terceiro intervalo
	li $v0 4
	la $a0 msg5
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall
	
	# Quarto intervalo
	li $v0 4
	la $a0 msg6
	syscall
	
	li $v0 1
	add $a0, $t4, 0
	syscall