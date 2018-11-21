import assembler
import pips

# The instruction decorator tells the assembler to create a new syntax rule for add instructions.
# The "#" spots indicate operands, which are passed in as parameters to the function below.
# The second parameter indicates the number of instructions this rule will create (1 in this case)
@assembler.instruction('add #, #, #', 1)
def add(dest, operand1, operand2):
  return pips.rformat(opcode='add', r0=dest, r1=operand1, r2=operand2)

# Encode an addi instruction
@assembler.instruction('addi #, #, #', 1)
def addi(dest, op1, immediate):
  return pips.iformat(opcode='add', r0=dest, r1=op1, imm=immediate)
  
# Encode the li pseudoinstruction using an addition to zero
@assembler.instruction('li #, #', 1)
def li(dest, immediate):
  return addi(dest, '$zero', immediate)

@assembler.instruction('subi #, #, #', 1)
def subi(dest, op1, immediate):
  return pips.iformat(opcode='sub', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('sub #, #, #', 1)
def sub(dest, operand1, operand2):
  return pips.rformat(opcode='sub', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('nop', 1)
def nop():
  return addi('$t0', '$t0', 0) 

@assembler.instruction('and #, #, #', 1)
def and_op(dest, operand1, operand2):
  return pips.rformat(opcode='and', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('andi #, #, #', 1)
def andi(dest, op1, immediate):
  return pips.iformat(opcode='and', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('or #, #, #', 1)
def or_op(dest, operand1, operand2):
  return pips.rformat(opcode='or', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('ori #, #, #', 1)
def ori(dest, op1, immediate):
  return pips.iformat(opcode='or', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('nand #, #, #', 1)
def nand(dest, operand1, operand2):
  return pips.rformat(opcode='nand', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('nandi #, #, #', 1)
def nandi(dest, op1, immediate):
  return pips.iformat(opcode='nand', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('nor #, #, #', 1)
def nor(dest, operand1, operand2):
  return pips.rformat(opcode='nor', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('nori #, #, #', 1)
def nori(dest, op1, immediate):
  return pips.iformat(opcode='nor', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('xor #, #, #', 1)
def xor(dest, operand1, operand2):
  return pips.rformat(opcode='xor', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('xori #, #, #', 1)
def xori(dest, op1, immediate):
  return pips.iformat(opcode='xor', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('slt #, #, #', 1)
def slt(dest, operand1, operand2):
  return pips.rformat(opcode='slt', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('slti #, #, #', 1)
def slti(dest, op1, immediate):
  return pips.iformat(opcode='slt', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('sltu #, #, #', 1)
def sltu(dest, operand1, operand2):
  return pips.rformat(opcode='sltu', r0=dest, r1=operand1, r2=operand2)

@assembler.instruction('sltiu #, #, #', 1)
def sltiu(dest, op1, immediate):
  return pips.iformat(opcode='sltu', r0=dest, r1=op1, imm=immediate)

@assembler.instruction('j #', 1)
def j(immediate):
  return pips.iformat(opcode='j', r0='$zero', r1='$zero', imm=immediate)

@assembler.instruction('jal #', 1)
def jal(immediate):
  return pips.iformat(opcode='j', r0='$ra', r1='$zero', imm=immediate, link=True)
  
@assembler.instruction('jr #', 1)
def jr(dest):
  return pips.rformat(opcode='j', r0='$zero', r1='$zero', r2=dest)
  
@assembler.instruction('beq #, #, #', 1)
def beq(operand1, operand2, immediate):
  return pips.iformat(opcode='beq', r0=operand1, r1=operand2, imm=immediate)

@assembler.instruction('bne #, #, #', 1)
def beq(operand1, operand2, immediate):
  return pips.iformat(opcode='bne', r0=operand1, r1=operand2, imm=immediate)
  
@assembler.instruction('lw #, #(#)', 1)
def lw(operand1, immediate, operand2):
  return pips.iformat(opcode='lw', r0=operand1, r1=operand2, imm=immediate)

@assembler.instruction('lb #, #(#)', 1)
def lb(operand1, immediate, operand2):
  return pips.iformat(opcode='lb', r0=operand1, r1=operand2, imm=immediate)

@assembler.instruction('sw #, #(#)', 1)
def sw(operand1, immediate, operand2):
  return pips.iformat(opcode='sw', r0=operand1, r1=operand2, imm=immediate)

@assembler.instruction('sb #, #(#)', 1)
def sb(operand1, immediate, operand2):
  return pips.iformat(opcode='sb', r0=operand1, r1=operand2, imm=immediate)
