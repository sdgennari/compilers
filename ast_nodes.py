from tac_objects import *

### AST NODE CLASSES ###
class ASTProgram(object):
	def __init__(self, class_list):
		self.class_list = class_list

	def __str__(self):
		result = str(len(self.class_list))
		for item in self.class_list:
			result += "\n" + str(item)
		return result

class ASTClass(object):
	def __init__(self, type_line, typ, inherits_line, class_inherits, feature_list):
		self.type_line = type_line
		self.typ = typ
		self.inherits_line = inherits_line
		self.class_inherits = class_inherits
		self.feature_list = feature_list

	def __str__(self):
		result = str(self.type_line) + "\n" + str(self.typ) + "\n"
		if self.class_inherits:
			result += "inherits\n"
			result += str(self.inherits_line) + "\n" + str(self.class_inherits) + "\n"
		else:
			result += "no_inherits\n"
		result += str(len(self.feature_list)) if self.feature_list else "0"
		for feature in self.feature_list:
			result += "\n" + str(feature)
		return result

class ASTFeature(object):
	'Super class for attributes and methods'
	pass

class ASTAttrNoInit(ASTFeature):
	def __init__(self, ident_line, ident, type_line, feature_type):
		self.ident_line = ident_line
		self.ident = ident
		self.type_line = type_line
		self.feature_type = feature_type

	def __str__(self):
		result = "attribute_no_init\n"
		result += str(self.ident_line) + "\n" + str(self.ident) + "\n"
		result += str(self.type_line) + "\n" + str(self.feature_type)
		return result

class ASTAttrInit(ASTFeature):
	def __init__(self, ident_line, ident, type_line, feature_type, exp):
		self.ident_line = ident_line
		self.ident = ident
		self.type_line = type_line
		self.feature_type = feature_type
		self.exp = exp

	def __str__(self):
		result = "attribute_init\n"
		result += str(self.ident_line) + "\n" + str(self.ident) + "\n"
		result += str(self.type_line) + "\n" + str(self.feature_type) + "\n"
		result += str(self.exp)
		return result

class ASTMethod(ASTFeature):
	def __init__(self, ident_line, ident, formals_list, type_line, ret_typ, body_exp):
		self.ident_line = ident_line
		self.ident = ident
		self.formals_list = formals_list
		self.type_line = type_line
		self.ret_typ = ret_typ
		self.body_exp = body_exp

	def __str__(self):
		result = "method\n"
		result += str(self.ident_line) + "\n" + str(self.ident) + "\n"
		result += (str(len(self.formals_list)) if self.formals_list else "0") + "\n"
		for formal in self.formals_list:
			result += str(formal) + "\n"
		result += str(self.type_line) + "\n" + str(self.ret_typ) + "\n"
		result += str(self.body_exp)
		return result

class ASTFormal(object):
	def __init__(self, ident_line, ident, type_line, typ):
		self.ident_line = ident_line
		self.ident = ident
		self.type_line = type_line
		self.typ = typ

	def __str__(self):
		result = str(self.ident_line) + "\n" + str(self.ident) + "\n"
		result += str(self.type_line) + "\n" + str(self.formal_type)
		return result

class ASTExp(object):
	'Super class for all expressions'
	pass

class ASTExpAssign(ASTExp):
	def __init__(self, line, ident_line, ident, exp):
		self.line = line
		self.ident_line = ident_line
		self.ident= ident
		self.exp = exp

	def __str__(self):
		return str(self.line) + "\n" + \
			"assign\n" + \
			str(self.ident_line) + "\n" + \
			str(self.ident) + "\n" + \
			str(self.exp)

class ASTExpLet(ASTExp):
	def __init__(self, line, binding_list, exp):
		self.line = line
		self.binding_list = binding_list
		self.exp = exp

	def __str__(self):
		result = str(self.line) + "\n"
		result += "let\n"
		result += (str(len(self.binding_list)) if self.binding_list else "0") + "\n"
		for binding in self.binding_list:
			result += str(binding) + "\n"
		result += str(self.exp)
		return result

# Helper class for let bindings
class ASTExpLetBinding(object):
	def __init__(self, ident_line, ident, type_line, binding_type, exp=None):
		self.ident_line = ident_line
		self.ident = ident
		self.type_line = type_line
		self.binding_type = binding_type
		self.exp = exp

	def __str__(self):
		result = ""
		if self.exp:
			result += "let_binding_init\n"
			result += str(self.ident_line) + "\n" + str(self.ident) + "\n"
			result += str(self.type_line) + "\n" + str(self.binding_type) + "\n"
			result += str(self.exp)
		else:
			result += "let_binding_no_init\n"
			result += str(self.ident_line) + "\n" + str(self.ident) + "\n"
			result += str(self.type_line) + "\n" + str(self.binding_type)
		return result

class ASTExpIfThenElse(ASTExp):
	def __init__(self, line, cond_exp, then_exp, else_exp):
		self.line = line
		self.cond_exp = cond_exp
		self.then_exp = then_exp
		self.else_exp = else_exp

	def __str__(self):
		return str(self.line) + "\n" + \
			"if\n" + \
			str(self.cond_exp) + "\n" + \
			str(self.then_exp) + "\n" + \
			str(self.else_exp)

class ASTExpWhileLoopPool(ASTExp):
	def __init__(self, line, cond_exp, loop_exp):
		self.line = line
		self.cond_exp = cond_exp
		self.loop_exp = loop_exp

	def __str__(self):
		return str(self.line) + "\n" + \
			"while\n" + \
			str(self.cond_exp) + "\n" + \
			str(self.loop_exp)

class ASTExpNew(ASTExp):
	def __init__(self, line, type_line, exp_type):
		self.line = line
		self.type_line = type_line
		self.exp_type = exp_type

	def __str__(self):
		return str(self.line) + "\n" + \
			"new\n" + \
			str(self.type_line) + "\n" + \
			str(self.exp_type)

### Binary Expressions ###
class ASTExpBinaryArith(ASTExp):
	'Super class for all binary arithmetic expressions'
	def __init__(self, line, left_exp, right_exp):
		self.line = line
		self.left_exp = left_exp
		self.right_exp = right_exp

class ASTExpPlus(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"plus\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

class ASTExpMinus(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"minus\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

class ASTExpTimes(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"times\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

class ASTExpDivide(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"divide\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

class ASTExpLt(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"lt\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

class ASTExpLe(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"le\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

class ASTExpEq(ASTExpBinaryArith):
	def __str__(self):
		return str(self.line) + "\n" + \
			"eq\n" + \
			str(self.left_exp) + "\n" + \
			str(self.right_exp)

### Unary Expressions ###
class ASTExpUnary(ASTExp):
	'Superclass for unary expressions'
	def __init__(self, line, exp):
		self.line = line
		self.exp = exp

class ASTExpIsVoid(ASTExpUnary):
	def __str__(self):
		return str(self.line) + "\n" + \
			"isvoid\n" + \
			str(self.exp)

class ASTExpTilde(ASTExpUnary):
	def __str__(self):
		return str(self.line) + "\n" + \
			"negate\n" + \
			str(self.exp)

class ASTExpNot(ASTExpUnary):
	def __str__(self):
		return str(self.line) + "\n" + \
			"not\n" + \
			str(self.exp)

class ASTExpBlock(ASTExp):
	def __init__(self, line, exp_list):
		self.line = line
		self.exp_list = exp_list

	def __str__(self):
		result = str(self.line) + "\n" + \
			"block\n" + \
			str(len(self.exp_list))
		for exp in self.exp_list:
			result += "\n" + str(exp)
		return result

### Dispatch ###
class ASTExpDispatch(ASTExp): pass

class ASTExpDynamicDispatch(ASTExpDispatch):
	def __init__(self, line, caller_exp, ident_line, ident, exp_list=[]):
		self.line = line
		self.caller_exp = caller_exp
		self.ident_line = ident_line
		self.ident = ident
		self.exp_list = exp_list

	def __str__(self):
		result = str(self.line) + "\n" + \
			"dynamic_dispatch\n" + \
			str(self.caller_exp) + "\n" + \
			str(self.ident_line) + "\n" + \
			str(self.ident) + "\n"
		result += (str(len(self.exp_list))) if self.exp_list else "0"
		if self.exp_list:
			for exp in self.exp_list:
				result += "\n" + str(exp)
		return result

class ASTExpStaticDispatch(ASTExpDispatch):
	def __init__(self, line, caller_exp, type_line, static_type, ident_line, ident, exp_list=[]):
		self.line = line
		self.caller_exp = caller_exp
		self.type_line = type_line
		self.static_type = static_type
		self.ident_line = ident_line
		self.ident = ident
		self.exp_list = exp_list

	def __str__(self):
		result = str(self.line) + "\n" + \
			"static_dispatch\n" + \
			str(self.caller_exp) + "\n" + \
			str(self.type_line) + "\n" + \
			str(self.static_type) + "\n" + \
			str(self.ident_line) + "\n" + \
			str(self.ident) + "\n"
		result += (str(len(self.exp_list))) if self.exp_list else "0"
		if self.exp_list:
			for exp in self.exp_list:
				result += "\n" + str(exp)
		return result

class ASTExpSelfDispatch(ASTExp):
	def __init__(self, line, ident_line, ident, exp_list=[]):
		self.line = line
		self.ident_line = ident_line
		self.ident = ident
		self.exp_list = exp_list

	def __str__(self):
		result = str(self.line) + "\n" + \
			"self_dispatch\n" + \
			str(self.ident_line) + "\n" + \
			str(self.ident) + "\n"
		result += (str(len(self.exp_list))) if self.exp_list else "0"
		if self.exp_list:
			for exp in self.exp_list:
				result += "\n" + str(exp)
		return result

### Terminals ###
class ASTExpIdentifier(ASTExp):
	def __init__(self, line, ident_line, ident):
		self.line = line
		self.ident_line = ident_line
		self.ident = ident

	def __str__(self):
		return str(self.line) + "\n" + \
			"identifier\n" + \
			str(self.ident_line) + "\n" + \
			str(self.ident)

class ASTExpString(ASTExp):
	def __init__(self, line, string):
		self.line = line
		self.string = string

	def __str__(self):
		return str(self.line) + "\n" + \
			"string\n" + \
			str(self.string)

class ASTExpInteger(ASTExp):
	def __init__(self, line, integer):
		self.line = line
		self.integer = integer

	def __str__(self):
		return str(self.line) + "\n" + \
			"integer" + "\n" + \
			str(self.integer)

class ASTExpTrue(ASTExp):
	def __init__(self, line):
		self.line = line

	def __str__(self):
		return str(self.line) + "\n" + \
			"true"

class ASTExpFalse(ASTExp):
	def __init__(self, line):
		self.line = line

	def __str__(self):
		return str(self.line) + "\n" + \
			"false"

class ASTExpCase(ASTExp):
	def __init__(self, line, exp, case_exp_list):
		self.line = line
		self.exp = exp
		self.case_exp_list = case_exp_list

	def __str__(self):
		result = str(self.line) + "\n"
		result += "case\n"
		result += str(self.exp) + "\n"
		result += str(len(self.case_exp_list)) if self.case_exp_list else "0"
		for case_elem in self.case_exp_list:
			result += "\n" + str(case_elem)
		return result

class ASTExpCaseElem(object):
	def __init__(self, ident_line, ident, type_line, case_type, exp):
		self.ident_line = ident_line
		self.ident = ident
		self.type_line = type_line
		self.case_type = case_type
		self.exp = exp

	def __str__(self):
		result = str(self.ident_line) + "\n" + str(self.ident) + "\n"
		result += str(self.type_line) + "\n" + str(self.case_type) + "\n"
		result += str(self.exp)
		return result