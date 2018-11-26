.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
  li $s2, '\n'
  
loop_top:
  lw $t0, 0($s1)
  beq $t0, $zero, loop_top
  beq $t0, $s2, print
  push $t0
  j loop_top

print:
  li $t1, STACK_TOP
  beq $sp, $t1, exit
  pop $t0
  sw $t0, 0($s0)
  j print
  nop  

exit:
  li $s0, HALT
  jr $s0
