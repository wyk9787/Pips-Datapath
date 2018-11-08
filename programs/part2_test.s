  nop
  addi $t0, $zero, 0
somewhere:
  addi $t0, $t0, 1
  addi $t1, $t0, 2
  addi $t2, $t0, 0
  beq  $t0, $t2, beq_res 
  nop
  j somewhere
other:
  bne  $t0, $t1, bne_res 
  nop
beq_res:
  jal func1
  nop  
  j other 
  nop
bne_res:
  jal func2
  nop  
  j somewhere 
  nop
func1:
  addi $s0, $zero, 1
  jr $ra
  nop
func2:
  addi $s1, $zero, 2
  jr $ra
  nop
  
