.data

vet1 : .word 8 7 5 3 
vet2 : .word 9 10 17 4 
vet3 : .word 0 0 0 0
n: .word 4
newline: .asciiz ", "

.text

inicio: 
	lw $t0, n
	move $t1, $zero # i do loop
	la $t2, vet1 # armazena o endereço de memória do vetor
	la $t3, vet2 # armazena o endereço de memória do vetor
	la $t4, vet3 # armazena o endereço de memória do 

laco:

	lw $t5, ($t2) #$t5 recebe o conteúdo
	lw $t6, ($t3) #$t6 recebe o conteúdo
	lw $t7, ($t4) #$t7 recebe o conteúdo
	add $t7, $t6, $t5
	add $t1, $t1, 1 # i = i + 1
	add $t2, $t2, 4
	add $t3, $t3, 4
	add $t4, $t4, 4
	li $v0,1 
	move $a0, $t7
	syscall
	bge $t1, $t0, fim
	li $v0, 4
	la $a0, newline 
	syscall
	b laco
fim: 

