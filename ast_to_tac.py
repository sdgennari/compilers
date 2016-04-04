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

def add_attr_symbol(ident):
	global symbol_table_list
	symbol_table_list[-1][ident] = ident
	return symbol_table_list[-1][ident]

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
		tac_list.append(TACDefault(assignee_symbol, ast_binding.binding_type))
	else:
		# let_binding_init
		exp_symbol = gen_tac_for_exp(ast_binding.exp)
		tac_list.append(TACAssign(assignee_symbol, exp_symbol))

	# NOTE: No need to return a symbol since all items are added to symbol table

def gen_tac_for_exp(ast_exp):
	global tac_list

	# Generate a symbol for the return type
	assignee_symbol = new_symbol()

	if isinstance(ast_exp, ASTExpString):
		# ExpString: (self, line, string)
		tac_list.append(TACConstString(assignee_symbol, ast_exp.string))

	elif isinstance(ast_exp, ASTExpInteger):
		# ExpInteger: (self, line, integer)
		tac_list.append(TACConstInt(assignee_symbol, str(ast_exp.integer)))

	elif isinstance(ast_exp, ASTExpTrue):
		# ExpTrue: (self, line)
		tac_list.append(TACConstBool(assignee_symbol, "true"))

	elif isinstance(ast_exp, ASTExpFalse):
		# ExpFalse: (self, line)
		tac_list.append(TACConstBool(assignee_symbol, "false"))

	elif isinstance(ast_exp, ASTExpIdentifier):
		# ExpIdentifier: (self, line, ident_line, ident)
		# For an identifier, get appropriate symbol from the symbol table
		ident_symbol = get_symbol(ast_exp.ident)

		# Assign the ident symbol to the asignee symbol
		tac_list.append(TACAssign(assignee_symbol, ident_symbol))

	elif isinstance(ast_exp, ASTExpIfThenElse):
		# ExpIfThenElse: (self, line, cond_exp, then_exp, else_exp)
		label_num = new_label_num()
		then_label = "if_then_" + str(label_num)
		else_label = "if_else_" + str(label_num)
		exit_label = "if_exit_" + str(label_num)

		# Get condition and negate it
		cond_symbol = gen_tac_for_exp(ast_exp.cond_exp)
		not_cond_symbol = new_symbol()
		tac_list.append(TACNegBool(not_cond_symbol, cond_symbol))

		# Branch to 'then' if condition is true
		# Branch to 'else' if condition is not true
		tac_list.append(TACBt(cond_symbol, then_label))
		tac_list.append(TACBt(not_cond_symbol, else_label))

		# 'then' exp
		tac_list.append(TACComment("then branch"))
		tac_list.append(TACLabel(then_label))
		then_symbol = gen_tac_for_exp(ast_exp.then_exp)
		tac_list.append(TACAssign(assignee_symbol, then_symbol))
		# Jump over 'else' exp
		tac_list.append(TACJmp(exit_label))

		# Label for 'else' exp
		tac_list.append(TACComment("else branch"))
		tac_list.append(TACLabel(else_label))
		else_symbol = gen_tac_for_exp(ast_exp.else_exp)
		tac_list.append(TACAssign(assignee_symbol, else_symbol))
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
		cond_symbol = gen_tac_for_exp(ast_exp.cond_exp)
		not_cond_symbol = new_symbol()
		tac_list.append(TACNegBool(not_cond_symbol, cond_symbol))

		# Branch to exit loop if condition is not true
		tac_list.append(TACBt(cond_symbol, body_label))
		tac_list.append(TACBt(not_cond_symbol, exit_label))

		# Add loop body label
		tac_list.append(TACComment("loop body"))
		tac_list.append(TACLabel(body_label))
		body_symbol = gen_tac_for_exp(ast_exp.loop_exp)

		# Jmp to start of loop to repeat
		tac_list.append(TACJmp(start_label))

		# Add exit label after end of loop
		tac_list.append(TACComment("loop exit"))
		tac_list.append(TACLabel(exit_label))

		# Make a new default Object as the loop's return type
		tac_list.append(TACDefault(assignee_symbol, "Object"))

	elif isinstance(ast_exp, ASTExpAssign):
		# ExpAssign: (self, line, ident_line, ident, exp)
		# assignee_symbol MUST be a value from the symbol table, so fetch it
		assignee_symbol = get_symbol(ast_exp.ident)
		exp_symbol = gen_tac_for_exp(ast_exp.exp)
		tac_list.append(TACAssign(assignee_symbol, exp_symbol))

	elif isinstance(ast_exp, ASTExpBlock):
		# ExpBlock: (self, line, exp_list)
		for block_exp in ast_exp.exp_list:
			last_assignee_symbol = gen_tac_for_exp(block_exp)

		# Special return case for blocks (return assignee_symbol of last exp in block)
		return last_assignee_symbol

	elif isinstance(ast_exp, ASTExpNew):
		# ExpNew: (self, line, type_line, exp_type)
		tac_list.append(TACAlloc(assignee_symbol, ast_exp.exp_type))

	elif isinstance(ast_exp, ASTExpLet):
		# ExpLet: (self, line, binding_list, exp)

		# Add new symbol table to stack
		symbol_table_list.append({})

		# Assign all variables in the binding_list (between 'let' and 'in')
		for ast_binding in ast_exp.binding_list:
			gen_tac_for_binding(ast_binding)

		# Handle expression after 'in'
		return_symbol = gen_tac_for_exp(ast_exp.exp)

		# Store the 'in' expression in assignee
		tac_list.append(TACAssign(assignee_symbol, return_symbol))

		# Remove symbol table from stack
		symbol_table_list.pop()

	# Handle all binary expressions together
	elif isinstance(ast_exp, ASTExpBinaryArith):
		# ExpBinaryArith: (self, line, left_exp, right_exp)
		left_symbol = gen_tac_for_exp(ast_exp.left_exp)
		right_symbol = gen_tac_for_exp(ast_exp.right_exp)

		if isinstance(ast_exp, ASTExpPlus):
			tac_list.append(TACPlus(assignee_symbol, left_symbol, right_symbol))
		elif isinstance(ast_exp, ASTExpMinus):
			tac_list.append(TACMinus(assignee_symbol, left_symbol, right_symbol))
		elif isinstance(ast_exp, ASTExpTimes):
			tac_list.append(TACMult(assignee_symbol, left_symbol, right_symbol))
		elif isinstance(ast_exp, ASTExpDivide):
			tac_list.append(TACDiv(assignee_symbol, left_symbol, right_symbol))
		elif isinstance(ast_exp, ASTExpLt):
			tac_list.append(TACCompL(assignee_symbol, left_symbol, right_symbol))
		elif isinstance(ast_exp, ASTExpLe):
			tac_list.append(TACCompLE(assignee_symbol, left_symbol, right_symbol))
		elif isinstance(ast_exp, ASTExpEq):
			tac_list.append(TACCompE(assignee_symbol, left_symbol, right_symbol))

	# Handle all unary expressions together
	elif isinstance(ast_exp, ASTExpUnary):
		# ExpUnary: (self, line, exp)
		exp_symbol = gen_tac_for_exp(ast_exp.exp)

		if isinstance(ast_exp, ASTExpIsVoid):
			tac_list.append(TACIsVoid(assignee_symbol, exp_symbol))
		elif isinstance(ast_exp, ASTExpTilde):
			tac_list.append(TACNegArith(assignee_symbol, exp_symbol))
		elif isinstance(ast_exp, ASTExpNot):
			tac_list.append(TACNegBool(assignee_symbol, exp_symbol))

	elif isinstance(ast_exp, ASTExpSelfDispatch):
		# ExpSelfDispatch: (self, line, ident_line, ident, exp_list=[])

		exp_symbol_list = []
		for exp in ast_exp.exp_list:
			exp_symbol_list.append(gen_tac_for_exp(exp))
		
		# For now, only handle 'out_string' and 'out_int'
		if ast_exp.ident == "out_string":
			tac_list.append(TACOutString(assignee_symbol, exp_symbol_list[0]))

		elif ast_exp.ident == "out_int":
			tac_list.append(TACOutInt(assignee_symbol, exp_symbol_list[0]))

		elif ast_exp.ident == "in_string":
			tac_list.append(TACInString(assignee_symbol))

		elif ast_exp.ident == "in_int":
			tac_list.append(TACInInt(assignee_symbol))


	elif isinstance(ast_exp, ASTExpDynamicDispatch):
		# ExpDynamicDispatch: (self, line, caller_exp, ident_line, ident, exp_list=[])
		gen_tac_for_exp(ast_exp.caller_exp)
		exp_symbol_list = []
		for exp in ast_exp.exp_list:
			exp_symbol_list.append(gen_tac_for_exp(exp))
		
		# For now, only handle 'out_string' and 'out_int'
		if ast_exp.ident == "out_string":
			tac_list.append(TACOutString(assignee_symbol, exp_symbol_list[0]))

		elif ast_exp.ident == "out_int":
			tac_list.append(TACOutInt(assignee_symbol, exp_symbol_list[0]))

		elif ast_exp.ident == "in_string":
			tac_list.append(TACInString(assignee_symbol))

		elif ast_exp.ident == "in_int":
			tac_list.append(TACInInt(assignee_symbol))

	elif isinstance(ast_exp, ASTExpStaticDispatch):
		# ExpStaticDispatch: (self, line, caller_exp, type_line, static_type, ident_line, ident, exp_list=[])
		gen_tac_for_exp(ast_exp.caller_exp)
		exp_symbol_list = []
		for exp in ast_exp.exp_list:
			exp_symbol_list.append(gen_tac_for_exp(exp))

		# For now, only handle 'out_string' and 'out_int'
		if ast_exp.ident == "out_string":
			tac_list.append(TACOutString(assignee_symbol, exp_symbol_list[0]))

		if ast_exp.ident == "out_int":
			tac_list.append(TACOutInt(assignee_symbol, exp_symbol_list[0]))

		elif ast_exp.ident == "in_string":
			tac_list.append(TACInString(assignee_symbol))

		elif ast_exp.ident == "in_int":
			tac_list.append(TACInInt(assignee_symbol))

	# Default return case
	return assignee_symbol


def gen_tac_for_feature(ast_feature, class_name):
	global tac_list
	if isinstance(ast_feature, ASTMethod):
		# For now, skip classes other than the main method
		if ast_feature.ident != "main":
			return

		# Add symbol table for method
		symbol_table_list.append({})

		# Label for start of method
		label = str(class_name)+"_"+str(ast_feature.ident)+"_"+new_label_num()
		tac_list.append(TACLabel(label))

		# For now, leave out formals list since main method cannot have formals

		return_symbol = gen_tac_for_exp(ast_feature.body_exp)
		tac_list.append(TACReturn(return_symbol))

		symbol_table_list.pop()

	elif isinstance(ast_feature, ASTAttrInit):
		# AttrInit: (self, ident_line, ident, type_line, feature_type, exp)
		# attr_symbol = add_attr_symbol(ast_feature.ident)
		attr_symbol = add_symbol(ast_feature.ident)
		exp_symbol = gen_tac_for_exp(ast_feature.exp)
		tac_list.append(TACAssign(attr_symbol, exp_symbol))

	elif isinstance(ast_feature, ASTAttrNoInit):
		# AttrNoInit: (self, ident_line, ident, type_line, feature_type)
		# attr_symbol = add_attr_symbol(ast_feature.ident)
		attr_symbol = add_symbol(ast_feature.ident)
		tac_list.append(TACDefault(attr_symbol, ast_feature.feature_type))

def gen_tac_for_class(ast_class):
	# Add symbol table for class since the scope is changing
	symbol_table_list.append({})

	# For now, skip classes other than the main class
	class_typ = ast_class.typ
	tac_list.append(TACComment("start class: " + str(class_typ)))

	if class_typ != "Main":
		symbol_table_list.pop()
		tac_list.append(TACComment("end class: " + str(class_typ)))
		return

	# Generate tac for each feature in the list
	for ast_feature in ast_class.feature_list:
		gen_tac_for_feature(ast_feature, class_typ)

	symbol_table_list.pop()
	tac_list.append(TACComment("end class: " + str(class_typ)))

def gen_tac_for_ast(ast_root):
	global symbol_table_list
	global tac_list
	tac_list.append(TACComment("start"))
	for ast_class in ast_root.class_list:
		gen_tac_for_class(ast_class)

if __name__ == "__main__":
	input_filename = sys.argv[1]
	# prog_ast_root = get_input_list(input_filename)
	prog_ast_root = get_input_list_from_annotated_ast(input_filename)

	gen_tac_for_ast(prog_ast_root)

	for tac_instr in tac_list:
		print tac_instr

