addi $s0,$zero,6 # a = 4, valor da posi��o da sequ�ncia de Fibonacci
addi $s1,$zero,0 # b = 0, contador da sequ�ncia de Fibonacci
addi $s2,$zero,1 # c = 0, contador +1 da sequ�ncia de Fibonacci
addi $s3,$zero,0 # d = c + b, contador tempor�rio para manter a soma  

FIBONACCI:

addi $sp,$sp,-20 # Crio na pilha espa�o para 5 vari�veis
sw $ra,16($sp) # $sp = $sp - 16
sw $s0,12($sp) # $sp = $sp - 12
sw $s1,8($sp) # $sp = $sp - 8
sw $s2,4($sp) # $sp = $sp - 4
sw $s3,0($sp) # $sp = $sp - 0
bne $s0,$zero,MAIN # Se o contador dado pelo usu�rio chegar em zero, o programa para.
addi $sp,$sp,20 # O programa d� Pop em 5 vari�veis da pilha
jr $ra # O pulo � feito para o endere�o $ra que o jal cedeu

MAIN:

addi $s0,$s0,-1 # Decrementa-se 1 do valor dado pelo usu�rio
add $s3,$s2,$s1 # c = a + b
add $s1,$s2,$zero # a = b
add $s2,$s3,$zero # b = c, com isso a fila de Fibonacci � movida [0(a),1(b),1,2,3,5] -> [0(a),1(b),1(a+b),2,3,5] -> [0,1(a),1(b),2,3,5]
jal FIBONACCI # Jump and Link, criando o $ra que guarda o endere�o da pr�xima linha
lw $ra, 0($sp) # O programa carrega as vari�veis da pilha que ser�o usadas posteriormente
lw $s0, 4($sp)
lw $s1, 8($sp)
lw $s2, 12($sp)
lw $s3, 16($sp)
addi $sp,$sp,20 # O programa d� Pop em 5 vari�veis
add $v0,$v0,$s1 # Aqui, somamos o valor de a, que acompanha a contagem dada pelo usu�rio e criamos a sa�da
jr $ra # Aqui executa-se novamente o bloco partindo de $ra

EXIT: