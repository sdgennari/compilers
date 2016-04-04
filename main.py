# Import TAC classes
from tac_objects import *
from basic_blocks import *
from ast_nodes import *
from tac_to_asm import *
from ast_to_tac import *
from allocate_registers import *
from deserialize_ast import *
import copy
import sys

DIVIDER_STRING = "\t\t\t## ========================================\n"

# Map: (class_name, method_name) -> vtable index
vtable_offset_map = {}

# Formats line with prefix '.quad'
def format_quad_line(string):
	return "\t\t\t.quad " + string + "\n"

# Makes the vtables for all classes
def get_vtables_string():
	global vtable_offset_map

	result = ""
	for class_name in sorted(implementation_map.keys()):
		result += DIVIDER_STRING

		# Add label info for vtable
		result += ".globl " + get_vtable_str(class_name) + "\n"
		result += get_vtable_str(class_name) + ":\t\t## vtable for " + class_name + "\n"

		# Add type_name and 'new' implicit method
		# ---- TODO Set this to the correct type name label
		result += format_quad_line("type_name_" + class_name)
		result += format_quad_line(class_name + "..new")

		# Iterate through all methods and add entries
		offset = 2			# Account for 2 entries above when calculating idx
		for idx, ast_method in enumerate(implementation_map[class_name]):
			method_name = ast_method.ident
			result += format_quad_line(class_name + ".." + method_name)
			tup = (class_name, method_name)
			vtable_offset_map[tup] = idx + offset

	return result

# Makes the type name strings for all classes
def get_type_name_strings():
	result = DIVIDER_STRING
	for class_name in sorted(class_map.keys()):
		result += ".globl " + class_name + " \n"
		result += class_name + ":\t\t\t## type_name string for " + class_name + "\n"
		result += "\t.asciz \"" + class_name + "\"\n"

	return result

def get_vtable_str(type_name):
	return type_name + "..vtable"

# Determines the size of a type based on its attributes
def calculate_type_size(type_name):
	return 3 + len(class_map[type_name])

def get_constructor_string():
	result = DIVIDER_STRING
	for type_name in sorted(class_map.keys()):
		result += ".globl " + type_name + "..new\n"
		result += type_name + "..new:\t\t## Constructor for " + type_name + "\n"

		# Note: This asm code is unoptimized
		asm_instr_list = gen_asm_for_constructor(type_name)

		# Add all asm instrs to result
		for asm_instr in asm_instr_list:
			result += str(asm_instr)

		result += DIVIDER_STRING

	return result

# Generates assembly to allocate 
def gen_asm_for_constructor(type_name):
	asm_instr_list = gen_asm_for_method_start()

	# Allocate space for the object based on the size via calloc(obj_size {rdi}, 8 {rsi})
	obj_size = calculate_type_size(type_name)
	size_str = format_asm_const_string(obj_size)
	asm_instr_list += [
		ASMComment("Allocate space for " + type_name),
		ASMMovQ("$8", "%rsi"),
		ASMMovQ(size_str, "%rdi"),
		ASMCall("calloc")
	]
	# Pointer to object now in RAX

	# Store type_tag, obj_size, vtable
	# ---- TODO Get type tag for obj
	type_tag = 777
	vtable_str = get_vtable_str(type_name)
	asm_instr_list += [
		ASMComment("Store type_tag, obj_size, vtable"),
		ASMMovQ(format_asm_const_string(type_tag), "0(%rax)"),
		ASMMovQ(format_asm_const_string(obj_size), "8(%rax)"),
		ASMMovQ(format_asm_const_string(vtable_str), "16(%rax)")
	]

	# Generate code for each attribute
	# ---- TODO Generate code for each attribute

	asm_instr_list += gen_asm_for_method_end()
	return asm_instr_list

def format_asm_const_string(const_int):
	return "$" + str(const_int)

# Generate list of asm intructions for the beginning of each method
#		pushq	%rbp
#		movq	%rsp, %rbp
def gen_asm_for_method_start():
	return [
		ASMPushQ("%rbp"),
		ASMMovQ("%rsp", "%rbp")
	]

# Generate list of asm instructions for end of each method call
#		leave
# 		ret
def gen_asm_for_method_end():
	return [
		ASMComment("Method cleanup"),
		ASMLeave(),
		ASMRet()
	]

if __name__ == "__main__":
	input_filename = sys.argv[1]
	prog_ast_root = get_input_list_from_annotated_ast(input_filename)

	print get_vtables_string()
	print get_constructor_string()
	print get_type_name_strings()


	'''
	gen_tac_for_ast(prog_ast_root)

	block_list = buildBasicBlocks(tac_list)

	# Remove dead code
	# computeLiveSets(block_list)
	# removeDeadCode(block_list)

	computeLiveSets(block_list)

	# for block in block_list:
	# 	print block
	# print

	# print "blocks:",len(block_list)

	is_done = False
	while not is_done:
		computeLiveSets(block_list)
		
		register_graph = build_register_graph(block_list)

		# print "graph",len(register_graph)

		combined_live_ranges = combine_block_live_ranges(block_list)

		is_done = allocate_registers(register_graph, block_list, combined_live_ranges)
	# -- end while loop

	gen_asm_for_block_list(block_list, register_colors, spilled_registers)

	old_file_ext_len = len("cl-type")
	offset_from_end = -1 * old_file_ext_len
	output_filename = input_filename[0:offset_from_end] + "s"
	output_file = open(output_filename, 'w')

	output_file.write("\t.section\t.rodata\n")
	output_file.write(".int_fmt_string:\n\t.string \"%d\"\n")
	output_file.write("\t.text\n")
	output_file.write(".globl\tmain\n\t.type\tmain, @function\nmain:\n")
	for asm_instr in asm_instr_list:
		output_file.write(str(asm_instr))
		output_file.write("\n")
	'''