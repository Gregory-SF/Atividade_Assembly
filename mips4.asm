.data

vetor : .word 8 10 5 4 7
n: .word 5
nl: .asciiz "\n"
vir: .asciiz ", "
maiores: .asciiz "\nA quantidade de números maior é: "
menores: .asciiz "\nA quantidade de números menor é: "
.text

inicio: 
	lw $t0, n
	move $t1, $zero # r = 0
	move $t2, $zero # i = 0 
	move $t6, $zero # maior = 0 
	move $t7, $zero # menor = 0 
	la $t3, vetor # armazena o endereço de memória do vetor

laco:
	bge $t2, $t0, meio
	lw $t4, ($t3) #$t4 recebe o conteúdo
	add $t1, $t1, $t4
	add $t2, $t2, 1 # i = i + 1
	add $t3, $t3, 4
	li $v0,1 
	move $a0, $t4
	syscall
	bge $t2, $t0, meio
	add $v0, $zero, 4
	la $a0, vir 
	syscall

	b laco
meio: 
	div $t1, $t0
	mflo $t5 # media = 
	add $v0, $zero, 4
	la $a0, nl 
	syscall
	li $v0,1 
	move $a0, $t5
	syscall
laco2:
	blez $t2, fim
	lw $t4, ($t3) #$t4 recebe o conteúdo
	sub $t2, $t2, 1 # i = i - 1
	sub $t3, $t3, 4
	bge $t5,$t4, maior
	blt $t5, $t4, menor
maior:
	add $t6, $t6, 1
	b laco2
menor:
	add $t7, $t7, 1
	b laco2
	
fim:
	li $v0, 4
	la $a0, maiores 
	syscall
	li $v0, 1 
	move $a0, $t6
	syscall
	li $v0, 4
	la $a0, menores 
	syscall
	li $v0,1 
	move $a0, $t7
	syscall
