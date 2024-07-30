.data

vetor : .word 13 2 -51 -143 -9
n: .word 5
pvet: .asciiz  "["  ", " "]" "\nO maior número do vetor é: "

.text

inicio: 
	lw $t0, n
	li $t2, 1 # i = 1 
	la $t3, vetor # armazena o endereço de memória do vetor
	lw $t4, ($t3) #$t4 recebe o conteúdo
	move $t1, $t4 # maior = vetor[0]
	li $v0, 4
	la $t5, pvet
	move $a0, $t5
	syscall
	li $v0, 1 
	move $a0,$t4
	syscall
	li $v0,4       
	add $t5, $t5, 2
	move $a0, $t5   
	syscall
	add $t3, $t3, 4

laco:
	lw $t4, ($t3) #$t4 recebe o conteúdo
	add $t2, $t2, 1 # i = i + 1
	add $t3, $t3, 4
	li $v0,1 
	move $a0, $t4
	syscall
	bgt $t4, $t1, maior
	bge $t2, $t0, fim
	li $v0,4
	move $a0, $t5 
	syscall
	b laco

maior:
	move $t1, $t4
	bge $t2, $t0, fim
	li $v0,4
	move $a0, $t5 
	syscall
	b laco

fim:
	li $v0,4
	add $a0, $t5, 3
	syscall
	li $v0, 4
	add $a0, $t5, 5
	syscall
	li $v0,1 
	move $a0, $t1
	syscall
