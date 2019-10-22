addi $s0,$zero,1 # a = 1
addi $s1,$zero,4 # b = 4
addi $v0,$zero,0 # x = 0
slt $t0,$s1,$s0 # (b < a) torna inv�lida a soma no intervalo
bne $t0,$zero,EXIT # Pulamos para a sa�da do programa

SUM:

addi $sp,$sp,-8 # Seta duas words na pilha
sw $ra,4($sp) # Guarda o valor de $ra na pilha, no primeiro dos dois espa�os de words
sw $s1,0($sp) # Guarda o valor de b na pilha, no segundo espa�o reservado da pilha
slt $t0,$s1,$s0 # Se (b < a) a recurs�o continua, ou seja, � o teste do caso base
beq $t0,$zero,MAIN # Teste do caso base, depois de setar na mem�ria os valores a serem utilizados na "rebobina��o" da recurs�o
addi $sp,$sp,8 # Pop nas duas primeiras words da pilha
jr $ra # Retorno para a main no return adress

MAIN:

addi $s1,$s1,-1 # Decrementa um no valor de b
jal SUM # Chama a fun��o de soma
lw $s1,0($sp) # Atribuimos o valor da mem�ria em b, ou seja, devolvemos o valor para b apenas para somar depois
lw $ra,4($sp) # Atribuimos o valor da mem�ria do pr�ximo endere�o de retorno
addi $sp,$sp,8 # Novamente, damos Pop de duas posi��es na pilha
add $v0,$s1,$v0 # Usamos x = os valores consecutivos de b que se decrementam
jr $ra # Usamos um Jump Register para voltar ao endere�o anteriormente dado para $ra

EXIT: addi $v1,$zero,1 # y = 1