MAIN:
addi $s0,$zero,2 # a = 2
addi $s1,$zero,-2 # b = |-2|
addi $s2,$zero,0 # Registrador que checa o sinal do valor "a"
addi $s3,$zero,0 # Registrador que checa o sinal do valor "b"
slt $s2,$s0,$zero # Checa se o valor de "a" é menor que 0 (a < 0), caso (a < 0) = 1
slt $s3,$s1,$zero # Checa se o valor de "b" é menor que 0 (b < 0), caso (b < 0) = 1 

addi $v1,$zero,0 # r = Valor da resposta que acumulará as somas

MULT: beq $s0,$zero,SIGNAL # Se o "a" for igual a zero, movemos para checagem de sinal
add $v1,$v1,$s1 # Adicionamos "b" várias vezes em "r"
j PLUS

PLUS: slt $t0,$zero,$s0 # Se o valor "a" for positivo, t0 = 1
beq $t0,$zero, MINUS # Se t0 = 1, seguimos o fluxo do programa, senão, vamos para o minus
addi $s0,$s0,-1 # Decrementamos normalmente
j MULT

MINUS: addi $s0,$s0,1 # Se t0 = 0, paramos aqui e somamos 1, pois, nesse caso, o número dado é negativo
j MULT

SIGNAL_SWAP: sub $v1,$zero,$v1 # Subtraímos de 0 para inverter o sinal do valor
j EXIT

POSITIVE: slt $t0,$zero,$v1 # Se o "r" for positivo, t0 = 1
beq $t0,$zero,SIGNAL_SWAP # Se t0 = 0, ou seja, o resultado for negativo, invertemos o sinal
j EXIT

SIGNAL: beq $s2,$s3, POSITIVE # Checa se o sinal dos números da multiplicação são iguais
NEGATIVO: slt $t1,$zero,$v1 # Se forem diferentes, é checado se o resultado é negativo, se for, t1 = 0
bne $t1,$zero, SIGNAL_SWAP # Se o "r" for positivo, trocamos o sinal, se não for, mantemos o sinal negativo dele

EXIT:

