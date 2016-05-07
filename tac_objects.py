# Classes for TAC<instr>
#
# Naming Convention:
# 	assignee, op1, op2 - virtual register
# 	label - label in TAC code
# 	<other> - info that does not need to be referenced outside the class

''' Assignment '''
# x <- y
class TACAssign:
	def __init__(self, cur_exp_type, assignee, op1):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- " + "t$" + str(self.op1)

''' Arithmetic '''
class TACArith:
	def __init__(self, cur_exp_type, assignee, op1, op2):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

# x <- + y z
class TACPlus(TACArith):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- + " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

# x <- - y z
class TACMinus(TACArith):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- - " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

# x <- * y z
class TACMult(TACArith):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- * " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

# x <- / y z
class TACDiv(TACArith):
	def __init__(self, cur_exp_type, line, assignee, op1, op2):
		self.cur_exp_type = cur_exp_type
		self.line = line
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return "t$" + str(self.assignee) + " <- / " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

''' Comparisons '''
class TACComp:
	def __init__(self, cur_exp_type, assignee, op1, op2):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

# x <- < y z
class TACCompL(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- < " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompLInt(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- < (Int) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompLString(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- < (String) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompLBool(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- < (Bool) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

# x <- <= y z
class TACCompLE(TACComp):
	def __init__(self, cur_exp_type, assignee, op1, op2):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return "t$" + str(self.assignee) + " <- <= " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompLEInt(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- <= (Int) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)	

class TACCompLEString(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- <= (String) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)	

class TACCompLEBool(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- <= (Bool) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)	

# x <- = y z
class TACCompE(TACComp):
	def __init__(self, cur_exp_type, assignee, op1, op2):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1
		self.op2 = op2

	def __str__(self):
		return "t$" + str(self.assignee) + " <- = " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompEInt(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- = (Int) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompEString(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- = (String) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

class TACCompEBool(TACComp):
	def __str__(self):
		return "t$" + str(self.assignee) + " <- = (Bool) " + "t$" + str(self.op1) + " " + "t$" + str(self.op2)

''' Constants '''
# x <- int <integer>
class TACConstInt:
	def __init__(self, cur_exp_type, assignee, val):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.type = "int"
		self.val = val

	def __str__(self):
		return "t$" + str(self.assignee) + " <- " + str(self.type) + " " + str(self.val)

# x <- bool <boolean>
class TACConstBool:
	def __init__(self, cur_exp_type, assignee, val):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.type = "bool"
		self.val = val

	def __str__(self):
		return "t$" + str(self.assignee) + " <- " + str(self.type) + " " + str(self.val)

# x <- string\n<string-on-next-line>
class TACConstString:
	def __init__(self, cur_exp_type, assignee, val):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.type = "string"
		self.val = val

	def __str__(self):
		return "t$" + str(self.assignee) + " <- " + str(self.type) + "\n" + str(self.val)

''' Negation '''
# x <- not y
class TACNegBool:
	def __init__(self, cur_exp_type, assignee, op1):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- not " + "t$" + str(self.op1)

# x <- ~ y
class TACNegArith:
	def __init__(self, cur_exp_type, assignee, op1):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- ~ " + "t$" + str(self.op1)

''' Allocation '''
# x <- new <type>
class TACNew:
	def __init__(self, cur_exp_type, assignee, allocType):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.type = allocType

	def __str__(self):
		return "t$" + str(self.assignee) + " <- new " + str(self.type)

class TACNewSelfType:
	def __init__(self, cur_exp_type, assignee):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee

	def __str__(self):
		return "t$" + str(self.assignee) + " <- new SELF_TYPE"

''' Default Value '''
# x <- default <type>
class TACDefault:
	def __init__(self, cur_exp_type, assignee, defType):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.type = defType

	def __str__(self):
		return "t$" + str(self.assignee) + " <- default " + str(self.type)

''' Null Check '''
# x <- isvoid y
class TACIsVoid:
	def __init__(self, cur_exp_type, assignee, op1):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- isvoid " + "t$" + str(self.op1)

''' Function Calls '''
class TACIOCall:
	pass

# x <- call out_int y
class TACOutInt(TACIOCall):
	def __init__(self, cur_exp_type, assignee, op1):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- call out_int " + "t$" + str(self.op1)

# x <- call out_string y
class TACOutString(TACIOCall):
	def __init__(self, cur_exp_type, assignee, op1):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- call out_string " + "t$" + str(self.op1)

# x <- call in_int
class TACInInt(TACIOCall):
	def __init__(self, cur_exp_type, assignee):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee

	def __str__(self):
		return "t$" + str(self.assignee) + " <- call in_int"

# x <- call in_string
class TACInString(TACIOCall):
	def __init__(self, cur_exp_type, assignee):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee

	def __str__(self):
		return "t$" + str(self.assignee) + " <- call in_string"

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
		return "return " + "t$" + str(self.op1)

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
		return "bt " + "t$" + str(self.op1) + " " + self.label

''' Custom TAC Commands '''
class TACCustom:
	pass

class TACStore(TACCustom):
	def __init__(self, op1):
		self.op1 = op1
	def __str__(self):
		return "store " + "t$" + str(self.op1)

class TACLoad(TACCustom):
	def __init__(self, assignee, location):
		self.assignee = assignee
		self.location = location

	def __str__(self):
		return "t$" + str(self.assignee) + " <- load loc["+str(self.location)+"]"

class TACBox(TACCustom):
	def __init__(self, assignee, op1, exp_type):
		self.assignee = assignee
		self.op1 = op1
		self.exp_type = exp_type

	def __str__(self):
		return "t$" + str(self.assignee) + " <- box (" + str(self.exp_type) + ") " + "t$" + str(self.op1)

class TACUnbox(TACCustom):
	def __init__(self, assignee, op1, exp_type):
		self.assignee = assignee
		self.op1 = op1
		self.exp_type = exp_type

	def __str__(self):
		return "t$" + str(self.assignee) + " <- unbox (" + str(self.exp_type) + ") " + "t$" + str(self.op1)

class TACLoadAttr(TACCustom):
	def __init__(self, assignee, ident):
		self.assignee = assignee
		self.ident = ident

	def __str__(self):
		return "t$" + str(self.assignee) + " <- loadAttr " + str(self.ident) + " (attr)"


class TACStoreAttr(TACCustom):
	def __init__(self, cur_exp_type, ident, op1):
		self.cur_exp_type = cur_exp_type
		self.ident = ident
		self.op1 = op1

	def __str__(self):
		return str(self.ident) + " (attr) <- storeAttr " + "t$" + str(self.op1)

class TACLoadParam(TACCustom):
	def __init__(self, cur_exp_type, assignee, param_idx):
		self.cur_exp_type = cur_exp_type
		self.assignee = assignee
		self.param_idx = param_idx

	def __str__(self):
		return "t$" + str(self.assignee) + " <- param [" + str(self.param_idx) + "]"

class TACStoreParam(TACCustom):
	def __init__(self, cur_exp_type, param_idx, op1):
		self.cur_exp_type = cur_exp_type
		self.param_idx = param_idx
		self.op1 = op1

	def __str__(self):
		return "param [" + str(self.param_idx) + "] <- " + "t$" + str(self.op1)

class TACCall(TACCustom):
	pass

class TACStaticCall(TACCall):
	def __init__(self, cur_exp_type, static_type, method_ident, receiver_obj, params_list, assignee):
		self.cur_exp_type = cur_exp_type
		self.static_type = static_type
		self.method_ident = method_ident
		self.receiver_obj = receiver_obj
		self.params_list = params_list
		self.assignee = assignee

	def __str__(self):
		result = "t$" + str(self.assignee)
		result += " <- static_call "
		result += self.static_type + "." + self.method_ident
		result += " (ro: " + "t$" + str(self.receiver_obj) + ", params: " + str(self.params_list) + ")"
		return result

class TACDynamicCall(TACCall):
	def __init__(self, cur_exp_type, method_ident, receiver_obj, ro_cur_exp_type, params_list, assignee):
		self.cur_exp_type = cur_exp_type
		self.method_ident = method_ident
		self.receiver_obj = receiver_obj
		self.ro_cur_exp_type = ro_cur_exp_type
		self.params_list = params_list
		self.assignee = assignee

	def __str__(self):
		result = "t$" + str(self.assignee)
		result += " <- dynamic_call "
		result += self.method_ident
		result += " (ro: " + "t$" + str(self.receiver_obj) + ", params: " + str(self.params_list) + ")"
		return result

class TACSelfCall(TACCall):
	def __init__(self, cur_exp_type, method_ident, params_list, assignee):
		self.cur_exp_type = cur_exp_type
		self.method_ident = method_ident
		self.params_list = params_list
		self.assignee = assignee

	def __str__(self):
		result = "t$" + str(self.assignee)
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
		return "compare " + "t$" + str(self.op1) + " to " + self.type_name + " and je to " + self.type_case_label

class TACGetTypeTag(TACCustom):
	def __init__(self, assignee, op1):
		self.assignee = assignee
		self.op1 = op1

	def __str__(self):
		return "t$" + str(self.assignee) + " <- type_of(" + "t$" + str(self.op1) + ")"

class TACError(TACCustom):
	def __init__(self, line, error_msg):
		self.line = line
		self.error_msg = error_msg

	def __str__(self):
		return "throw error for line " + str(self.line) + ": " + self.error_msg

class TACAllocType(TACCustom):
	def __init__(self, type_name, obj_size, type_tag):
		self.type_name = type_name
		self.obj_size = obj_size
		self.type_tag = type_tag

	def __str__(self):
		return "self <- space for " + self.type_name + " (tag: " + str(self.type_tag) + ") with size " + str(self.obj_size)

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