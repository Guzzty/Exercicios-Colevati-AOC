.data
	msg1: .asciiz "\nInsira a altura, em centimetros (valores negativos e 0 serao desconsiderados): "
	msg2: .asciiz "\nA menor altura em centimetros: "
	msg3: .asciiz "\nA maior altura em centimetros: "
	msg4: .asciiz "\nValor invalido"
.text
main:
		li $v0 4
		la $a0 msg1
		syscall
		
		li $v0 5
		syscall
		add $t0, $v0, 0
		
		ble $t0, 0, invalido
		
		add $t1, $t1, 1 # Contador
		
		ble $t1, 1, exec1 # Nao posso verificar a menor altura na primeira execucao, como o registrador é 0, preciso somar o primeiro valor antes de começar as comparacoes
		
		blt $t0, $t2, semenor
		bgt $t0, $t3, semaior
		j final
		
		semenor:
			mul $t2, $t2, 0
			add $t2, $t0, 0
			j final
		
		semaior:
			mul $t3, $t3, 0
			add $t3, $t0, 0
			j final
		
		exec1:
			add $t2, $t0, 0
			add $t3, $t0, 0
			j final
		
		invalido:
			li $v0 4
			la $a0 msg4
			syscall
	final:
	blt $t1, 15, main # Executa enquanto o contador nao alcançar 15, para coletar as 15 alturas
	
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1
	add $a0, $t2, 0
	syscall
	
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 1
	add $a0, $t3, 0
	syscall