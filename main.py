# Import TAC classes
from tac_objects import *
from basic_blocks import *
from ast_nodes import *
from tac_to_asm import *
from ast_to_tac import *
from allocate_registers import *
from deserialize_ast import *
from shared_vars import *
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
	result += get_raw_out_string_helper()
	result += get_string_concat_helper()
	result += get_string_substr_helper()
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
		formatted_string = string.replace("\\", "\\\\")

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

	# # Push all callee-saved registers
	# cur_asm_list.append(ASMComment("push callee-saved regs"))
	# for reg in callee_saved_registers:
	# 	cur_asm_list.append(ASMPushQ(reg))

	# # Allocate space for the object based on the size via calloc(obj_size {rdi}, 8 {rsi})
	# obj_size = calculate_type_size(type_name)
	# size_str = format_asm_const_string(obj_size)
	# cur_asm_list += [
	# 	ASMComment("allocate space for " + type_name),
	# 	ASMMovQ("$8", "%rsi"),
	# 	ASMMovQ(size_str, "%rdi"),
	# 	ASMCall("calloc"),
	# 	ASMMovQ("%rax", SELF_REG)
	# ]
	# # Pointer to object now in SELF_REG

	# # Store type_tag, obj_size, vtable
	# type_tag = type_tag_map[type_name]
	# vtable_str = get_vtable_str(type_name)
	# cur_asm_list += [
	# 	ASMComment("store type_tag, obj_size, vtable"),
	# 	ASMMovQ(format_asm_const_string(type_tag), "%rax"),
	# 	ASMMovQ("%rax", "0("+SELF_REG+")"),
	# 	ASMMovQ(format_asm_const_string(obj_size), "%rax"),
	# 	ASMMovQ("%rax", "8("+SELF_REG+")"),
	# 	ASMMovQ(format_asm_const_string(vtable_str), "%rax"),
	# 	ASMMovQ("%rax", "16("+SELF_REG+")")
	# ]

	# Generate TAC
	cur_tac_list = []

	# Allocate space for the object
	obj_size = calculate_type_size(type_name)
	type_tag = type_tag_map[type_name]
	cur_tac_list.append(TACAllocType(type_name, obj_size, type_tag))

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
			gen_tac_for_exp(cur_tac_list, ast_attr.exp)

			# Get assignee of last TAC instr and store it in the attr
			last_tac_instr = cur_tac_list[-1]
			if hasattr(last_tac_instr, "assignee"):
				cur_tac_list.append(TACStoreAttr(ast_attr.feature_type, ast_attr.ident, last_tac_instr.assignee))
			else:
				raise ValueError("Last instr for attr init should have an assignee")

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
		is_done = False
		while not is_done:
			computeLiveSets(block_list)
			register_graph = build_register_graph(block_list)
			combined_live_ranges = combine_block_live_ranges(block_list)
			is_done = allocate_registers(register_graph, block_list, combined_live_ranges)
		# -- end while loop

		# Generate asm for the block list
		gen_asm_for_block_list(cur_asm_list, block_list, register_colors, spilled_registers, type_name)

	# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# # 1. Store default values for each attribute
	# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# # Note: Handle RawInt and RawString explicitly
	# cur_asm_list.append(ASMComment("create default attrs"))
	# for i, ast_attr in enumerate(class_map[type_name]):
	# 	# Add 3 to the list index to handle 3 implicit fields
	# 	idx = i + 3
	# 	mem_offset = str(8*idx) + "("+SELF_REG+")"

	# 	cur_asm_list.append(ASMComment("self[" + str(idx) + "] holds " + ast_attr.ident + " (" + ast_attr.feature_type +")"))
	# 	# Only Int and Bool can have a raw.Int attr, always at self[3]
	# 	if ast_attr.feature_type == "raw.Int":
	# 		cur_asm_list.append(ASMMovL("$0", mem_offset))

	# 	# Only String can have a raw.String attr, always at self[3]
	# 	elif ast_attr.feature_type == "raw.String":
	# 		cur_asm_list.append(ASMMovQ("$empty.string", mem_offset))

	# 	else: 
	# 		# Call default constructor for attr and assign to correct spot
	# 		# Handle SELF_TYPE explicitly
	# 		if ast_attr.feature_type == "SELF_TYPE":
	# 			# Push all caller-saved regs
	# 			for reg in caller_saved_registers:
	# 				cur_asm_list.append(ASMPushQ(reg))
	# 			cur_asm_list.append(ASMPushQ(SELF_REG))

	# 			cur_asm_list.append(ASMComment("Lookup 'new' in vtable for self"))

	# 			# Get vtable ptr
	# 			cur_asm_list.append(ASMMovQ("16(%rbx)", "%rax"))

	# 			# Find constructor dynamically
	# 			cur_asm_list.append(ASMMovQ("8(%rax)", "%rax"))

	# 			# Call method
	# 			cur_asm_list.append(ASMCall("*%rax"))

	# 			# Pop all caller-saved regs
	# 			cur_asm_list.append(ASMPopQ(SELF_REG))
	# 			for reg in reversed(caller_saved_registers):
	# 				cur_asm_list.append(ASMPopQ(reg))
	# 		else:
	# 			constructor = ast_attr.feature_type + "..new"

	# 			# Push all caller-saved regs
	# 			for reg in caller_saved_registers:
	# 				cur_asm_list.append(ASMPushQ(reg))
	# 			cur_asm_list.append(ASMPushQ(SELF_REG))

	# 			# Call constructor
	# 			cur_asm_list.append(ASMCall(constructor))

	# 			# Pop all caller-saved regs
	# 			cur_asm_list.append(ASMPopQ(SELF_REG))
	# 			for reg in reversed(caller_saved_registers):
	# 				cur_asm_list.append(ASMPopQ(reg))

	# 		# Move result into attr offset
	# 		cur_asm_list.append(ASMMovQ("%rax", mem_offset))

	# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# # 2. Init each attribute based on expression
	# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# cur_asm_list.append(ASMComment("initialize attrs"))
	# for i, ast_attr in enumerate(class_map[type_name]):
	# 	idx = i + 3;
	# 	mem_offset = str(8*idx) + "("+SELF_REG+")"

	# 	# Skip attrs without initialization
	# 	if isinstance(ast_attr, ASTAttrNoInit):
	# 		continue

	# 	cur_asm_list.append(ASMComment("self[" + str(idx) + "] " + ast_attr.ident + " <- init exp"))
	# 	# cur_asm_list.append(ASMComment("---- TODO: Generate asm for init exp"))
	# 	ast_attr_to_asm(cur_asm_list, ast_attr, type_name)

	# # -- end for loop

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

def ast_method_to_asm(cur_asm_list, ast_method, type_name):
	# Generate the TAC for the exp
	cur_tac_list = []
	gen_tac_for_feature(cur_tac_list, ast_method, type_name)

	# print len(cur_tac_list)
	# for tac_instr in cur_tac_list:
	# 	print tac_instr
	# print
	# sys.exit(1)

	# Build basic blocks and compute liveness
	block_list = buildBasicBlocks(cur_tac_list)
	computeLiveSets(block_list)

	# for block in block_list:
	# 	print block
	# sys.exit(1)

	# Allocate registers
	is_done = False
	while not is_done:
		computeLiveSets(block_list)
		register_graph = build_register_graph(block_list)
		combined_live_ranges = combine_block_live_ranges(block_list)
		is_done = allocate_registers(register_graph, block_list, combined_live_ranges)
	# -- end while loop

	# Generate asm for the block list
	gen_asm_for_block_list(cur_asm_list, block_list, register_colors, spilled_registers, type_name)

	# for asm_instr in cur_asm_list:
	# 	print asm_instr,

def ast_attr_to_asm(cur_asm_list, ast_attr, type_name):
	cur_tac_list = []
	gen_tac_for_exp(cur_tac_list, ast_attr.exp)

	block_list = buildBasicBlocks(cur_tac_list)
	computeLiveSets(block_list)

	# Allocate registers
	is_done = False
	while not is_done:
		computeLiveSets(block_list)
		register_graph = build_register_graph(block_list)
		combined_live_ranges = combine_block_live_ranges(block_list)
		is_done = allocate_registers(register_graph, block_list, combined_live_ranges)
	# -- end while loop
	gen_asm_for_block_list(cur_asm_list, block_list, register_colors, spilled_registers, type_name)

	# # Add final instr to move value to correct offset from self
	# tup = (type_name, ast_attr.ident)
	# attr_idx = attr_offset_map[tup]
	# self_offset = 8 * attr_idx
	# dest = str(self_offset)+"("+SELF_REG+")"
	# # Get the last register in the exp since it holds the resulting value
	# final_virtual_reg = cur_tac_list[-1].assignee
	# src = get_asm_register(final_virtual_reg, 64)
	# cur_asm_list.append(ASMMovQ(src, dest))

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
	