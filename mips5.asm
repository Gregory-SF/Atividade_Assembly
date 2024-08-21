.data

n: .word 5
vir: .asciiz " - "
nl: .asciiz "\n"

.text

inicio: 
	lw $t0, n
	move $t1, $zero # r = 0
	li $t2, 1 # i = 0 
	
laco:
	mult $t2, $t2
	mflo $t3
	li $v0,1 
	move $a0, $t2
	syscall
	add $t2, $t2, 1 # i = i + 1
	li $v0, 4
	la $a0, vir 
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	bgt $t2, $t0, fim
	li $v0, 4
	la $a0, nl
	syscall
	b laco

fim:
