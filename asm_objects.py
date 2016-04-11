# Classes for ASM<instr>

# ASM Instructions
# movl
# addl
# addq
# subl
# subq
# imull
# idivl
# jl
# jle
# je
# jnz
# ret
# call
# pushq
# popq
# .label
# cmpl
# negl
# xorl
# xchgl
# cltd
# jmp
# leaq

# Base class for ASM objects with src and dest
class ASMSrcDestBase(object):
	def __init__(self, src, dest):
		self.src = src
		self.dest = dest

# mov src, dest
class ASMMov(ASMSrcDestBase):
	pass

class ASMMovL(ASMMov):
	def __str__(self):
		return "\t\t\tmovl\t" + str(self.src) + ", " + str(self.dest) + "\n"

class ASMMovQ(ASMMov):
	def __str__(self):
		return "\t\t\tmovq\t" + str(self.src) + ", " + str(self.dest) + "\n"

# add src, dest
class ASMAdd(ASMSrcDestBase):
	pass

class ASMAddL(ASMAdd):
	def __str__(self):
		return "\t\t\taddl\t" + str(self.src) + ", " + str(self.dest) + "\n"

class ASMAddQ(ASMAdd):
	def __str__(self):
		return "\t\t\taddq\t" + str(self.src) + ", " + str(self.dest) + "\n"

# sub src, dest
class ASMSub(ASMSrcDestBase):
	pass

class ASMSubL(ASMSub):
	def __str__(self):
		return "\t\t\tsubl\t" + str(self.src) + ", " + str(self.dest) + "\n"

class ASMSubQ(ASMSub):
	def __str__(self):
		return "\t\t\tsubq\t" + str(self.src) + ", " + str(self.dest) + "\n"

# imul src, dest
class ASMImul(ASMSrcDestBase):
	pass

class ASMImulL(ASMImul):
	def __str__(self):
		return "\t\t\timull\t" + str(self.src) + ", " + str(self.dest) + "\n"

# idiv divisor
class ASMIdiv(ASMSrcDestBase):
	pass

class ASMIdivL(ASMIdiv):
	def __init__(self, divisor):
		self.divisor = divisor

	def __str__(self):
		return "\t\t\tidivl\t" + str(self.divisor) + "\n"

# jxx .label
class ASMJmp(object):
	def __init__(self, label):
		self.label = label

	def __str__(self):
		return "\t\t\tjmp\t\t" + str(self.label) + "\n"

class ASMJmpL(ASMJmp):
	def __str__(self):
		return "\t\t\tjl\t\t" + str(self.label) + "\n"

class ASMJmpLe(ASMJmp):
	def __str__(self):
		return "\t\t\tjle\t\t" + str(self.label) + "\n"

class ASMJmpEq(ASMJmp):
	def __str__(self):
		return "\t\t\tje\t\t" + str(self.label) + "\n"

class ASMJmpNz(ASMJmp):
	def __str__(self):
		return "\t\t\tjnz\t\t" + str(self.label) + "\n"

class ASMJmpNe(ASMJmp):
	def __str__(self):
		return "\t\t\tjne\t\t" + str(self.label) + "\n"

# push src
class ASMPushQ(object):
	def __init__(self, src):
		self.src = src

	def __str__(self):
		return "\t\t\tpushq\t" + str(self.src) + "\n"

# pop dest
class ASMPopQ(object):
	def __init__(self, dest):
		self.dest = dest

	def __str__(self):
		return "\t\t\tpopq\t" + str(self.dest) + "\n"

# .label:
class ASMLabel(object):
	def __init__(self, label):
		self.label = label

	def __str__(self):
		return str(self.label) + ":\n"

class ASMCmpBase(ASMSrcDestBase):
	pass

# cmpl src, dest
class ASMCmpL(ASMCmpBase):
	def __str__(self):
		return "\t\t\tcmpl\t" + str(self.src) + ", " + str(self.dest) + "\n"

# cmpq src, dest
class ASMCmpQ(ASMCmpBase):
	def __str__(self):
		return "\t\t\tcmpq\t" + str(self.src) + ", " + str(self.dest) + "\n"

# test reg1, reg2
class ASMTest(ASMSrcDestBase):
	pass

class ASMTestL(ASMTest):
	def __str__(self):
		return "\t\t\ttest\t" + str(self.src) + ", " + str(self.dest) + "\n"

# negl reg
class ASMNegL(object):
	def __init__(self, reg):
		self.reg = reg

	def __str__(self):
		return "\t\t\tnegl\t" + str(self.reg) + "\n"

# xorl src, dest
class ASMXorL(ASMSrcDestBase):
	def __str__(self):
		return "\t\t\txorl\t" + str(self.src) + ", " + str(self.dest) + "\n"

# xchgl src, dest
class ASMXchgL(ASMSrcDestBase):
	def __str__(self):
		return "\t\t\txchgl\t" + str(self.src) + ", " + str(self.dest) + "\n"

# cltd
class ASMCltd(object):
	def __str__(self):
		return "\t\t\tcltd\n"

# leaq src, dest
class ASMLeaQ(ASMSrcDestBase):
	def __str__(self):
		return "\t\t\tleaq\t" + str(self.src) + ", " + str(self.dest) + "\n"

# call function
class ASMCall(object):
	def __init__(self, function_name):
		self.function_name = function_name

	def __str__(self):
		return "\t\t\tcall\t" + str(self.function_name)  + "\n"

# ret
class ASMRet(object):
	def __str__(self):
		return "\t\t\tret\n"

# leave
class ASMLeave(object):
	def __str__(self):
		return "\t\t\tleave\n"

# comments
class ASMComment(object):
	def __init__(self, comment):
		self.comment = comment

	def __str__(self):
		return "\t\t\t## " + str(self.comment) + "\n"

# raw assembly to be output in the file
# Note: The assembly must be formatted by in the custom_string itself
class ASMCustomString(object):
	def __init__(self, custom_string):
		self.custom_string = custom_string

	def __str__(self):
		return self.custom_string + "\n"


if __name__ == "__main__":
	asm_instr_list = []

	# All instructions
	asm_instr_list.append(ASMMovL("$777", "%eax"))
	asm_instr_list.append(ASMAddL("%eax", "%ebx"))
	asm_instr_list.append(ASMAddQ("%rax", "%rbx"))
	asm_instr_list.append(ASMSubL("%eax", "%ebx"))
	asm_instr_list.append(ASMSubQ("%rax", "%rbx"))
	asm_instr_list.append(ASMImulL("%eax", "%ebx"))
	asm_instr_list.append(ASMIdivL("%ecx"))
	asm_instr_list.append(ASMJmpL(".label"))
	asm_instr_list.append(ASMJmpLe(".label"))
	asm_instr_list.append(ASMJmpEq(".label"))
	asm_instr_list.append(ASMJmpNz(".label"))
	asm_instr_list.append(ASMCall("printf"))
	asm_instr_list.append(ASMRet())
	asm_instr_list.append(ASMPushQ("%rax"))
	asm_instr_list.append(ASMPopQ("%rax"))
	asm_instr_list.append(ASMLabel(".label"))
	asm_instr_list.append(ASMCmpL("%eax", "%ebx"))
	asm_instr_list.append(ASMNegL("%eax"))
	asm_instr_list.append(ASMXorL("$1", "%eax"))
	asm_instr_list.append(ASMXchgL("%eax", "%ebx"))
	asm_instr_list.append(ASMCltd())
	asm_instr_list.append(ASMLeaQ("4(%rax)", "%rsi"))

	# Test making a simple plus operation
	# asm_instr_list.append(ASMMovL("$777", "%ebx"))
	# asm_instr_list.append(ASMMovL("$9001", "%ecx"))
	# asm_instr_list.append(ASMMovL("%ebx", "%eax"))
	# asm_instr_list.append(ASMAddL("%ecx", "%eax"))

	for instr in asm_instr_list:
		print instr,