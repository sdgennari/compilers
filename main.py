# Import TAC classes
from tac_objects import *
from basic_blocks import *
from ast_nodes import *
from tac_to_asm import *
from ast_to_tac import *
from allocate_registers import *
from deserialize_ast import *
from shared_vars import *
from constant_folding import fold_constants
import copy
import sys

DIVIDER_STRING = "\t\t\t## ::::::::::::::::::::::::::::::::::::::::\n"

# Formats line with prefix '.quad'
def format_quad_line(string):
	return "\t\t\t.quad " + string + "\n"

def get_header_comment_string(title):
	result = DIVIDER_STRING
	result += "\t\t\t##  " + title + "\n"
	result += DIVIDER_STRING
	result += "\n"
	return result

# Makes the vtables for all classes
def get_vtables_string():
	global vtable_offset_map

	result = get_header_comment_string("VTABLES")
	for class_name in sorted(implementation_map.keys()):

		# Add label info for vtable
		result += ".globl " + get_vtable_str(class_name) + "\n"
		result += get_vtable_str(class_name) + ":\t\t## vtable for " + class_name + "\n"

		# Add type_name and 'new' implicit method
		result += format_quad_line("type_name_" + class_name)
		result += format_quad_line(class_name + "..new")

		# Iterate through all methods and add entries
		offset = 2			# Account for 2 entries above when calculating idx
		for idx, ast_method in enumerate(implementation_map[class_name]):
			method_name = ast_method.ident
			result += format_quad_line(ast_method.containing_class + "." + method_name)
			tup = (class_name, method_name)
			vtable_offset_map[tup] = idx + offset

		result += "\n"

	return result


# ========================================
#  STRING CONSTANT METHODS
# ========================================

def get_constants_string():
	result = get_header_comment_string("CONSTANT STRINGS")
	result += get_type_name_strings()
	result += get_empty_string()
	result += get_abort_string()
	result += get_substr_error_string()
	result += gen_const_strings()
	result += get_io_format_strings()
	result += get_asm_internal_helpers_string()
	# ---- TODO: Get execption strings
	return result

# Makes the type name strings for all classes
def get_type_name_strings():
	result = ""
	for class_name in sorted(class_map.keys()):
		result += ".globl type_name_" + class_name + " \n"
		result += "type_name_" + class_name + ":\t\t\t## type_name string for " + class_name + "\n"
		result += "\t\t\t.string \"" + class_name + "\"\n"
		result += "\n"

	return result

# Makes an empty string in assembly
def get_empty_string():
	result = ".globl empty.string\n"
	result += "empty.string:\t\t\t## empty string for default Strings\n"
	result += "\t\t\t.string \"\"\n"
	result += "\n"
	return result

# Makes string for abort
def get_abort_string():
	result = ".globl abort.string\n"
	result += "abort.string:\t\t\t## abort string for Object.abort\n"
	result += "\t\t\t.string \"abort\\n\"\n"
	result += "\n"
	return result

# Make an error string for String.substr
def get_substr_error_string():
	result = ".globl error.substr_range\n"
	result += "error.substr_range:\t\t## error string for String.substr\n"
	result += "\t\t\t.string \"ERROR: 0: Exception: String.substr out of range\\n\"\n"
	result += "\n"
	return result

def gen_const_strings():
	result = ""
	for string in const_string_label_map:
		label = const_string_label_map[string]
		result += ".globl " + label + "\n"
		result += label + ":\n"

		# Format string since \\ in assembly becomes a single \
		formatted_string = string.replace("\\", "\\\\").replace("\"", "\\\"").replace("\'", "\\\'")

		result += "\t\t\t.string \"" + formatted_string + "\"\n"
		result += "\n"
	return result

def get_io_format_strings():
	# in_int format string
	result = ".globl in_int_format_str\n"
	result += "in_int_format_str:\n"
	result += "\t\t\t.string \"%ld\"\n"
	result += "\n"

	# out_int format string
	result += ".globl out_int_format_str\n"
	result += "out_int_format_str:\n"
	result += "\t\t\t.string \"%d\"\n"
	result += "\n"

	return result

# ========================================

def get_vtable_str(type_name):
	return type_name + "..vtable"

# Determines the size of a type based on its attributes
def calculate_type_size(type_name):
	return 3 + len(class_map[type_name])

def get_constructor_string():
	result = get_header_comment_string("CONSTRUCTORS")
	for type_name in sorted(class_map.keys()):
		result += ".globl " + type_name + "..new\n"
		result += type_name + "..new:\t\t## Constructor for " + type_name + "\n"

		# Note: This asm code is unoptimized
		cur_asm_list = []
		gen_asm_for_constructor(cur_asm_list, type_name)

		# Add all asm instrs to result
		for asm_instr in cur_asm_list:
			result += str(asm_instr)

		result += "\n"

	return result

# Generates assembly for 'new' constructor
def gen_asm_for_constructor(cur_asm_list, type_name):
	global register_color_map

	gen_asm_for_method_start(cur_asm_list)

	# Generate TAC
	cur_tac_list = []

	# Allocate space for the object
	obj_size = calculate_type_size(type_name)
	type_tag = type_tag_map[type_name]
	cur_tac_list.append(TACAllocType(type_name, obj_size, type_tag))

	symbol_table_list = []
	
	# Populate the symbol table with attrs
	add_attrs_to_symbol_table(symbol_table_list, type_name)

	# Create default attributes
	for ast_attr in class_map[type_name]:
		# Note: Attributes implied in symbol table, so no need to add them
		attr_symbol = new_symbol();
		cur_tac_list.append(TACDefault(ast_attr.feature_type, attr_symbol, ast_attr.feature_type))
		cur_tac_list.append(TACStoreAttr(ast_attr.feature_type, ast_attr.ident, attr_symbol))

	# Initialize attributes
	for ast_attr in class_map[type_name]:
		# Check that the attribute has an init exp
		if isinstance(ast_attr, ASTAttrInit):
			# Generate the TAC for the expression
			exp_symbol, exp_type = gen_tac_for_exp(type_name, symbol_table_list, cur_tac_list, ast_attr.exp)

			# If the attr is an Object and the exp is unboxed, box the result
			if ast_attr.feature_type == "Object" and exp_type in ["Int", "String", "Bool"]:
				boxed_symbol = new_symbol()
				cur_tac_list.append(TACBox(boxed_symbol, exp_symbol, exp_type))
				exp_symbol = boxed_symbol

			# Store result it in the attr
			cur_tac_list.append(TACStoreAttr(ast_attr.feature_type, ast_attr.ident, exp_symbol))

	# for tac_instr in cur_tac_list:
	# 	print tac_instr
	# print
	# return

	if len(cur_tac_list) != 0:
		# Build basic blocks and compute liveness
		block_list = buildBasicBlocks(cur_tac_list)
		computeLiveSets(block_list)

		# if type_name == "Main":
		# 	for block in block_list:
		# 		print block

		# Allocate registers
		register_colors = None
		spilled_registers = []
		while register_colors == None:
			computeLiveSets(block_list)
			register_graph = build_register_graph(block_list)
			combined_live_ranges = combine_block_live_ranges(block_list)
			register_colors = allocate_registers(register_graph, block_list, combined_live_ranges, spilled_registers)
		# -- end while loop

		# Generate asm for the block list
		gen_asm_for_block_list(cur_asm_list, block_list, register_colors, spilled_registers, type_name)

	# Move the pointer to self into rax to return it
	cur_asm_list += [
		ASMComment("assign self register to %rax for return"),
		ASMMovQ(SELF_REG, "%rax")
	]

	gen_asm_for_method_end(cur_asm_list)

	# print "new",type_name,":"
	# for asm_instr in cur_asm_list:
	# 	print asm_instr,
	# print

def format_asm_const_string(const_int):
	return "$" + str(const_int)

# Generate list of asm intructions for the beginning of each method
#		pushq	%rbp
#		movq	%rsp, %rbp
def gen_asm_for_method_start(cur_asm_list):
	cur_asm_list.append(ASMPushQ("%rbp"))
	cur_asm_list.append(ASMMovQ("%rsp", "%rbp"))

# Generate list of asm instructions for end of each method call
#		leave
# 		ret
def gen_asm_for_method_end(cur_asm_list):
	cur_asm_list.append(ASMLeave())
	cur_asm_list.append(ASMRet())

def make_global_type_tag_map():
	global type_tag_map

	# Handle built in types explicitly
	built_in_types = ["Bool", "Int", "IO", "Object", "String", "Main"]
	for idx, type_name in enumerate(built_in_types):
		type_tag_map[type_name] = idx

	# Give all other types tags >= offset
	offset = len(built_in_types)
	remaining_types = [type_name for type_name in class_map if type_name not in built_in_types]
	for idx, type_name in enumerate(sorted(remaining_types)):
		type_tag_map[type_name] = idx + offset

def make_global_attr_offset_map():
	global attr_offset_map

	# Account for type_tag, size, and vtable_ptr in object
	offset = 3;
	for type_name in class_map:
		for idx, ast_attr in enumerate(class_map[type_name]):
			tup = (type_name, ast_attr.ident)
			attr_offset_map[tup] = (idx + 3)

def get_program_start_string():
	result = get_header_comment_string("PROGRAM START")
	result += "\t\t\t.globl main\n"
	result += "\t\t\t.type main, @function\n"
	result += "main:\n"

	cur_asm_list = [
		ASMCall("Main..new"),
		ASMMovQ("%rax", "%rbx"),
		ASMCall("Main.main"),
		ASMMovQ("$0", "%rax"),
		ASMCall("exit")
	]

	for asm_instr in cur_asm_list:
		result += str(asm_instr)

	return result

# ========================================
#  METHOD IMPLEMENTATIONS
# ========================================

def get_methods_string():
	result = get_header_comment_string("METHOD IMPLEMENTATIONS")

	for type_name in sorted(implementation_map.keys()):

		# TODO: HANDLE SCOPE OF ATTRIBUTES IN SYMBOL TABLE

		method_list = implementation_map[type_name]
		for ast_method in method_list:
			# Only print methods specific to this class
			if ast_method.containing_class == type_name:
				result += ".globl " + type_name + "." + ast_method.ident + "\n"
				result += type_name + "." + ast_method.ident + ":\n"

				# Create a new ASM list
				cur_asm_list = []

				if isinstance(ast_method.body_exp, ASTExpInternal):
					gen_asm_for_method_start(cur_asm_list)
					gen_asm_for_internal_method(cur_asm_list, ast_method.body_exp.class_method)
					gen_asm_for_method_end(cur_asm_list)

					for asm_instr in cur_asm_list:
						result += str(asm_instr)

					# result += "\t\t\tcall exit\n"
					result += "\n"

				else:
					gen_asm_for_method_start(cur_asm_list)
					ast_method_to_asm(cur_asm_list, ast_method, type_name)
					gen_asm_for_method_end(cur_asm_list)

					# TODO: Maybe move ASM for method end here

					for asm_instr in cur_asm_list:
						result += str(asm_instr)

					result += "\n"

	return result

def add_attrs_to_symbol_table(symbol_table_list, type_name):
	# Use None to indicate the ident is an attr that must be loaded
	symbol_table_list.append({})
	for ast_attr in class_map[type_name]:
		symbol_table_list[-1][ast_attr.ident] = (None, ast_attr.feature_type)

	# Add self explicitly to the table (self is treated like an implicit attr)
	symbol_table_list[-1]["self"] = (None, "SELF_TYPE")

def ast_method_to_asm(cur_asm_list, ast_method, type_name):
	symbol_table_list = []

	# Populate the symbol table with attrs
	add_attrs_to_symbol_table(symbol_table_list, type_name)
		
	# Generate the TAC for the exp
	cur_tac_list = []
	gen_tac_for_method(symbol_table_list, cur_tac_list, ast_method, type_name)

	# print len(cur_tac_list)
	# for tac_instr in cur_tac_list:
	# 	print tac_instr
	# print
	# sys.exit(1)

	# Build basic blocks and compute liveness
	block_list = buildBasicBlocks(cur_tac_list)
	# computeLiveSets(block_list)

	# if ast_method.ident == "main":
	# 	print
	# 	for block in block_list:
	# 		print block
	# 		for instr in block.instr_list:
	# 			print getattr(instr, 'cur_exp_type', "").ljust(12), instr
	# 		print

	# removeDeadCode(block_list)
	# computeLiveSets(block_list)

	# Constant folding
	fold_constants(block_list)
	computeLiveSets(block_list)

	# if ast_method.ident == "main":
	# 	print
	# 	for block in block_list:
	# 		print block
			# for instr in block.instr_list:
			# 	print getattr(instr, 'cur_exp_type', "").ljust(12), instr
			# print

	# TODO: ADD DEAD CODE BACK IN LATER AFTER AUTOBOXING IS DONE
	# removeDeadCode(block_list)
	# computeLiveSets(block_list)

	# if ast_method.ident == "main":
	# 	print
	# 	for block in block_list:
	# 		print block
			# for instr in block.instr_list:
	# 			print getattr(instr, 'cur_exp_type', "").ljust(12), instr
	# 		print
	# # sys.exit(1)

	# Allocate registers
	register_colors = None
	spilled_registers = []
	while register_colors == None:
		computeLiveSets(block_list)
		register_graph = build_register_graph(block_list)
		combined_live_ranges = combine_block_live_ranges(block_list)
		register_colors = allocate_registers(register_graph, block_list, combined_live_ranges, spilled_registers)
	# -- end while loop

	# Generate asm for the block list
	gen_asm_for_block_list(cur_asm_list, block_list, register_colors, spilled_registers, type_name)

	# if ast_method.ident == "main":
		# for asm_instr in cur_asm_list:
			# print asm_instr,

def ast_attr_to_asm(cur_asm_list, ast_attr, type_name):
	cur_tac_list = []
	gen_tac_for_exp(type_name, cur_tac_list, ast_attr.exp)

	block_list = buildBasicBlocks(cur_tac_list)
	computeLiveSets(block_list)

	# Allocate registers
	register_colors = None
	spilled_registers = []
	while register_colors == None:
		computeLiveSets(block_list)
		register_graph = build_register_graph(block_list)
		combined_live_ranges = combine_block_live_ranges(block_list)
		register_colors = allocate_registers(register_graph, block_list, combined_live_ranges, spilled_registers)
	# -- end while loop
	gen_asm_for_block_list(cur_asm_list, block_list, register_colors, spilled_registers, type_name)

def get_helper_strings():
	result = get_header_comment_string("COMPARISONS")
	result += get_cmp_lt_helper_string()
	result += "\n"
	result += get_cmp_le_helper_string()
	result += "\n"
	result += get_cmp_eq_helper_string()
	result += "\n"

	return result

# ========================================
#  MAIN
# ========================================

if __name__ == "__main__":
	input_filename = sys.argv[1]
	prog_ast_root = get_input_list_from_annotated_ast(input_filename)

	make_global_type_tag_map()
	make_global_attr_offset_map()

	result = ""

	result += get_vtables_string()
	result += get_constructor_string()
	result += get_methods_string()

	result += get_program_start_string()

	# # Note: This must be called AFTER asm for all expressions has been generated
	result += get_constants_string()

	result += get_helper_strings()

	old_file_ext_len = len("cl-type")
	offset_from_end = -1 * old_file_ext_len
	output_filename = input_filename[0:offset_from_end] + "s"
	output_file = open(output_filename, 'w')
	output_file.write(result)
	