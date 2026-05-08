.data
	msg1: .asciiz "\nInsira o dividendo: "
	msg2: .asciiz "\nInsira o divisor (diferente de zero): "
	msg3: .asciiz "\nO resultado e: "
.text
main:
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	add $t0, $v0, 0
	
	mtc1, $t0, $f0
	cvt.s.w $f0, $f0
	
	enquanto:
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 5
	syscall
	add $t1, $v0, 0
	
	beq $t1, 0, enquanto
	
	mtc1 $t1, $f2
	cvt.s.w $f2, $f2
	
	div.s $f12, $f0, $f2
	
	li $v0 4
	la $a0 msg3
	syscall
	
	li $v0 2
	syscall