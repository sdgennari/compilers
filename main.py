# Import TAC classes
from tac_objects import *
from basic_blocks import *
from ast_nodes import *
from tac_to_asm import *
from ast_to_tac import *
from allocate_registers import *
import copy
import sys

if __name__ == "__main__":
	input_filename = sys.argv[1]
	prog_ast_root = get_input_list_from_annotated_ast(input_filename)
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