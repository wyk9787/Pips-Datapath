.constant HALT 0xff00
.constant TERM 0xff10

nop
main:
  li $s0, TERM
  li $t0, 'H'
  sw $t0, 0($s0)
  li $t0, 'e'
  sw $t0, 0($s0)
  li $t0, 'l'
  sw $t0, 0($s0)
  sw $t0, 0($s0)
  li $t0, 'o'
  sw $t0, 0($s0)
  li $t0, ' '
  sw $t0, 0($s0)
  li $t0, 'W'
  sw $t0, 0($s0)
  li $t0, 'o'
  sw $t0, 0($s0)
  li $t0, 'r'
  sw $t0, 0($s0)
  li $t0, 'l'
  sw $t0, 0($s0)
  li $t0, 'd'
  sw $t0, 0($s0)
  li $t0, '!'
  sw $t0, 0($s0)
  li $s0, HALT
  jr $s0
