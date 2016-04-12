# Classes for TAC<instr>
#
# Naming Convention:
# 	assignee, op1, op2 - virtual register
# 	label - label in TAC code
# 	<other> - info that does not need to be referenced outside the class

''' Assignment '''
# x <- y
class TACAssign:
	def __init__(self, type_from_ast, assignee, op1):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- " + self.op1

''' Arithmetic '''
# x <- + y z
class TACPlus:
	def __init__(self, type_from_ast, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- + " + self.op1 + " " + self.op2

# x <- - y z
class TACMinus:
	def __init__(self, type_from_ast, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- - " + self.op1 + " " + self.op2

# x <- * y z
class TACMult:
	def __init__(self, type_from_ast, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- * " + self.op1 + " " + self.op2

# x <- / y z
class TACDiv:
	def __init__(self, type_from_ast, line, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.line = line
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- / " + self.op1 + " " + self.op2

''' Comparisons '''
# x <- < y z
class TACCompL:
	def __init__(self, type_from_ast, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- < " + self.op1 + " " + self.op2

# x <- <= y z
class TACCompLE:
	def __init__(self, type_from_ast, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- <= " + self.op1 + " " + self.op2

# x <- = y z
class TACCompE:
	def __init__(self, type_from_ast, assignee, op1, op2):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return self.assignee + " <- = " + self.op1 + " " + self.op2

''' Constants '''
# x <- int <integer>
class TACConstInt:
	def __init__(self, type_from_ast, assignee, val):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.type = "int"
		self.val = val

	def __str__(self):
		return self.assignee + " <- " + self.type + " " + self.val

# x <- bool <boolean>
class TACConstBool:
	def __init__(self, type_from_ast, assignee, val):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.type = "bool"
		self.val = val

	def __str__(self):
		return self.assignee + " <- " + self.type + " " + self.val

# x <- string\n<string-on-next-line>
class TACConstString:
	def __init__(self, type_from_ast, assignee, val):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.type = "string"
		self.val = val

	def __str__(self):
		return self.assignee + " <- " + self.type + "\n" + self.val

''' Negation '''
# x <- not y
class TACNegBool:
	def __init__(self, type_from_ast, assignee, op1):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- not " + self.op1

# x <- ~ y
class TACNegArith:
	def __init__(self, type_from_ast, assignee, op1):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- ~ " + self.op1

''' Allocation '''
# x <- new <type>
class TACAlloc:
	def __init__(self, type_from_ast, assignee, allocType):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.type = allocType

	def __str__(self):
		return self.assignee + " <- new " + self.type

class TACNewSelfType:
	def __init__(self, type_from_ast, assignee):
		self.type_from_ast = type_from_ast
		self.assignee = assignee

	def __str__(self):
		return self.assignee + " <- new SELF_TYPE"

''' Default Value '''
# x <- default <type>
class TACDefault:
	def __init__(self, type_from_ast, assignee, defType):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.type = defType

	def __str__(self):
		return self.assignee + " <- default " + self.type

''' Null Check '''
# x <- isvoid y
class TACIsVoid:
	def __init__(self, type_from_ast, assignee, op1):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- isvoid " + self.op1

''' Function Calls '''
class TACIOCall:
	pass

# x <- call out_int y
class TACOutInt(TACIOCall):
	def __init__(self, type_from_ast, assignee, op1):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- call out_int " + self.op1

# x <- call out_string y
class TACOutString(TACIOCall):
	def __init__(self, type_from_ast, assignee, op1):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- call out_string " + self.op1

# x <- call in_int
class TACInInt(TACIOCall):
	def __init__(self, type_from_ast, assignee):
		self.type_from_ast = type_from_ast
		self.assignee = assignee

	def __str__(self):
		return self.assignee + " <- call in_int"

# x <- call in_string
class TACInString(TACIOCall):
	def __init__(self, type_from_ast, assignee):
		self.type_from_ast = type_from_ast
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

class TACBox(TACCustom):
	def __init__(self, assignee, op1, exp_type):
		self.assignee = assignee
		self.op1 = op1
		self.exp_type = exp_type

	def __str__(self):
		return self.assignee + " <- box (" + self.exp_type + ") " + self.op1

class TACUnbox(TACCustom):
	def __init__(self, assignee, op1, exp_type):
		self.assignee = assignee
		self.op1 = op1
		self.exp_type = exp_type

	def __str__(self):
		return self.assignee + " <- unbox (" + self.exp_type + ") " + self.op1

class TACLoadAttr(TACCustom):
	def __init__(self, assignee, ident):
		self.assignee = assignee
		self.ident = ident

	def __str__(self):
		return self.assignee + " <- loadAttr " + self.ident + " (attr)"


class TACStoreAttr(TACCustom):
	def __init__(self, type_from_ast, ident, op1):
		self.type_from_ast = type_from_ast
		self.ident = ident
		self.op1 = op1

	def __str__(self):
		return self.ident + " (attr) <- storeAttr " + self.op1

class TACLoadParam(TACCustom):
	def __init__(self, type_from_ast, assignee, param_idx):
		self.type_from_ast = type_from_ast
		self.assignee = assignee
		self.param_idx = param_idx

	def __str__(self):
		return self.assignee + " <- param [" + str(self.param_idx) + "]"

class TACStoreParam(TACCustom):
	def __init__(self, type_from_ast, param_idx, op1):
		self.type_from_ast = type_from_ast
		self.param_idx = param_idx
		self.op1 = op1

	def __str__(self):
		return "param [" + str(self.param_idx) + "] <- " + self.op1

class TACCall(TACCustom):
	pass

class TACStaticCall(TACCall):
	def __init__(self, type_from_ast, static_type, method_ident, receiver_obj, params_list, assignee):
		self.type_from_ast = type_from_ast
		self.static_type = static_type
		self.method_ident = method_ident
		self.receiver_obj = receiver_obj
		self.params_list = params_list
		self.assignee = assignee

	def __str__(self):
		result = self.assignee
		result += " <- static_call "
		result += self.static_type + "." + self.method_ident
		result += " (ro: " + self.receiver_obj + ", params: " + str(self.params_list) + ")"
		return result

class TACDynamicCall(TACCall):
	def __init__(self, type_from_ast, method_ident, receiver_obj, ro_type_from_ast, params_list, assignee):
		self.type_from_ast = type_from_ast
		self.method_ident = method_ident
		self.receiver_obj = receiver_obj
		self.ro_type_from_ast = ro_type_from_ast
		self.params_list = params_list
		self.assignee = assignee

	def __str__(self):
		result = self.assignee
		result += " <- dynamic_call "
		result += self.method_ident
		result += " (ro: " + self.receiver_obj + ", params: " + str(self.params_list) + ")"
		return result

class TACSelfCall(TACCall):
	def __init__(self, type_from_ast, method_ident, params_list, assignee):
		self.type_from_ast = type_from_ast
		self.method_ident = method_ident
		self.params_list = params_list
		self.assignee = assignee

	def __str__(self):
		result = self.assignee
		result += " <- self_call "
		result += self.method_ident
		result += " (ro: self, params: " + str(self.params_list) + ")"
		return result

class TACCaseCmpTypesAndJe(TACCustom):
	# Store info about the dest label as well to avoid using boxed Bools
	def __init__(self, op1, type_name, type_case_label):
		self.op1 = op1
		self.type_name = type_name
		self.type_case_label = type_case_label

	def __str__(self):
		return "compare " + self.op1 + " to " + self.type_name + " and je to " + self.type_case_label

class TACGetTypeTag(TACCustom):
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return self.assignee + " <- type_of(" + self.op1 + ")"

class TACError(TACCustom):
	def __init__(self, line, error_msg):
		self.line = line
		self.error_msg = error_msg

	def __str__(self):
		return "throw error for line " + str(self.line) + ": " + self.error_msg


# class TACMakeParamSpace(TACCustom):
# 	def __init__(self, num_params):
# 		self.num_params = num_params

# 	def __str__(self):
# 		return "make space for " + str(self.num_params) + " params"

# class TACRemoveParamSpace(TACCustom):
# 	def __init__(self, num_params):
# 		self.num_params = num_params

# 	def __str__(self):
# 		return "reset stack pointer based on " + str(self.num_params) + " params"

# class TACCall(TACCustom):
# 	def __init__(self, assignee, method_ident, receiver, param_list):
# 		self.assignee = assignee
# 		self.method_ident = method_ident
# 		self.receiver = receiver
# 		self.param_list = param_list

# 	def __str__(self):
# 		result = self.assignee
# 		result += " <- call "
# 		result += self.method_ident + " "
# 		result += self.receiver
# 		for param in self.param_list:
# 			result += " " + param
# 		return result