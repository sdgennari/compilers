# Classes for TAC<instr>
#
# Naming Convention:
# 	assignee, op1, op2 - virtual register
# 	label - label in TAC code
# 	<other> - info that does not need to be referenced outside the class

''' Assignment '''
# x <- y
class TACAssign:
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- " + self.op1

''' Arithmetic '''
# x <- + y z
class TACPlus:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- + " + self.op1 + " " + self.op2

# x <- - y z
class TACMinus:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- - " + self.op1 + " " + self.op2

# x <- * y z
class TACMult:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- * " + self.op1 + " " + self.op2

# x <- / y z
class TACDiv:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- / " + self.op1 + " " + self.op2

''' Comparisons '''
# x <- < y z
class TACCompL:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- < " + self.op1 + " " + self.op2

# x <- <= y z
class TACCompLE:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- <= " + self.op1 + " " + self.op2

# x <- = y z
class TACCompE:
	def __init__(self, assignee, op1, op2):
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- = " + self.op1 + " " + self.op2

''' Constants '''
# x <- int <integer>
class TACConstInt:
	def __init__(self, assignee, val):
		self.assignee = assignee
		self.type = "int"
		self.val = val

	def __str__(self):
		return self.assignee + " <- " + self.type + " " + self.val

# x <- bool <boolean>
class TACConstBool:
	def __init__(self, assignee, val):
		self.assignee = assignee
		self.type = "bool"
		self.val = val

	def __str__(self):
		return self.assignee + " <- " + self.type + " " + self.val

# x <- string\n<string-on-next-line>
class TACConstString:
	def __init__(self, assignee, val):
		self.assignee = assignee
		self.type = "string"
		self.val = val

	def __str__(self):
		return self.assignee + " <- " + self.type + "\n" + self.val

''' Negation '''
# x <- not y
class TACNegBool:
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- not " + self.op1

# x <- ~ y
class TACNegArith:
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- ~ " + self.op1

''' Allocation '''
# x <- new <type>
class TACAlloc:
	def __init__(self, assignee, allocType):
		self.assignee = assignee
		self.type = allocType

	def __str__(self):
		return self.assignee + " <- new " + self.type

''' Default Value '''
# x <- default <type>
class TACDefault:
	def __init__(self, assignee, defType):
		self.assignee = assignee
		self.type = defType

	def __str__(self):
		return self.assignee + " <- default " + self.type

''' Null Check '''
# x <- isvoid y
class TACIsVoid:
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- isvoid " + self.op1

''' Function Calls '''
class TACIOCall:
	pass

# x <- call out_int y
class TACOutInt(TACIOCall):
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- call out_int " + self.op1

# x <- call out_string y
class TACOutString(TACIOCall):
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- call out_string " + self.op1

# x <- call in_int
class TACInInt(TACIOCall):
	def __init__(self, assignee):
		self.assignee = assignee

	def __str__(self):
		return self.assignee + " <- call in_int"

# x <- call in_string
class TACInString(TACIOCall):
	def __init__(self, assignee):
		self.assignee = assignee

	def __str__(self):
		return self.assignee + " <- call in_string"

''' Control Flow '''
class TACControlFlow:
	pass

# jmp <label>
class TACJmp(TACControlFlow):
	def __init__(self, label):
		self.label = label

	def __str__(self):
		return "jmp " + self.label

# label <label>
class TACLabel(TACControlFlow):
	def __init__(self, label):
		self.label = label

	def __str__(self):
		return "label " + self.label

# return x
class TACReturn(TACControlFlow):
	def __init__(self, op1):
		self.op1 = op1

	def __str__(self):
		return "return " + self.op1

# comment <comment>
class TACComment(TACControlFlow):
	def __init__(self, comment):
		self.comment = comment

	def __str__(self):
		return "comment " + self.comment

# bt x <label>
class TACBt(TACControlFlow):
	def __init__(self, op1, label):
		self.op1 = op1
		self.label = label

	def __str__(self):
		return "bt " + self.op1 + " " + self.label

''' Custom TAC Commands '''
class TACCustom:
	pass

class TACStore(TACCustom):
	def __init__(self, op1):
		self.op1 = op1

	def __str__(self):
		return "store " + self.op1

class TACLoad(TACCustom):
	def __init__(self, assignee, location):
		self.assignee = assignee
		self.location = location

	def __str__(self):
		return self.assignee + " <- load loc["+self.location+"]"