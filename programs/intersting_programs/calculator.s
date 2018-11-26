.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
  
loop_top:
  lw $t0, 0($s1)      # Read a character 
  li $t2, '\n'
  beq $t0, $t2, end   # If the character is '\n', then we halt  
  beq $t0, $zero, loop_top # If the character is 0, we go back to the top
  li $t2, '+'
  beq $t0, $t2, loop_top # If the character is +, we go back to the top
  addi $t0, $t0, -48  # Acquire the actual number from the character
  bne $t1, $zero, eval # If this is already the second number, then we eval
  add $s2, $t0, $zero # Save the current character
  li $t1, 1           # Use a flag to indicate we have seen the first number
  j loop_top
eval:
  add $a0, $s2, $t0   # Add two numbers together 
  jal print_decimal_number # Print the sum
  li $t1, 0           # Clear the flag
  j loop_top
end:
  li $s0, HALT
  jr $s0

print_decimal_number:
  li $t0, TERM
  bne $a0, $zero, else # if (n == 0)
  nop
  li $t1, 0x30         # Load ASCII value for '0'
  sb $t1, 0($t0)       # Print "0"
  jr $ra
else:
  li $t2, 10
  push $ra             # Push $ra to the stack
  push $a0             # Push $a0 to the stack 
  li $a1, 10           # $a1 = 10
  jal remainder        # Call remainder(n, 10)
  nop
  add $t2, $v0, $zero  # digit = $t2 = $v0
  pop $a0              # $a0 = n 
  push $t2             # Push digit to the stack  
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
  li $t0, TERM         # Load terminal again
  pop $t2              # Load digit from the stack
  pop $ra              # Load $ra from the stack
  addi $t2, $t2, 0x30  # $t2 = '0' + digit
  sb $t2, 0($t0)       # Print '0' + digit
  jr $ra
  nop

# int remaind(int a, int b) {
#   while(a >= b) {
#    a -= b;
#   }
#   return a;
# } 
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

# int quotient(int a, int b) {
#   int count = 0;
#   while(a >= b) {
#     a -= b;
#     count++;
#   }
#   return count;
# }
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
