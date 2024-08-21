.data

vet1 : .word 8 7 5 3 
vet2 : .word 0 0 0 0
n: .word 4
pvet: .asciiz  "["  ", " "]" "\nO maior número do vetor é: "

.text

inicio: 
	lw $t0, n
	li $t1, 1 # i do loop
	la $t2, vet1 # armazena o endereço de memória do vetor
	la $t3, vet2 # armazena o endereço de memória do 
	lw $t5, ($t2) #$t5 recebe o conteúdo
	move $t4, $t5 #menor igual vet 0
	li $t7, 0 # j do loop
	li $v0, 4
	la $t6, pvet
	move $a0, $t6
	syscall
	li $v0, 1 
	move $a0,$t5
	syscall
	li $v0,4       
	add $t6, $t6, 2
	move $a0, $t6
	syscall
	add $t2, $t2, 4

laco:
	lw $t5, ($t2) #$t5 recebe o conteúdo
	add $t1, $t1, 1 # i = i + 1
	add $t2, $t2, 4
	#add $t3, $t3, 4
	li $v0,1 
	move $a0, $t5
	syscall
	blt $t5, $t4, menor
	bge $t1, $t0, meio
	li $v0,4
	move $a0, $t6
	syscall
	b laco

menor:
	move $t4, $t5
	sw  $t5, ($t2)  
	bgt $t1, $t0, meio
	#add $t1, $t1, 1 # i = i + 1
	b laco

meio:
	lw $t9, ($t3) #$t6 recebe o conteúdo
	add $t3, $t3, 4
	add $t7, $t7, 1
	add $t6, $zero, 2
	move $t9, $t4
	bge $t7, $t0, fim
	b laco
fim:

	move $t6,$zero
	li $v0,4
	add $a0, $zero, 4
	add $a0, $t6, 1
	syscall
	li $v0, 4
	add $a0, $t6, 5
	syscall
	li $v0,1 
	move $a0, $t4
	syscall
