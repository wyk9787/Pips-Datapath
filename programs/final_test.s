.constant TERMINAL 0xff10
.constant HALT 0xff00

nop # First instruction does not execute
main:
  li $a0, 127
  jal print_decimal_number
  nop
  j HALT 
  nop
print_decimal_number:
  li $t0, TERMINAL
  bne $a0, $zero, else # if (n == 0)
  nop
  li $t1, 0x30         # Load ASCII value for '0'
  sb $t1, 0($t0)       # Print "0"
else:
  li $t2, 10
  addi $sp, $sp, -6    # Leave six bytes on the stack
  sw $a0, 2($sp)       # Push $a0 to the stack 
  sw $ra, 0($sp)       # Push $ra to the stack
  li $a1, 10           # $a1 = 10
  jal remainder        # Call remainder(n, 10)
  nop
  add $t2, $v0, $zero  # digit = $t2 = $v0
  lw $a0, 2($sp)       # $a0 = n 
  sw $t2, 4($sp)       # Push digit to the stack  
  slt $t3, $t2, $a0    # if (digit < n), $t3 = 1, otherwise, $t3 = 0
  beq $t3, $zero, last 
  nop
  li $a1, 10           # $a1 = 10 
  jal quotient         # Call quotient(n, 10)
  nop 
  add $a0, $v0, $zero  # $a0 = $v0 = n / 10
  jal print_decimal_number
  nop
last:
  li $t0, TERMINAL     # Load terminal again
  lw $t2, 4($sp)       # Load digit from the stack
  lw $ra, 0($sp)       # Load $ra from the stack
  addi $t2, $t2, 0x30  # $t2 = '0' + digit
  sb $t2, 0($t0)       # Print '0' + digit
  addi $sp, $sp, 6     # Restore the stack
  jr $ra
  nop
   
remainder:
  slt $t0, $a0, $a1   
  beq $t0, $zero, while_remainder
  nop
  add $v0, $a0, $zero
  jr $ra
  nop
while_remainder:
  sub $a0, $a0, $a1
  j remainder
  nop

quotient:
  li $t1, 0
quotient_top:
  slt $t0, $a0, $a1   
  beq $t0, $zero, while_quotient
  nop
  add $v0, $t1, $zero
  jr $ra
  nop
while_quotient:
  sub $a0, $a0, $a1
  addi $t1, $t1, 1
  j quotient_top 
  nop
   
  
   
  
  
