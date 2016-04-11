import sys
import copy
from ast_nodes import *
from ast_to_tac import *
from shared_vars import class_map, parent_map, implementation_map

### FUNCTIONS TO BUILD AST FROM INPUT ###
def next_int(input_lines):
	# print input_lines
	return int(input_lines.pop(0))

def next_string(input_lines):
	# print input_lines
	return str(input_lines.pop(0))

def case_elem_from_input(input_lines):
	# ExpCaseElem: (self, ident_line, ident, type_line, case_type, exp)
	ident_line = next_int(input_lines)
	ident = next_string(input_lines)
	type_line = next_int(input_lines)
	case_type = next_string(input_lines)
	exp = exp_from_input(input_lines)
	return ASTExpCaseElem(ident_line, ident, type_line, case_type, exp)

def binding_from_input(input_lines):
	# LetBinding: (self, ident_line, ident, type_line, binding_type, exp=None)
	maybe_init_binding = next_string(input_lines)
	ident_line = next_int(input_lines)
	ident = next_string(input_lines)
	type_line = next_int(input_lines)
	binding_type = next_string(input_lines)

	if maybe_init_binding == "let_binding_init":
		exp = exp_from_input(input_lines)
	else:
		exp = None

	return ASTExpLetBinding(ident_line, ident, type_line, binding_type, exp)

def exp_from_input(input_lines):
	line = next_int(input_lines)
	typ = next_string(input_lines)
	exp_type = next_string(input_lines)

	if exp_type == "internal":
		# ExpInternal: (self, class_method, body_type)
		class_method = next_string(input_lines)
		return ASTExpInternal(typ, class_method, typ)

	elif exp_type == "self_dispatch":
		# ExpSelfDispatch: (self, line, ident_line, ident, exp_list=[])
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)

		exp_list = []
		num_exp = next_int(input_lines)
		for i in range(num_exp):
			exp_list.append(exp_from_input(input_lines))

		return ASTExpSelfDispatch(typ, line, ident_line, ident, exp_list)

	elif exp_type == "dynamic_dispatch":
		# ExpDynamicDispatch: (self, line, caller_exp, ident_line, ident, exp_list=[])
		caller_exp = exp_from_input(input_lines)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)

		exp_list = []
		num_exp = next_int(input_lines)
		for i in range(num_exp):
			exp_list.append(exp_from_input(input_lines))

		# print caller_exp.type_from_ast

		return ASTExpDynamicDispatch(typ, line, caller_exp, ident_line, ident, exp_list)

	elif exp_type == "static_dispatch":
		# ExpStaticDispatch: (self, line, caller_exp, type_line, static_type, ident_line, ident, exp_list=[])
		caller_exp = exp_from_input(input_lines)
		type_line = next_int(input_lines)
		static_type = next_string(input_lines)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)

		exp_list = []
		num_exp = next_int(input_lines)
		for i in range(num_exp):
			exp_list.append(exp_from_input(input_lines))

		return ASTExpStaticDispatch(typ, line, caller_exp, type_line, static_type, ident_line, ident, exp_list)

	elif exp_type == "block":
		# ExpBlock: (self, line, exp_list)
		exp_list = []
		num_exp = next_int(input_lines)
		for i in range(num_exp):
			exp_list.append(exp_from_input(input_lines))

		return ASTExpBlock(typ, line, exp_list)

	### Let Expressions ###
	elif exp_type == "let":
		# ExpLet: (self, line, binding_list, exp)
		binding_list = []
		num_bindings = next_int(input_lines)
		for i in range(num_bindings):
			binding_list.append(binding_from_input(input_lines))

		exp = exp_from_input(input_lines)

		return ASTExpLet(typ, line, binding_list, exp)

	### Case Expressions ###
	elif exp_type == "case":
		# ExpCase: (self, line, exp, case_exp_list)
		exp = exp_from_input(input_lines)

		case_exp_list = []
		num_case_exp = next_int(input_lines)
		for i in range(num_case_exp):
			case_exp_list.append(case_elem_from_input(input_lines))

		return ASTExpCase(typ, line, exp, case_exp_list)

	### If ###
	elif exp_type == "if":
		# ExpIfThenElse: (self, line, cond_exp, then_exp, else_exp)
		cond_exp = exp_from_input(input_lines)
		then_exp = exp_from_input(input_lines)
		else_exp = exp_from_input(input_lines)
		return ASTExpIfThenElse(typ, line, cond_exp, then_exp, else_exp)

	### While ###
	elif exp_type == "while":
		cond_exp = exp_from_input(input_lines)
		loop_exp = exp_from_input(input_lines)
		return ASTExpWhileLoopPool(typ, line, cond_exp, loop_exp)

	### New ###
	elif exp_type == "new":
		type_line = next_int(input_lines)
		exp_type = next_string(input_lines)
		return ASTExpNew(typ, line, type_line, exp_type)

	### Assign ###
	elif exp_type == "assign":
		# ExpAssign: (self, line, ident_line, ident, exp)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)
		exp = exp_from_input(input_lines)
		return ASTExpAssign(typ, line, ident_line, ident, exp)

	### Binary Expressions ###
	elif exp_type == "plus":
		# ExpPlus: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpPlus(typ, line, left_exp, right_exp)

	elif exp_type == "minus":
		# ExpMinus: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpMinus(typ, line, left_exp, right_exp)

	elif exp_type == "times":
		# ExpTimes: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpTimes(typ, line, left_exp, right_exp)

	elif exp_type == "divide":
		# ExpDivide: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpDivide(typ, line, left_exp, right_exp)

	elif exp_type == "lt":
		# ExpLt: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpLt(typ, line, left_exp, right_exp)

	elif exp_type == "le":
		# ExpLe: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpLe(typ, line, left_exp, right_exp)

	elif exp_type == "eq":
		# ExpEq: (line, left_exp, right_exp)
		left_exp = exp_from_input(input_lines)
		right_exp = exp_from_input(input_lines)
		return ASTExpEq(typ, line, left_exp, right_exp)

	### Unary Expressions ###
	elif exp_type == "isvoid":
		# ExpIsVoid: (self, line, exp)
		exp = exp_from_input(input_lines)
		return ASTExpIsVoid(typ, line, exp)

	elif exp_type == "negate":
		# ExpTilde: (self, line, exp)
		exp = exp_from_input(input_lines)
		return ASTExpTilde(typ, line, exp)

	elif exp_type == "not":
		# ExpNot: (self, line, exp)
		exp = exp_from_input(input_lines)
		return ASTExpNot(typ, line, exp)

	### Terminals ###
	elif exp_type == "string":
		# ExpString: (self, line, string)
		string = next_string(input_lines)
		return ASTExpString(typ, line, string)

	elif exp_type == "integer":
		# ExpInteger: (self, line, integer)
		integer = next_int(input_lines)
		return ASTExpInteger(typ, line, integer)

	elif exp_type == "identifier":
		# ExpIdentifier: (self, line, ident_line, ident)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)
		return ASTExpIdentifier(typ, line, ident_line, ident)

	elif exp_type == "true":
		# ExpTrue: (self, line)
		return ASTExpTrue(typ, line)

	elif exp_type == "false":
		# ExpFalse: (self, line)
		return ASTExpFalse(typ, line)

def formal_from_input(input_lines):
	# Formal: (self, ident_line, ident, type_line, typ)
	ident_line = next_int(input_lines)
	ident = next_string(input_lines)
	type_line = next_int(input_lines)
	typ = next_string(input_lines)

	return ASTFormal(ident_line, ident, type_line, typ)

def feature_from_input(input_lines):
	feature_type = next_string(input_lines)

	if feature_type == "method":
		# Method: (self, ident_line, ident, formals_list, type_line, ret_typ, body_exp)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)

		formals_list = []
		num_formals = next_int(input_lines)
		for i in range(num_formals):
			formals_list.append(formal_from_input(input_lines))

		type_line = next_int(input_lines)
		ret_typ = next_string(input_lines)
		body_exp = exp_from_input(input_lines)
		return ASTMethod(ident_line, ident, formals_list, type_line, ret_typ, body_exp)

	elif feature_type == "attribute_init":
		# ExpAttrInit: (self, ident_line, ident, type_line, feature_type, exp)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)
		type_line = next_int(input_lines)
		feature_type = next_string(input_lines)
		exp = exp_from_input(input_lines)
		return ASTAttrInit(ident_line, ident, type_line, feature_type, exp)

	elif feature_type == "attribute_no_init":
		# ExpAttrNoInit: (self, ident_line, ident, type_line, feature_type)
		ident_line = next_int(input_lines)
		ident = next_string(input_lines)
		type_line = next_int(input_lines)
		feature_type = next_string(input_lines)
		return ASTAttrNoInit(ident_line, ident, type_line, feature_type)

def class_from_input(input_lines):
	# Class: (self, type_line, typ, inherits_line, class_inherits, feature_list)
	type_line = next_int(input_lines)
	typ = next_string(input_lines)

	# Get name of parent class if it exists
	maybe_inherits = next_string(input_lines)
	if maybe_inherits == "inherits":
		inherits_line = next_int(input_lines)
		class_inherits = next_string(input_lines)
	else:
		inherits_line = -1
		class_inherits = None

	# Get the features for the class
	num_features = next_int(input_lines)
	feature_list = []
	for i in range(num_features):
		feature_list.append(feature_from_input(input_lines))

	return ASTClass(type_line, typ, inherits_line, class_inherits, feature_list)

def ast_from_input(input_lines):
	num_classes = next_int(input_lines)

	# Get each of the classes in the program
	class_list = []
	for i in range(num_classes):
		class_list.append(class_from_input(input_lines))

	return ASTProgram(class_list)

def get_input_list(filename):
	f = open(filename)
	input_lines = []
	for line in f:
		input_lines.append(line.rstrip())

	return ast_from_input(input_lines)


def make_global_class_map(input_lines):
	global class_map

	# Iterate through each class
	num_classes = next_int(input_lines)
	for i in range(num_classes):
		cur_class = next_string(input_lines)

		# Add empty list to map for cur_class
		class_map[cur_class] = []

		# Iterate through each attr in the class
		attr = None
		num_attrs = next_int(input_lines)
		for j in range(num_attrs):
			maybe_init = next_string(input_lines)
			if maybe_init == "no_initializer":
				ident = next_string(input_lines)
				feature_type = next_string(input_lines)
				attr = ASTAttrNoInit(0, ident, 0, feature_type)
			else:
				ident = next_string(input_lines)
				feature_type = next_string(input_lines)
				exp = exp_from_input(input_lines)
				attr = ASTAttrInit(0, ident, 0, feature_type, exp)

			# Add the attribute to the list of the current class
			class_map[cur_class].append(attr)
		# -- end method loop
	# -- end class loop
	
	# Add hard-coded val attribute to Int, Bool, and String for boxing/unboxing
	class_map["Int"].append(ASTAttrNoInit(0, "val", 0, "raw.Int"))
	class_map["Bool"].append(ASTAttrNoInit(0, "val", 0, "raw.Int"))
	class_map["String"].append(ASTAttrNoInit(0, "val", 0, "raw.String"))

def make_global_implementation_map(input_lines):
	global implementation_map

	# Iterate through each class
	num_classes = next_int(input_lines)
	for i in range(num_classes):
		cur_class = next_string(input_lines)

		# Add empty list to map for cur_class
		implementation_map[cur_class] = []

		# Iterate through each method in the class
		num_methods = next_int(input_lines)
		for j in range(num_methods):
			method_name = next_string(input_lines)

			# Get name of each formal
			num_formals = next_int(input_lines)
			formals_name_list = []
			for k in range(num_formals):
				formals_name_list.append(next_string(input_lines))

			# Get the containing class
			containing_class = next_string(input_lines)

			# Get the method body
			method_body = exp_from_input(input_lines)

			# Make a new method and set its containing class
			method = ASTMethod(0, method_name, formals_name_list, 0, method_body.type_from_ast, method_body)
			method.containing_class = containing_class

			implementation_map[cur_class].append(method)
		# -- end method loop
	# -- end class looop

def update_global_implementation_map(ast_root):
	global implementation_map

	# Iterate through each class
	for ast_class in ast_root.class_list:

		impl_map_method_list = implementation_map[ast_class.typ]

		# Use a copy here to include built-in functions
		new_method_list = copy.copy(impl_map_method_list)

		# Iterate through each ast_feature
		for ast_feature in ast_class.feature_list:
			# Skip attributes
			if not isinstance(ast_feature, ASTMethod):
				continue

			# Find the appropriate feature in the impl map and set its containing class
			for method in impl_map_method_list:
				if ast_feature.ident == method.ident:
					ast_feature.containing_class = method.containing_class
					new_method_list.remove(method)
					new_method_list.append(ast_feature)
					break

		# Set the updated list in the implementation map
		implementation_map[ast_class.typ] = new_method_list

def make_global_parent_map(input_lines):
	global parent_map

	num_classes = next_int(input_lines)
	for i in range(num_classes):
		child = next_string(input_lines)
		parent = next_string(input_lines)
		parent_map[child] = parent

def get_input_list_from_annotated_ast(filename):
	f = open(filename)

	# Read all lines from the file
	input_lines = []
	for line in f:
		input_lines.append(line.rstrip())

	# Deserialize the class map
	line = next_string(input_lines)
	assert (line == "class_map"),"Error: Expecting class_map"
	make_global_class_map(input_lines)

	line = next_string(input_lines)
	assert (line == "implementation_map"),"Error: Expecting implementation_map"
	make_global_implementation_map(input_lines)

	line = next_string(input_lines)
	assert (line == "parent_map"),"Error: Expecting parent_map"
	make_global_parent_map(input_lines)

	ast_root = ast_from_input(input_lines)

	# Update implementation map with values from AST to get type info for formals
	update_global_implementation_map(ast_root)

	return ast_root