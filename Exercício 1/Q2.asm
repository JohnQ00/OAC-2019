addi $s0,$zero,1 # a = ...
addi $s1,$zero,2 # b = ...
addi $s2,$zero,0 # x = 0

If: 
slt $t0,$s0,$zero # (a < 0)
bne $t0,$zero,ELSEIF # Se não forem iguais, no caso, (a < 0) sendo 1, entramos no Else if
slt $t0,$s1,$s0 # (a < b)
bne $t0,$zero,ELSEIF # Se não forem iguais, no caso, (b < a) sendo 1, entramos no Else if

addi $s2,$zero,1 # x = 1
j EXIT # Pula para a saída

ELSEIF:
slt $t0,$s1,$s0 # (b < a)
beq $t0,$zero,ELSE # Se $t0 for 1, o programa entrará no Else
slt $t0,$s0,$zero # (a < 0)
beq $t0,$zero,ELSE 

addi $s2,$zero,2 # x = 2
ELSE:
addi $s2,$zero,3 # x = 3

EXIT: