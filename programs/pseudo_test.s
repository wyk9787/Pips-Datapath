.constant TERMINAL 0xff10
.constant HALT 0xff00

nop # First instruction does not execute
main:
  li $s0, TERMINAL
  li $a0, 1
  li $a1, 2
  li $a2, 3
  li $a3, 4 
  blt! $a0, $a1, branch1
  nop
after1:
  ble! $a0, $a0, branch2
  nop
after2:
  bgt! $a3, $a2, branch3
  nop
after3:
  bge! $a2, $a1, branch4
  nop
  
branch1:
  li $t0, '1'
  sw $t0, 0($s0)
  j after1 
  nop
branch2:
  li $t0, '2'
  sw $t0, 0($s0)
  j after2 
  nop
branch3:
  li $t0, '3'
  sw $t0, 0($s0)
  j after3 
  nop
branch4:
  li $t0, '4'
  sw $t0, 0($s0)
exit:
  j HALT 
  nop
