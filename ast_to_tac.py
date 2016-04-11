# A.J. Varshneya (ajv4dg)
# Spencer Gennari (sdg6vt)
# CA3
# 3/07/16
# ast_to_tac.py

import sys
from ast_nodes import *

# Initialize global vars
symbol_counter = 0
label_counter = 0
tac_list = []
symbol_table_list = []

### HELPER FUNCTIONS TO GENERATE TAC FROM AST ###
def new_symbol():
	global symbol_counter
	symbol_counter += 1
	return "t$" + str(symbol_counter)

def new_label_num():
	global label_counter
	label_counter += 1
	return str(label_counter)

# Separate this into its own method so get_symbol can handle scope
# Only ever add new symbols to the LAST symbol table (top of stack)
def add_symbol(ident):
	global symbol_table_list
	symbol_table_list[-1][ident] = new_symbol()
	return symbol_table_list[-1][ident]

def get_symbol(ident):
	global symbol_table_list
	# Get index of table at top of stack
	for cur_symbol_table in reversed(symbol_table_list):
		if ident in cur_symbol_table:
			return cur_symbol_table[ident]

	# Symbol not in any of the symbol tables, so not in current scope
	return None
	# symbol_table_list[-1][ident] = new_symbol()
	# return symbol_table_list[-1][ident]

def gen_tac_for_binding(ast_binding):
	# ExpLetBinding (self, ident_line, ident, type_line, binding_type, exp=None)
	global tac_list

	assignee_symbol = add_symbol(ast_binding.ident)

	if ast_binding.exp == None:
		# let_binding_no_init
		tac_list.append(TACDefault(ast_binding.binding_type, assignee_symbol, ast_binding.binding_type))
	else:
		# let_binding_init
		exp_symbol, exp_type_from_ast = gen_tac_for_exp(ast_binding.exp)
		tac_list.append(TACAssign(exp_type_from_ast, assignee_symbol, exp_symbol))

	# NOTE: No need to return a symbol since all items are added to symbol table

def gen_tac_for_box(unboxed_symbol, exp_type):
	boxed_symbol = new_symbol()
	tac_list.append(TACBox(boxed_symbol, unboxed_symbol, exp_type))
	return boxed_symbol

def gen_tac_for_unbox(boxed_symbol, exp_type):
	unboxed_symbol = new_symbol()
	tac_list.append(TACUnbox(unboxed_symbol, boxed_symbol, exp_type))
	return unboxed_symbol

def gen_tac_for_exp(ast_exp):
	global tac_list

	# print ast_exp.__class__.__name__

	# Generate a symbol for the return type
	assignee_symbol = new_symbol()

	if isinstance(ast_exp, ASTExpString):
		# ExpString: (self, line, string)
		tac_list.append(TACConstString(ast_exp.type_from_ast, assignee_symbol, ast_exp.string))

	elif isinstance(ast_exp, ASTExpInteger):
		# ExpInteger: (self, line, integer)
		tac_list.append(TACConstInt(ast_exp.type_from_ast, assignee_symbol, str(ast_exp.integer)))

	elif isinstance(ast_exp, ASTExpTrue):
		# ExpTrue: (self, line)
		tac_list.append(TACConstBool(ast_exp.type_from_ast, assignee_symbol, "true"))

	elif isinstance(ast_exp, ASTExpFalse):
		# ExpFalse: (self, line)
		tac_list.append(TACConstBool(ast_exp.type_from_ast, assignee_symbol, "false"))

	elif isinstance(ast_exp, ASTExpIdentifier):
		# ExpIdentifier: (self, line, ident_line, ident)
		# For an identifier, get appropriate symbol from the symbol table
		maybe_symbol = get_symbol(ast_exp.ident)

		# If the symbol table returned None, then the symbol is an attr
		if maybe_symbol == None:
			ident_symbol = new_symbol()
			tac_list.append(TACLoadAttr(ident_symbol, ast_exp.ident))
		else:
			ident_symbol = maybe_symbol

		# Assign the ident symbol to the asignee symbol
		tac_list.append(TACAssign(ast_exp.type_from_ast, assignee_symbol, ident_symbol))

	elif isinstance(ast_exp, ASTExpIfThenElse):
		# ExpIfThenElse: (self, line, cond_exp, then_exp, else_exp)
		label_num = new_label_num()
		then_label = "if_then_" + str(label_num)
		else_label = "if_else_" + str(label_num)
		exit_label = "if_exit_" + str(label_num)

		# Get condition and negate it
		cond_symbol_boxed, cond_type_from_ast = gen_tac_for_exp(ast_exp.cond_exp)

		# Unbox condition variable
		cond_symbol_unboxed = gen_tac_for_unbox(cond_symbol_boxed, "Bool")

		# Negate condition
		not_cond_symbol_unboxed = new_symbol()
		tac_list.append(TACNegBool(cond_type_from_ast, not_cond_symbol_unboxed, cond_symbol_unboxed))

		# Branch relies on UNBOXED values
		# Branch to 'then' if condition is true
		# Branch to 'else' if condition is not true
		tac_list.append(TACBt(cond_symbol_unboxed, then_label))
		tac_list.append(TACBt(not_cond_symbol_unboxed, else_label))

		# 'then' exp
		tac_list.append(TACComment("then branch"))
		tac_list.append(TACLabel(then_label))
		then_symbol, then_type_from_ast = gen_tac_for_exp(ast_exp.then_exp)
		tac_list.append(TACAssign(then_type_from_ast, assignee_symbol, then_symbol))
		# Jump over 'else' exp
		tac_list.append(TACJmp(exit_label))

		# Label for 'else' exp
		tac_list.append(TACComment("else branch"))
		tac_list.append(TACLabel(else_label))
		else_symbol, else_type_from_ast = gen_tac_for_exp(ast_exp.else_exp)
		tac_list.append(TACAssign(else_type_from_ast, assignee_symbol, else_symbol))
		# Jump to exit label to preserve child info in basic blocks
		tac_list.append(TACJmp(exit_label))

		# If exit label (at very end)
		tac_list.append(TACComment("if-join"))
		tac_list.append(TACLabel(exit_label))

	elif isinstance(ast_exp, ASTExpWhileLoopPool):
		# ExpWhileLoopPool: (self, line, cond_exp, loop_exp)
		label_num = new_label_num()
		start_label = "loop_start_" + str(label_num)
		body_label = "loop_body_" + str(label_num)
		exit_label = "loop_exit_" + str(label_num)

		# Add start label at beginning of loop
		tac_list.append(TACJmp(start_label))
		tac_list.append(TACComment("loop start"))
		tac_list.append(TACLabel(start_label))

		# Get condition and negate it
		cond_symbol_boxed, cond_type_from_ast = gen_tac_for_exp(ast_exp.cond_exp)
		cond_symbol_unboxed = gen_tac_for_unbox(cond_symbol_boxed, "Bool")
		not_cond_symbol_unboxed = new_symbol()
		tac_list.append(TACNegBool(cond_type_from_ast, not_cond_symbol_unboxed, cond_symbol_unboxed))

		# Branch relies on UNBOXED values
		# Branch to exit loop if condition is not true
		tac_list.append(TACBt(cond_symbol_unboxed, body_label))
		tac_list.append(TACBt(not_cond_symbol_unboxed, exit_label))

		# Add loop body label
		tac_list.append(TACComment("loop body"))
		tac_list.append(TACLabel(body_label))
		body_symbol, body_type_from_ast = gen_tac_for_exp(ast_exp.loop_exp)

		# Jmp to start of loop to repeat
		tac_list.append(TACJmp(start_label))

		# Add exit label after end of loop
		tac_list.append(TACComment("loop exit"))
		tac_list.append(TACLabel(exit_label))

		# Make a new default Object as the loop's return type
		tac_list.append(TACDefault("Object", assignee_symbol, "Object"))

	elif isinstance(ast_exp, ASTExpAssign):
		# ExpAssign: (self, line, ident_line, ident, exp)
		# MUST be a value from the symbol table or an attr
		exp_symbol, exp_type_from_ast = gen_tac_for_exp(ast_exp.exp)

		maybe_symbol = get_symbol(ast_exp.ident)
		
		# If the assignee symbol is None, then the ident is an attr
		if maybe_symbol == None:
			tac_list.append(TACStoreAttr(exp_type_from_ast, ast_exp.ident, exp_symbol))
		else:
			assignee_symbol = maybe_symbol

		tac_list.append(TACAssign(exp_type_from_ast, assignee_symbol, exp_symbol))

	elif isinstance(ast_exp, ASTExpBlock):
		# ExpBlock: (self, line, exp_list)
		for block_exp in ast_exp.exp_list:
			last_assignee_symbol, last_type_from_ast = gen_tac_for_exp(block_exp)

		# Special return case for blocks (return assignee_symbol of last exp in block)
		# ---- TODO
		return (last_assignee_symbol, last_type_from_ast)

	elif isinstance(ast_exp, ASTExpNew):
		# ExpNew: (self, line, type_line, exp_type)
		# Handle SELF_TYPE explicitly
		if ast_exp.exp_type == "SELF_TYPE":
			tac_list.append(TACNewSelfType(ast_exp.type_from_ast, assignee_symbol))
		else:
			tac_list.append(TACAlloc(ast_exp.type_from_ast, assignee_symbol, ast_exp.exp_type))

	elif isinstance(ast_exp, ASTExpLet):
		# ExpLet: (self, line, binding_list, exp)

		# Add new symbol table to stack
		symbol_table_list.append({})

		# Assign all variables in the binding_list (between 'let' and 'in')
		for ast_binding in ast_exp.binding_list:
			gen_tac_for_binding(ast_binding)

		# Handle expression after 'in'
		return_symbol, return_type_from_ast = gen_tac_for_exp(ast_exp.exp)

		# Store the 'in' expression in assignee
		tac_list.append(TACAssign(ast_exp.type_from_ast, assignee_symbol, return_symbol))

		# Remove symbol table from stack
		symbol_table_list.pop()

	# Handle binary expressions together
	# ExpBinaryArith: (self, line, left_exp, right_exp)
	elif isinstance(ast_exp, ASTExpPlus):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		tac_list.append(TACPlus(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(unboxed_assignee_symbol, "Int")
		
	elif isinstance(ast_exp, ASTExpMinus):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		tac_list.append(TACMinus(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpTimes):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		tac_list.append(TACMult(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpDivide):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		tac_list.append(TACDiv(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpLt):
		left_symbol, left_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		right_symbol, right_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)
		tac_list.append(TACCompL(ast_exp.type_from_ast, assignee_symbol, left_symbol, right_symbol))

	elif isinstance(ast_exp, ASTExpLe):
		left_symbol, left_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		right_symbol, right_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)
		tac_list.append(TACCompLE(ast_exp.type_from_ast, assignee_symbol, left_symbol, right_symbol))

	elif isinstance(ast_exp, ASTExpEq):
		left_symbol, left_symbol_type_from_ast = gen_tac_for_exp(ast_exp.left_exp)
		right_symbol, right_symbol_type_from_ast = gen_tac_for_exp(ast_exp.right_exp)
		tac_list.append(TACCompE(ast_exp.type_from_ast, assignee_symbol, left_symbol, right_symbol))

	# Handle unary expressions together
	# ExpUnary: (self, line, exp)
	elif isinstance(ast_exp, ASTExpIsVoid):
		exp_symbol, exp_type_from_ast = gen_tac_for_exp(ast_exp.exp)
		tac_list.append(TACIsVoid(ast_exp.type_from_ast, assignee_symbol, exp_symbol))

	elif isinstance(ast_exp, ASTExpTilde):
		# Get the boxed value
		boxed_exp_symbol, boxed_exp_symbol_type_from_ast = gen_tac_for_exp(ast_exp.exp)

		# Unbox the value and do 'not'
		unboxed_exp_symbol = gen_tac_for_unbox(boxed_exp_symbol, "Int")
		unboxed_assignee_symbol = new_symbol()
		tac_list.append(TACNegArith(ast_exp.type_from_ast, unboxed_assignee_symbol, unboxed_exp_symbol))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpNot):
		# Get the boxed value
		boxed_exp_symbol, boxed_exp_symbol_type_from_ast = gen_tac_for_exp(ast_exp.exp)

		# Unbox the value and do 'not'
		unboxed_exp_symbol = gen_tac_for_unbox(boxed_exp_symbol, "Bool")
		unboxed_assignee_symbol = new_symbol()
		tac_list.append(TACNegBool(ast_exp.type_from_ast, unboxed_assignee_symbol, unboxed_exp_symbol))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(unboxed_assignee_symbol, "Bool")

	elif isinstance(ast_exp, ASTExpSelfDispatch):
		# ExpSelfDispatch: (self, line, ident_line, ident, exp_list=[])

		# Generate tac for all parameters in order
		param_symbol_list = []
		for idx, exp in enumerate(ast_exp.exp_list):
			param_symbol, param_type_from_ast = gen_tac_for_exp(exp)
			# Store the param for later use
			tac_list.append(TACStoreParam(param_type_from_ast, idx, param_symbol))
			# Add the param to the list
			param_symbol_list.append(param_symbol)
		
		# # For now, only handle 'out_string' and 'out_int'
		# if ast_exp.ident == "out_string":
		# 	tac_list.append(TACOutString(ast_exp.type_from_ast, assignee_symbol, exp_symbol_list[0]))

		# elif ast_exp.ident == "out_int":
		# 	tac_list.append(TACOutInt(ast_exp.type_from_ast, assignee_symbol, exp_symbol_list[0]))

		# elif ast_exp.ident == "in_string":
		# 	tac_list.append(TACInString(ast_exp.type_from_ast, assignee_symbol))

		# elif ast_exp.ident == "in_int":
		# 	tac_list.append(TACInInt(ast_exp.type_from_ast, assignee_symbol))

		# else:
		method_ident = ast_exp.ident
		params_list = param_symbol_list

		tac_list.append(TACSelfCall(ast_exp.type_from_ast, method_ident, params_list, assignee_symbol))
		# raise NotImplementedError(ast_exp.__class__.__name__ + " for " + ast_exp.ident + " not yet implemented")

	elif isinstance(ast_exp, ASTExpDynamicDispatch):
		# ExpDynamicDispatch: (self, line, caller_exp, ident_line, ident, exp_list=[])

		# Generate tac for all parameters in order
		param_symbol_list = []
		for idx, exp in enumerate(ast_exp.exp_list):
			param_symbol, param_type_from_ast = gen_tac_for_exp(exp)
			# Store the param for later use
			# ---- TODO Consider getting type info for each param
			tac_list.append(TACStoreParam(param_type_from_ast, idx, param_symbol))
			# Add the param to the list
			param_symbol_list.append(param_symbol)

		# Generate tac for receiver object
		ro_symbol, ro_type_from_ast = gen_tac_for_exp(ast_exp.caller_exp)
		
		# # For now, only handle 'out_string' and 'out_int'
		# if ast_exp.ident == "out_string":
		# 	tac_list.append(TACOutString(ast_exp.type_from_ast, assignee_symbol, exp_symbol_list[0]))

		# elif ast_exp.ident == "out_int":
		# 	tac_list.append(TACOutInt(ast_exp.type_from_ast, assignee_symbol, exp_symbol_list[0]))

		# elif ast_exp.ident == "in_string":
		# 	tac_list.append(TACInString(ast_exp.type_from_ast, assignee_symbol))

		# elif ast_exp.ident == "in_int":
		# 	tac_list.append(TACInInt(ast_exp.type_from_ast, assignee_symbol))

		# else:
		# assignee_symbol = gen_tac_for_exp_dynamic_dispatch(ast_exp)
		method_ident = ast_exp.ident
		receiver_obj = ro_symbol
		params_list = param_symbol_list

		tac_list.append(TACDynamicCall(ast_exp.type_from_ast, method_ident, receiver_obj, ro_type_from_ast, params_list, assignee_symbol))
		# raise NotImplementedError(ast_exp.__class__.__name__ + " for " + ast_exp.ident + " not yet implemented")

	elif isinstance(ast_exp, ASTExpStaticDispatch):
		# ExpStaticDispatch: (self, line, caller_exp, type_line, static_type, ident_line, ident, exp_list=[])

		# Generate tac for all parameters in order
		param_symbol_list = []
		for idx, exp in enumerate(ast_exp.exp_list):
			param_symbol, param_type_from_ast = gen_tac_for_exp(exp)
			# Store the param for later use
			tac_list.append(TACStoreParam(param_type_from_ast, idx, param_symbol))
			# Add the param to the list
			param_symbol_list.append(param_symbol)

		# Generate tac for receiver object
		ro_symbol, ro_type_from_ast = gen_tac_for_exp(ast_exp.caller_exp)

		# For now, only handle 'out_string' and 'out_int'
		# if ast_exp.ident == "out_string":
		# 	tac_list.append(TACOutString(ast_exp.type_from_ast, assignee_symbol, exp_symbol_list[0]))

		# if ast_exp.ident == "out_int":
		# 	tac_list.append(TACOutInt(ast_exp.type_from_ast, assignee_symbol, exp_symbol_list[0]))

		# elif ast_exp.ident == "in_string":
		# 	tac_list.append(TACInString(ast_exp.type_from_ast, assignee_symbol))

		# elif ast_exp.ident == "in_int":
		# 	tac_list.append(TACInInt(ast_exp.type_from_ast, assignee_symbol))

		# else:
		static_type = ast_exp.static_type
		method_ident = ast_exp.ident
		receiver_obj = ro_symbol
		params_list = param_symbol_list

		tac_list.append(TACStaticCall(ast_exp.type_from_ast, static_type, method_ident, receiver_obj, params_list, assignee_symbol))

	else:
		raise NotImplementedError(ast_exp.__class__.__name__ + " not yet implemented")

	# Default return case
	return (assignee_symbol, ast_exp.type_from_ast)

def gen_tac_for_feature(ast_feature, class_name):
	global tac_list, symbol_table_list

	if isinstance(ast_feature, ASTMethod):
		# For now, skip classes other than the main method
		# if ast_feature.ident != "main":
		# 	return

		# Add symbol table for method
		symbol_table_list.append({})

		# Label for start of method
		label = str(class_name)+"_"+str(ast_feature.ident)+"_"+new_label_num()
		tac_list.append(TACLabel(label))

		# Add params to the symbol table and add the load param TAC instrs
		for idx, formal in enumerate(ast_feature.formals_list):
			formal_symbol = add_symbol(formal.ident)
			tac_list.append(TACLoadParam(formal.typ, formal_symbol, idx))

		# Generate the tac for the method body
		return_symbol, return_type_from_ast = gen_tac_for_exp(ast_feature.body_exp)
		tac_list.append(TACReturn(return_symbol))

		symbol_table_list.pop()

	# elif isinstance(ast_feature, ASTAttrInit):
	# 	# AttrInit: (self, ident_line, ident, type_line, feature_type, exp)
	# 	attr_symbol = add_symbol(ast_feature.ident)
	# 	exp_symbol, exp_type_from_ast = gen_tac_for_exp(ast_feature.exp)
	# 	tac_list.append(TACAssign(ast_feature.feature_type, attr_symbol, exp_symbol))

	# elif isinstance(ast_feature, ASTAttrNoInit):
	# 	# AttrNoInit: (self, ident_line, ident, type_line, feature_type)
	# 	attr_symbol = add_symbol(ast_feature.ident)
	# 	tac_list.append(TACDefault(ast_feature.feature_type, attr_symbol, ast_feature.feature_type))

# def gen_tac_for_class(ast_class):
# 	# Add symbol table for class since the scope is changing
# 	symbol_table_list.append({})

# 	# For now, skip classes other than the main class
# 	class_typ = ast_class.typ
# 	tac_list.append(TACComment("start class: " + str(class_typ)))

# 	if class_typ != "Main":
# 		symbol_table_list.pop()
# 		tac_list.append(TACComment("end class: " + str(class_typ)))
# 		return

# 	# Generate tac for each feature in the list
# 	for ast_feature in ast_class.feature_list:
# 		gen_tac_for_feature(ast_feature, class_typ)

# 	symbol_table_list.pop()
# 	tac_list.append(TACComment("end class: " + str(class_typ)))

# def gen_tac_for_ast(ast_root):
# 	global symbol_table_list
# 	global tac_list
# 	tac_list.append(TACComment("start"))
# 	for ast_class in ast_root.class_list:
# 		gen_tac_for_class(ast_class)

if __name__ == "__main__":
	input_filename = sys.argv[1]
	# prog_ast_root = get_input_list(input_filename)
	prog_ast_root = get_input_list_from_annotated_ast(input_filename)

	# gen_tac_for_ast(prog_ast_root)

	# for tac_instr in tac_list:
		# print tac_instr

