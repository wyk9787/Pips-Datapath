.constant TERMINAL 0xff10
.constant HALT 0xff00

nop # First instruction does not execute
main:
  li $a0, 15
  jal fibonacci
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
  li $t0, TERMINAL     # Load terminal again
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
   
# void fibonacci(int n) {
# 	int first = 0;
# 	int second = 1;
# 	int third = 0;
# 	for (int i = 0; i < n; i++) {
# 		if (i == 0) {
# 			printf("%d ", first);
# 		} else if (i == 1) {
# 			printf("%d ", second);
# 		} else {
# 			third = first + second;
# 			printf("%d ", third);
# 			first = second;
# 			second = third;
# 		}
# 	}
# }
fibonacci:
	li $s0, TERMINAL
	li $t0, 1             # first is 0 
	li $t1, 1	            # second is 0
	li $t2, 0	            # var i for for loop 
	push $ra              #	store $ra		
for:
	slt $t3, $t2, $a0			#	If i is smaller than n then $t3 is 1
	beq $t3, $zero, return # If $t3 is 1 (i < n) end 
	nop
	beq $t2, $zero, loop_zero	#	If i is zero print first
	nop
	li $t3, 1					
	beq $t2, $t3, loop_one #	If i is one print second
	nop
  push $t1
  push $a0
	add $a0, $t0, $t1			# 	a0 = first + second, the fibonacci number we have to print  
  push $a0
  push $t2
	jal print_decimal_number
	nop
  li $t0, 0x0a          # $t0 is a new line character now
  sb $t0, 0($s0)        # Print newline
  pop $t2
  pop $t1
  pop $a0
  pop $t0
	addi $t2, $t2, 1			#	increment i 
	j for
	nop 
loop_zero:
	li $t3, 0x31   				# Load ASCII value for '0'
  sb $t3, 0($s0) 				# Print '0'
  li $t3, 0x0a          # $t3 is a new line character now
  sb $t3, 0($s0)        # Print newline
  addi $t2, $t2, 1			#	increment i 
	j for
	nop
loop_one:
	li $t3, 0x31   				# Load ASCII value for '1'
  sb $t3, 0($s0) 				# Print '1'
  li $t3, 0x0a          # $t3 is a new line character now
  sb $t3, 0($s0)        # Print newline
  addi $t2, $t2, 1			#	increment i 
  j for 
  nop 
return:
  pop $ra
	jr $ra
	nop 
   
  
  
