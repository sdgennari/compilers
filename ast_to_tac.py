# A.J. Varshneya (ajv4dg)
# Spencer Gennari (sdg6vt)
# CA3
# 3/07/16
# ast_to_tac.py

import sys
from ast_nodes import *
from shared_vars import class_map, parent_map

# Initialize global vars
symbol_counter = 0
label_counter = 0

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
def add_symbol(symbol_table_list, ident):
	symbol_table_list[-1][ident] = new_symbol()
	return symbol_table_list[-1][ident]

def get_symbol(symbol_table_list, ident):
	# Get index of table at top of stack
	for cur_symbol_table in reversed(symbol_table_list):
		if ident in cur_symbol_table:
			return cur_symbol_table[ident]

	# Symbol not in any of the symbol tables, so not in current scope
	return None

def gen_tac_for_binding(symbol_table_list, cur_tac_list, ast_binding):
	# ExpLetBinding (self, ident_line, ident, type_line, binding_type, exp=None)

	if ast_binding.exp == None:
		# let_binding_no_init
		assignee_symbol = add_symbol(symbol_table_list, ast_binding.ident)
		cur_tac_list.append(TACDefault(ast_binding.binding_type, assignee_symbol, ast_binding.binding_type))
	else:
		# let_binding_init
		exp_symbol, cur_exp_type = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_binding.exp)
		# Note: Add assignee symbol AFTER evaluating the init expression
		assignee_symbol = add_symbol(symbol_table_list, ast_binding.ident)
		cur_tac_list.append(TACAssign(cur_exp_type, assignee_symbol, exp_symbol))

	# NOTE: No need to return a symbol since all items are added to symbol table

def gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_symbol, exp_type):
	boxed_symbol = new_symbol()
	cur_tac_list.append(TACBox(boxed_symbol, unboxed_symbol, exp_type))
	return boxed_symbol

def gen_tac_for_unbox(symbol_table_list, cur_tac_list, boxed_symbol, exp_type):
	unboxed_symbol = new_symbol()
	cur_tac_list.append(TACUnbox(unboxed_symbol, boxed_symbol, exp_type))
	return unboxed_symbol

def gen_tac_for_exp(symbol_table_list, cur_tac_list, ast_exp):
	# global tac_list

	# print ast_exp.__class__.__name__

	# Generate a symbol for the return type
	assignee_symbol = new_symbol()

	if isinstance(ast_exp, ASTExpString):
		# ExpString: (self, line, string)
		cur_tac_list.append(TACConstString(ast_exp.type_from_ast, assignee_symbol, ast_exp.string))

	elif isinstance(ast_exp, ASTExpInteger):
		# ExpInteger: (self, line, integer)
		cur_tac_list.append(TACConstInt(ast_exp.type_from_ast, assignee_symbol, str(ast_exp.integer)))

	elif isinstance(ast_exp, ASTExpTrue):
		# ExpTrue: (self, line)
		cur_tac_list.append(TACConstBool(ast_exp.type_from_ast, assignee_symbol, "true"))

	elif isinstance(ast_exp, ASTExpFalse):
		# ExpFalse: (self, line)
		cur_tac_list.append(TACConstBool(ast_exp.type_from_ast, assignee_symbol, "false"))

	elif isinstance(ast_exp, ASTExpIdentifier):
		# ExpIdentifier: (self, line, ident_line, ident)
		# For an identifier, get appropriate symbol from the symbol table
		maybe_symbol = get_symbol(symbol_table_list, ast_exp.ident)

		# If the symbol table returned None, then the symbol is an attr
		if maybe_symbol == None:
			ident_symbol = new_symbol()
			cur_tac_list.append(TACLoadAttr(ident_symbol, ast_exp.ident))
		else:
			ident_symbol = maybe_symbol

		# Assign the ident symbol to the asignee symbol
		cur_tac_list.append(TACAssign(ast_exp.type_from_ast, assignee_symbol, ident_symbol))

	elif isinstance(ast_exp, ASTExpIfThenElse):
		# ExpIfThenElse: (self, line, cond_exp, then_exp, else_exp)
		label_num = new_label_num()
		then_label = "if_then_" + str(label_num)
		else_label = "if_else_" + str(label_num)
		exit_label = "if_exit_" + str(label_num)

		# Get condition and negate it
		cond_symbol_boxed, cond_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.cond_exp)

		# Unbox condition variable
		cond_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, cond_symbol_boxed, "Bool")

		# Negate condition
		not_cond_symbol_unboxed = new_symbol()
		cur_tac_list.append(TACNegBool(cond_type_from_ast, not_cond_symbol_unboxed, cond_symbol_unboxed))

		# Branch relies on UNBOXED values
		# Branch to 'then' if condition is true
		# Branch to 'else' if condition is not true
		cur_tac_list.append(TACBt(cond_symbol_unboxed, then_label))
		cur_tac_list.append(TACBt(not_cond_symbol_unboxed, else_label))

		# 'then' exp
		cur_tac_list.append(TACComment("then branch"))
		cur_tac_list.append(TACLabel(then_label))
		then_symbol, then_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.then_exp)
		cur_tac_list.append(TACAssign(then_type_from_ast, assignee_symbol, then_symbol))
		# Jump over 'else' exp
		cur_tac_list.append(TACJmp(exit_label))

		# Label for 'else' exp
		cur_tac_list.append(TACComment("else branch"))
		cur_tac_list.append(TACLabel(else_label))
		else_symbol, else_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.else_exp)
		cur_tac_list.append(TACAssign(else_type_from_ast, assignee_symbol, else_symbol))
		# Jump to exit label to preserve child info in basic blocks
		cur_tac_list.append(TACJmp(exit_label))

		# If exit label (at very end)
		cur_tac_list.append(TACComment("if-join"))
		cur_tac_list.append(TACLabel(exit_label))

	elif isinstance(ast_exp, ASTExpWhileLoopPool):
		# ExpWhileLoopPool: (self, line, cond_exp, loop_exp)
		label_num = new_label_num()
		start_label = "loop_start_" + str(label_num)
		body_label = "loop_body_" + str(label_num)
		exit_label = "loop_exit_" + str(label_num)

		# Add start label at beginning of loop
		cur_tac_list.append(TACJmp(start_label))
		cur_tac_list.append(TACComment("loop start"))
		cur_tac_list.append(TACLabel(start_label))

		# Get condition and negate it
		cond_symbol_boxed, cond_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.cond_exp)
		cond_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, cond_symbol_boxed, "Bool")
		not_cond_symbol_unboxed = new_symbol()
		cur_tac_list.append(TACNegBool(cond_type_from_ast, not_cond_symbol_unboxed, cond_symbol_unboxed))

		# Branch relies on UNBOXED values
		# Branch to exit loop if condition is not true
		cur_tac_list.append(TACBt(cond_symbol_unboxed, body_label))
		cur_tac_list.append(TACBt(not_cond_symbol_unboxed, exit_label))

		# Add loop body label
		cur_tac_list.append(TACComment("loop body"))
		cur_tac_list.append(TACLabel(body_label))
		body_symbol, body_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.loop_exp)

		# Jmp to start of loop to repeat
		cur_tac_list.append(TACJmp(start_label))

		# Add exit label after end of loop
		cur_tac_list.append(TACComment("loop exit"))
		cur_tac_list.append(TACLabel(exit_label))

		# Make a new default Object as the loop's return type
		cur_tac_list.append(TACDefault("Object", assignee_symbol, "Object"))

	elif isinstance(ast_exp, ASTExpAssign):
		# ExpAssign: (self, line, ident_line, ident, exp)
		# MUST be a value from the symbol table or an attr
		exp_symbol, cur_exp_type = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.exp)

		maybe_symbol = get_symbol(symbol_table_list, ast_exp.ident)
		
		# If the assignee symbol is None, then the ident is an attr
		if maybe_symbol == None:
			cur_tac_list.append(TACStoreAttr(cur_exp_type, ast_exp.ident, exp_symbol))
		else:
			assignee_symbol = maybe_symbol

		cur_tac_list.append(TACAssign(cur_exp_type, assignee_symbol, exp_symbol))

	elif isinstance(ast_exp, ASTExpBlock):
		# ExpBlock: (self, line, exp_list)
		for block_exp in ast_exp.exp_list:
			last_assignee_symbol, last_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, block_exp)

		# Special return case for blocks (return assignee_symbol of last exp in block)
		# ---- TODO
		return (last_assignee_symbol, last_type_from_ast)

	elif isinstance(ast_exp, ASTExpNew):
		# ExpNew: (self, line, type_line, exp_type)
		# Handle SELF_TYPE explicitly
		if ast_exp.exp_type == "SELF_TYPE":
			cur_tac_list.append(TACNewSelfType(ast_exp.type_from_ast, assignee_symbol))
		else:
			cur_tac_list.append(TACNew(ast_exp.type_from_ast, assignee_symbol, ast_exp.exp_type))

	elif isinstance(ast_exp, ASTExpLet):
		# ExpLet: (self, line, binding_list, exp)

		# Add new symbol table to stack
		symbol_table_list.append({})

		# Assign all variables in the binding_list (between 'let' and 'in')
		for ast_binding in ast_exp.binding_list:
			gen_tac_for_binding(symbol_table_list, cur_tac_list, ast_binding)

		# Handle expression after 'in'
		return_symbol, return_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.exp)

		# Store the 'in' expression in assignee
		cur_tac_list.append(TACAssign(ast_exp.type_from_ast, assignee_symbol, return_symbol))

		# Remove symbol table from stack
		symbol_table_list.pop()

	# Handle binary expressions together
	# ExpBinaryArith: (self, line, left_exp, right_exp)
	elif isinstance(ast_exp, ASTExpPlus):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		cur_tac_list.append(TACPlus(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_assignee_symbol, "Int")
		
	elif isinstance(ast_exp, ASTExpMinus):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		cur_tac_list.append(TACMinus(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpTimes):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		cur_tac_list.append(TACMult(ast_exp.type_from_ast, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpDivide):
		# Generate tac for boxed values
		lhs_symbol_boxed, lhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		rhs_symbol_boxed, rhs_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)

		# Unbox values
		lhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, lhs_symbol_boxed, "Int")
		rhs_symbol_unboxed = gen_tac_for_unbox(symbol_table_list, cur_tac_list, rhs_symbol_boxed, "Int")

		# Use the unboxed values in the calculation
		unboxed_assignee_symbol = new_symbol()
		cur_tac_list.append(TACDiv(ast_exp.type_from_ast, ast_exp.line, unboxed_assignee_symbol, lhs_symbol_unboxed, rhs_symbol_unboxed))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpLt):
		left_symbol, left_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		right_symbol, right_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)
		cur_tac_list.append(TACCompL(ast_exp.type_from_ast, assignee_symbol, left_symbol, right_symbol))

	elif isinstance(ast_exp, ASTExpLe):
		left_symbol, left_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		right_symbol, right_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)
		cur_tac_list.append(TACCompLE(ast_exp.type_from_ast, assignee_symbol, left_symbol, right_symbol))

	elif isinstance(ast_exp, ASTExpEq):
		left_symbol, left_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.left_exp)
		right_symbol, right_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.right_exp)
		cur_tac_list.append(TACCompE(ast_exp.type_from_ast, assignee_symbol, left_symbol, right_symbol))

	# Handle unary expressions together
	# ExpUnary: (self, line, exp)
	elif isinstance(ast_exp, ASTExpIsVoid):
		exp_symbol, cur_exp_type = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.exp)
		cur_tac_list.append(TACIsVoid(ast_exp.type_from_ast, assignee_symbol, exp_symbol))

	elif isinstance(ast_exp, ASTExpTilde):
		# Get the boxed value
		boxed_exp_symbol, boxed_exp_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.exp)

		# Unbox the value and do 'not'
		unboxed_exp_symbol = gen_tac_for_unbox(symbol_table_list, cur_tac_list, boxed_exp_symbol, "Int")
		unboxed_assignee_symbol = new_symbol()
		cur_tac_list.append(TACNegArith(ast_exp.type_from_ast, unboxed_assignee_symbol, unboxed_exp_symbol))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_assignee_symbol, "Int")

	elif isinstance(ast_exp, ASTExpNot):
		# Get the boxed value
		boxed_exp_symbol, boxed_exp_symbol_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.exp)

		# Unbox the value and do 'not'
		unboxed_exp_symbol = gen_tac_for_unbox(symbol_table_list, cur_tac_list, boxed_exp_symbol, "Bool")
		unboxed_assignee_symbol = new_symbol()
		cur_tac_list.append(TACNegBool(ast_exp.type_from_ast, unboxed_assignee_symbol, unboxed_exp_symbol))

		# Box the answer and set assignee to pointer
		assignee_symbol = gen_tac_for_box(symbol_table_list, cur_tac_list, unboxed_assignee_symbol, "Bool")

	elif isinstance(ast_exp, ASTExpSelfDispatch):
		# ExpSelfDispatch: (self, line, ident_line, ident, exp_list=[])

		# Generate tac for all parameters in order
		param_symbol_list = []
		for idx, exp in enumerate(ast_exp.exp_list):
			param_symbol, param_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, exp)
			# Store the param for later use
			cur_tac_list.append(TACStoreParam(param_type_from_ast, idx, param_symbol))
			# Add the param to the list
			param_symbol_list.append(param_symbol)

		# else:
		method_ident = ast_exp.ident
		params_list = param_symbol_list

		cur_tac_list.append(TACSelfCall(ast_exp.type_from_ast, method_ident, params_list, assignee_symbol))

	elif isinstance(ast_exp, ASTExpDynamicDispatch):
		# ExpDynamicDispatch: (self, line, caller_exp, ident_line, ident, exp_list=[])

		# Generate tac for all parameters in order
		param_symbol_list = []
		for idx, exp in enumerate(ast_exp.exp_list):
			param_symbol, param_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, exp)
			# Store the param for later use
			# ---- TODO Consider getting type info for each param
			cur_tac_list.append(TACStoreParam(param_type_from_ast, idx, param_symbol))
			# Add the param to the list
			param_symbol_list.append(param_symbol)

		# Generate tac for receiver object
		ro_symbol, ro_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.caller_exp)

		# Check if the receiver object is void
		void_check_boxed = new_symbol()
		void_label_num = new_label_num()
		void_label = "dispatch_" + str(void_label_num) + "_void"
		not_void_label = "dispatch_" + str(void_label_num) + "_not_void"
		cur_tac_list.append(TACIsVoid(ro_type_from_ast, void_check_boxed, ro_symbol))

		# Unbox result of isvoid and negate it
		unboxed_is_void = gen_tac_for_unbox(symbol_table_list, cur_tac_list, void_check_boxed, "Bool")
		unboxed_is_not_void = new_symbol()
		# NegBool relies on UNBOXED values
		cur_tac_list.append(TACNegBool("Bool", unboxed_is_not_void, unboxed_is_void))		

		# Branch relies on UNBOXED values
		# Branch to error or rest of dispatch
		cur_tac_list.append(TACBt(unboxed_is_void, void_label))
		cur_tac_list.append(TACBt(unboxed_is_not_void, not_void_label))
		cur_tac_list.append(TACLabel(void_label))
		cur_tac_list.append(TACError(ast_exp.line, "dispatch on void"))
		cur_tac_list.append(TACJmp(not_void_label)) 		# include this to end basic block

		# Label for rest of dispatch
		cur_tac_list.append(TACLabel(not_void_label))
		
		method_ident = ast_exp.ident
		receiver_obj = ro_symbol
		params_list = param_symbol_list

		cur_tac_list.append(TACDynamicCall(ast_exp.type_from_ast, method_ident, receiver_obj, ro_type_from_ast, params_list, assignee_symbol))
		# raise NotImplementedError(ast_exp.__class__.__name__ + " for " + ast_exp.ident + " not yet implemented")

	elif isinstance(ast_exp, ASTExpStaticDispatch):
		# ExpStaticDispatch: (self, line, caller_exp, type_line, static_type, ident_line, ident, exp_list=[])

		# Generate tac for all parameters in order
		param_symbol_list = []
		for idx, exp in enumerate(ast_exp.exp_list):
			param_symbol, param_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, exp)
			# Store the param for later use
			cur_tac_list.append(TACStoreParam(param_type_from_ast, idx, param_symbol))
			# Add the param to the list
			param_symbol_list.append(param_symbol)

		# Generate tac for receiver object
		ro_symbol, ro_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.caller_exp)

		# Check if the receiver object is void
		void_check_boxed = new_symbol()
		void_label_num = new_label_num()
		void_label = "dispatch_" + str(void_label_num) + "_void"
		not_void_label = "dispatch_" + str(void_label_num) + "_not_void"
		cur_tac_list.append(TACIsVoid(ro_type_from_ast, void_check_boxed, ro_symbol))

		# Unbox result of isvoid and negate it
		unboxed_is_void = gen_tac_for_unbox(symbol_table_list, cur_tac_list, void_check_boxed, "Bool")
		unboxed_is_not_void = new_symbol()
		# NegBool relies on UNBOXED values
		cur_tac_list.append(TACNegBool("Bool", unboxed_is_not_void, unboxed_is_void))		

		# Branch relies on UNBOXED values
		# Branch to error or rest of dispatch
		cur_tac_list.append(TACBt(unboxed_is_void, void_label))
		cur_tac_list.append(TACBt(unboxed_is_not_void, not_void_label))
		cur_tac_list.append(TACLabel(void_label))
		cur_tac_list.append(TACError(ast_exp.line, "static dispatch on void"))
		cur_tac_list.append(TACJmp(not_void_label)) 		# include this to end basic block

		# Label for rest of dispatch
		cur_tac_list.append(TACLabel(not_void_label))

		static_type = ast_exp.static_type
		method_ident = ast_exp.ident
		receiver_obj = ro_symbol
		params_list = param_symbol_list

		cur_tac_list.append(TACStaticCall(ast_exp.type_from_ast, static_type, method_ident, receiver_obj, params_list, assignee_symbol))

	elif isinstance(ast_exp, ASTExpCase):
		# Get a label number for this case expression
		case_num = new_label_num()
		exit_label = "case_" + str(case_num) + "_exit"
		error_label = "case_" + str(case_num) + "_error_branch"

		# Get a set of all types in the case expression and make labels for each one
		case_type_label_map = {}
		case_elem_types = set()
		for ast_case_elem in ast_exp.case_exp_list:
			case_elem_type = ast_case_elem.case_type
			case_elem_types.add(case_elem_type)
			label = "case_" + str(case_num) + "_" + case_elem_type
			case_type_label_map[case_elem_type] = label

		# Add a label for the error branch
		case_type_label_map["error_branch"] = error_label

		# Map all types in the class map to their appropriate branches
		type_case_branch_map = {}
		for type_name in class_map:
			cur_type = type_name

			# Find the closest corresponding type
			while (cur_type not in case_elem_types):
				# Handle Object explicitly if not in case_elem_types
				if cur_type == "Object":
					cur_type = "error_branch"
					break				
				cur_type = parent_map[cur_type]

			# Add the result to the type-branch map
			branch_label = case_type_label_map[cur_type]
			type_case_branch_map[type_name] = branch_label

		# for type_name in type_case_branch_map:
		# 	print type_name,":",type_case_branch_map[type_name]

		# Evaluate case predicate exp
		pred_symbol, pred_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_exp.exp)

		# Check if the predicate is void
		void_check_boxed = new_symbol()
		void_label_num = new_label_num()
		void_label = "case_" + str(void_label_num) + "_void"
		not_void_label = "case_" + str(void_label_num) + "_not_void"
		cur_tac_list.append(TACIsVoid(pred_type_from_ast, void_check_boxed, pred_symbol))

		# Unbox result of isvoid and negate it
		unboxed_is_void = gen_tac_for_unbox(symbol_table_list, cur_tac_list, void_check_boxed, "Bool")
		unboxed_is_not_void = new_symbol()
		# NegBool relies on UNBOXED values
		cur_tac_list.append(TACNegBool("Bool", unboxed_is_not_void, unboxed_is_void))	

		# Branch relies on UNBOXED values
		# Branch to error or rest of case
		cur_tac_list.append(TACBt(unboxed_is_void, void_label))
		cur_tac_list.append(TACBt(unboxed_is_not_void, not_void_label))
		cur_tac_list.append(TACLabel(void_label))
		cur_tac_list.append(TACError(ast_exp.line, "case on void"))
		cur_tac_list.append(TACJmp(not_void_label)) 		# include this to end basic block

		# Label for rest of case
		cur_tac_list.append(TACLabel(not_void_label))

		# Get the type tag for the predicate
		type_symbol = new_symbol()
		cur_tac_list.append(TACGetTypeTag(type_symbol, pred_symbol))

		# Generate type comparisons
		for type_name in type_case_branch_map:
			branch_label = type_case_branch_map[type_name]
			cur_tac_list.append(TACCaseCmpTypesAndJe(type_symbol, type_name, branch_label))

		# Generate expressions for each branch
		branch_assignee_symbol = new_symbol()
		for ast_case_elem in ast_exp.case_exp_list:
			# Add symbol table for scope in case branch
			symbol_table_list.append({})

			# Add a label to start the case branch
			label = case_type_label_map[ast_case_elem.case_type]
			cur_tac_list.append(TACLabel(label))

			# Add ident from case branch
			case_elem_symbol = add_symbol(symbol_table_list, ast_case_elem.ident)

			# Assign exp from case predicate to the case elem
			cur_tac_list.append(TACAssign(ast_case_elem.case_type, case_elem_symbol, pred_symbol))

			# Generate tac for branch expression
			branch_exp_symbol, branch_exp_type = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_case_elem.exp)

			# Assign the value of the branch exp to the branch assignee symbol
			cur_tac_list.append(TACAssign(branch_exp_type, branch_assignee_symbol, branch_exp_symbol))

			# Jump to the exit
			cur_tac_list.append(TACJmp(exit_label))

			# Remove symbol table associate with case exp
			symbol_table_list.pop()

		# Add error expression
		cur_tac_list.append(TACLabel(error_label))
		cur_tac_list.append(TACError(ast_exp.line, "case without matching branch: " + pred_type_from_ast))

		# Add exit label
		cur_tac_list.append(TACLabel(exit_label))
		cur_tac_list.append(TACAssign(ast_exp.type_from_ast, assignee_symbol, branch_assignee_symbol))

	else:
		raise NotImplementedError(ast_exp.__class__.__name__ + " not yet implemented")

	# Default return case
	return (assignee_symbol, ast_exp.type_from_ast)

def gen_tac_for_feature(cur_tac_list, ast_feature, class_name):
	symbol_table_list = []

	if isinstance(ast_feature, ASTMethod):
		# For now, skip classes other than the main method
		# if ast_feature.ident != "main":
		# 	return

		# Add symbol table for method
		symbol_table_list.append({})

		# Label for start of method
		label = str(class_name)+"_"+str(ast_feature.ident)+"_"+new_label_num()
		cur_tac_list.append(TACLabel(label))

		# Add params to the symbol table and add the load param TAC instrs
		for idx, formal in enumerate(ast_feature.formals_list):
			formal_symbol = add_symbol(symbol_table_list, formal.ident)
			cur_tac_list.append(TACLoadParam(formal.typ, formal_symbol, idx))

		# Generate the tac for the method body
		return_symbol, return_type_from_ast = gen_tac_for_exp(symbol_table_list,cur_tac_list, ast_feature.body_exp)
		cur_tac_list.append(TACReturn(return_symbol))

		symbol_table_list.pop()

if __name__ == "__main__":
	input_filename = sys.argv[1]
	# prog_ast_root = get_input_list(input_filename)
	prog_ast_root = get_input_list_from_annotated_ast(input_filename)

	# gen_tac_for_ast(prog_ast_root)

	# for tac_instr in tac_list:
		# print tac_instr
