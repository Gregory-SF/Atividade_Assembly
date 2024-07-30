.data

vetor : .word 8 10 5 4 7
n: .word 5

.text

inicio: 
	lw $t0, n
	move $t1, $zero # r = 0
	move $t2, $zero # i = 0 
	la $t3, vetor # armazena o endereço de memória do vetor

laco:
	bge $t2, $t0, fim
	lw $t4, ($t3) #$t4 recebe o conteúdo
	add $t1, $t1, $t4
	add $t2, $t2, 1 # i = i + 1
	add $t3, $t3, 4
	b laco
fim: 
	li $v0,1 
	move $a0, $t1
	syscall
