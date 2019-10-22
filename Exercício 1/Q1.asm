addi $s0,$zero,2 # a = 2
addi $s1,$zero,1 # b = 1
addi $s2,$s0,0 # m = a = 2
slt $t0,$s1,$s2 # (b < m)
beq $t0,$zero,Else # Se $t0 e $zero forem iguais entram no Else
addi $s2,$s1,0 # m = b + 0 = 1 + 0 = 1
j EXIT # Pula para a label EXIT
Else: addi $s2,$zero,0 # m = 0;
EXIT: #Saída
