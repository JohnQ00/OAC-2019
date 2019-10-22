addi $s0,$zero,6 # a = 4, valor da posição da sequência de Fibonacci
addi $s1,$zero,0 # b = 0, contador da sequência de Fibonacci
addi $s2,$zero,1 # c = 0, contador +1 da sequência de Fibonacci
addi $s3,$zero,0 # d = c + b, contador temporário para manter a soma  

FIBONACCI:

addi $sp,$sp,-20 # Crio na pilha espaço para 5 variáveis
sw $ra,16($sp) # $sp = $sp - 16
sw $s0,12($sp) # $sp = $sp - 12
sw $s1,8($sp) # $sp = $sp - 8
sw $s2,4($sp) # $sp = $sp - 4
sw $s3,0($sp) # $sp = $sp - 0
bne $s0,$zero,MAIN # Se o contador dado pelo usuário chegar em zero, o programa para.
addi $sp,$sp,20 # O programa dá Pop em 5 variáveis da pilha
jr $ra # O pulo é feito para o endereço $ra que o jal cedeu

MAIN:

addi $s0,$s0,-1 # Decrementa-se 1 do valor dado pelo usuário
add $s3,$s2,$s1 # c = a + b
add $s1,$s2,$zero # a = b
add $s2,$s3,$zero # b = c, com isso a fila de Fibonacci é movida [0(a),1(b),1,2,3,5] -> [0(a),1(b),1(a+b),2,3,5] -> [0,1(a),1(b),2,3,5]
jal FIBONACCI # Jump and Link, criando o $ra que guarda o endereço da próxima linha
lw $ra, 0($sp) # O programa carrega as variáveis da pilha que serão usadas posteriormente
lw $s0, 4($sp)
lw $s1, 8($sp)
lw $s2, 12($sp)
lw $s3, 16($sp)
addi $sp,$sp,20 # O programa dá Pop em 5 variáveis
add $v0,$v0,$s1 # Aqui, somamos o valor de a, que acompanha a contagem dada pelo usuário e criamos a saída
jr $ra # Aqui executa-se novamente o bloco partindo de $ra

EXIT: