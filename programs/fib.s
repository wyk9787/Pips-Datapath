  nop
  li $sp, 0xf800
  li $a0, 4
  li $ra, 200 
fib:
  beq $a0, $zero, first
  nop
  li $t0, 1
  beq $a0, $t0, second
  nop
  addi $sp, $sp, -12
  sw $a0, 4($sp)
  sw $ra, 0($sp)
  addi $a0, $a0, -1
  jal fib
  nop
  sw $v0, 8($sp)
  lw $a0, 4($sp)
  addi $a0, $a0, -2
  jal fib
  nop
  lw $t0, 8($sp)
  add $v0, $v0, $t0
  lw $ra, 0($sp)
  addi $sp, $sp, 12
  jr $ra
  nop
first:
  li $v0, 0
  jr $ra
  nop
second:
  li $v0, 1
  jr $ra
  nop 
