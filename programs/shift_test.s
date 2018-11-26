.constant TERMINAL 0xff10
.constant HALT 0xff00

nop # First instruction does not execute
main:
  li $a0, 1
  li $a1, -1
  li $a2, -8
  sll $a0, $a0, 2  # $a0 = $a0 << 2 = 4
  srl $a1, $a1, 15 # $a1 = $a1 >> 15 = 1 (logical right shift)
  sra $a2, $a2, 2 # $a2 = $a2 >> 2 = -2  (arithmetic right shift)

  j HALT 
  nop
