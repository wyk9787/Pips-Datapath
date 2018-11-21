# After this test:
# $s0 now holds 3
# $s1 now holds 6
# $s2 now holds 12
# $s3 now holds 24
add_test:
  li $s0, 3          # Load a 3 into $s0
  add $s1, $s0, $s0  # Store $s0 + $s0 into $s1
  add $s2, $s1, $s1  # Store $s1 + $s1 into $s2
  add $s3, $s2, $s2  # Store $s2 + $s2 into $s3

# After this test:
# $t0 now holds 0
# $t1 now holds 1
# $t2 now holds 2
# $t3 now holds 3
addi_test:
  addi $t0, $zero, 0  # Load zero into $t0
  addi $t1, $t0, 1    # Set $t1 to $t0+1
  addi $t2, $t1, 1    # Set $t2 to $t1+1
  addi $t3, $t2, 1    # Set $t3 to $t2+1

# After this test:
# $s0 now holds 7
# $s1 now holds 2
# $s2 now holds 5
# $s3 now holds 3
sub_test:
  li $s0, 7          # Load a 7 into $s0
  li $s1, 2          # Load a 2 into $s1
  sub $s2, $s0, $s1  # Store $s0 - $s1 into $s2
  sub $s3, $s2, $s1  # Store $s2 - $s1 into $s3

# After this test:
# $t0 now holds 6
# $t1 now holds 3
# $t2 now holds 0
# $t3 now holds -3
subi_test:
  addi $t0, $zero, 6  # Load zero into $t0
  subi $t1, $t0, 3    # Set $t1 to $t0-3
  subi $t2, $t1, 3    # Set $t2 to $t1-3
  subi $t3, $t2, 3    # Set $t3 to $t2-3


# After this test:
# $t0 now holds 6
# $t1 now holds 3
# $t2 now holds 0
# $t3 now holds -3
# $s0 now holds 7
# $s1 now holds 2
# $s2 now holds 5
# $s3 now holds 3
nop_test:
  nop
  nop
  nop
  nop

# After this test:
# $t0 now holds 7
# $t1 now holds 1
# $t2 now holds 1
# $t3 now holds 3
and_test:
  li $t0, 7  # Load 7 into $t0
  li $t1, 1  # Load 1 into $t1
  and $t2, $t0, $t1 # Store $t0 and $t1 into $t2 
  andi $t3, $t0, 3  # Store $t0 and 3 into $t2 

# After this test:
# $t0 now holds 7
# $t1 now holds 1
# $t2 now holds 7
# $t3 now holds 7
or_test:
  li $t0, 7  # Load 7 into $t0
  li $t1, 1  # Load 1 into $t1
  or $t2, $t0, $t1 # Store $t0 or $t1 into $t2 
  ori $t3, $t0, 3  # Store $t0 or 3 into $t2 

# After this test:
# $t0 now holds 7
# $t1 now holds 1
# $t2 now holds -2
# $t3 now holds -4
nand_test:
  li $t0, 7  # Load 7 into $t0
  li $t1, 1  # Load 1 into $t1
  nand $t2, $t0, $t1 # Store $t0 nand $t1 into $t2 
  nandi $t3, $t0, 3  # Store $t0 nand 3 into $t2 

# After this test:
# $t0 now holds 7
# $t1 now holds 1
# $t2 now holds -8
# $t3 now holds -8
nor_test:
  li $t0, 7  # Load 7 into $t0
  li $t1, 1  # Load 1 into $t1
  nor $t2, $t0, $t1 # Store $t0 nor $t1 into $t2 
  nori $t3, $t0, 3  # Store $t0 nor 3 into $t2 

# After this test:
# $t0 now holds 7
# $t1 now holds 1
# $t2 now holds 6
# $t3 now holds 4
xor_test:
  li $t0, 7  # Load 7 into $t0
  li $t1, 1  # Load 1 into $t1
  xor $t2, $t0, $t1 # Store $t0 xor $t1 into $t2 
  xori $t3, $t0, 3  # Store $t0 xor 3 into $t2 

# After this test:
# $t0 now holds -3
# $t1 now holds 4
# $t2 now holds 1
# $t3 now holds 0
slt_test:
  li $t0, -3 # Load -3 into $t0
  li $t1, 4  # Load 4 into $t1
  slt $t2, $t0, $t1 # Store $t0 < $t1 into $t2 
  slti $t3, $t0, -5  # Store $t0 < -5 into $t2 

# After this test:
# $t0 now holds -3
# $t1 now holds 4
# $t2 now holds 0
# $t3 now holds 0
slt_test:
  li $t0, -3 # Load -3 into $t0
  li $t1, 4  # Load 4 into $t1
  sltu $t2, $t0, $t1 # Store $t0 < $t1(unsigned) into $t2 
  sltiu $t3, $t0, -5  # Store $t0 < -5(unsigned) into $t2 
