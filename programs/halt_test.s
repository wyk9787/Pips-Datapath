nop
li $sp, 0xf801 
li $t0, 1
li $s0, 3
sw $t0, 4($sp)
sw $s0, 8($sp)
lw $t1, 4($sp)
lw $t2, 8($sp)
j 0xff00
nop

