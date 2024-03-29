# Import TAC classes
from tac_objects import *
from basic_blocks import *
from ast_nodes import *
from tac_to_asm import *
from ast_to_tac import *
import copy
import re
import sys

NUM_REGISTERS = 12

# def allocate_registers(original_register_graph, block_list, original_combined_live_ranges):
def allocate_registers(original_register_graph, block_list, combined_live_ranges, spilled_reg_list):
	register_colors = {}

	# Make copies of original values to avoid destorying graph
	register_graph = copy.copy(original_register_graph)
	# combined_live_ranges = copy.copy(original_combined_live_ranges)

	registers_to_color_list = []
	registers_to_spill_list = []

	# Loop until all registers have been removed
	while register_graph:

		# Find the node to remove from the graph
		node_to_remove = None
		for node in register_graph.keys():
			# Get the first node with fewer than k edges
			if len(register_graph[node]) < NUM_REGISTERS:
				node_to_remove = node
				break;
		# -- end node loop

		# If no node to remove for coloring, spill one
		if not node_to_remove:
			# Select node with the longest live range to spill
			# Note: do not remove a node that was already spilled
			max_range = -1
			for node in combined_live_ranges:
				live_range = combined_live_ranges[node]
				if live_range > max_range and node not in spilled_reg_list:
					max_range = live_range
					node_to_remove = node
			# -- end max loop

			# if node_to_remove == None:
			# 	for block in block_list:
			# 		for instr in block.instr_list:
			# 			print instr

			# Add selected register to spill list
			registers_to_spill_list.append(node_to_remove)

			# print "Spilling", node_to_remove
		else:
			registers_to_color_list.append(node_to_remove)
		# -- end if

		# Remove node from graph and continue iteration
		adj_list = register_graph.pop(node_to_remove)
		for adj_node in adj_list:
			register_graph[adj_node].discard(node_to_remove)

		# Remove node from combined live ranges
		if node_to_remove in combined_live_ranges:
			combined_live_ranges.pop(node_to_remove)

		# print "Removed", node_to_remove
	# -- end while

	# print "Colored Registers:"	
	# print registers_to_color_list
	# print
	
	# print "Spilled Registers:"
	# print registers_to_spill_list
	# print

	# Spill all required registers
	for register in registers_to_spill_list:
		spilled_reg_list.append(register)
		spill_register(block_list, register)

	# If registers had to be spilled, do not compute colors since the liveness will change
	if registers_to_spill_list:
		return None

	# If nothing was spilled, color the graph
	colors = [0]

	while registers_to_color_list:
		# Pop a register off the end of the color list
		register = registers_to_color_list.pop()

		# Check each color to find the smallest valid one
		best_color = -1
		for color in colors:
			is_color_valid = True
			adj_list = original_register_graph[register]
			for adj_node in adj_list:
				if adj_node in register_colors:
					if register_colors[adj_node] == color:
						is_color_valid = False
			# -- end adj_list loop

			if is_color_valid:
				best_color = color
				break
		# -- end color loop

		# If no valid color was found, add a new one to the list of colors
		if best_color == -1:
			colors.append(len(colors))
			best_color = colors[-1]

		register_colors[register] = best_color
	# -- end register coloring loop

	# print "Used",len(colors),"colors"
	# for register in register_colors:
	# 	print register,":",register_colors[register]
	# print

	return register_colors


def spill_register(block_list, register_to_spill):
	# In comments below, let tX = register_to_spill

	# print "spilling register: " + str(register_to_spill)

	# Spill register in all blocks in the list
	for block in block_list:

		it = enumerate(block.instr_list)
		for idx, instr in it:

			# If tX is op1 or op2, add TACLoad immediately before in list
			if is_operand(instr, register_to_spill):
				block.instr_list.insert(idx, TACLoad(register_to_spill, register_to_spill))
				next(it)
				idx = idx + 1

			if is_assignee(instr, register_to_spill):
				block.instr_list.insert(idx+1, TACStore(register_to_spill))
				next(it)
				idx = idx + 1

	#-- end block loop


def combine_block_live_ranges(block_list):
	# NOTE: This returns an approximation of the live range for the registers in
	#	the given block list. Branches, disjoint live ranges, etc. are not explicitly
	#	handled
	live_ranges = {}
	for block in block_list:
		for register in block.live_ranges:

			# Add the register to live_ranges if not present
			if register not in live_ranges:
				live_ranges[register] = 0

			# Add the live range count to live_ranges
			live_ranges[register] += block.live_ranges[register]

	return live_ranges

def is_operand(tac_instr, register_to_spill):
	if hasattr(tac_instr, "op1"):
		if tac_instr.op1 == register_to_spill:
			return True
	if hasattr(tac_instr, "op2"):
		if tac_instr.op2 == register_to_spill:
			return True
	return False

def is_assignee(tac_instr, register_to_spill):
	if hasattr(tac_instr, "assignee"):
		if tac_instr.assignee == register_to_spill:
			return True
	return False

def build_register_graph(block_list):
	register_graph = {}

	for block in block_list:

		# DEBUG
		# output_list = []

		cur_live_set = copy.copy(block.live_out)
		for tac_instr in reversed(block.instr_list):

			# Update the liveness information
			if isinstance(tac_instr, TACStaticCall) or isinstance(tac_instr, TACDynamicCall):
				cur_live_set.add(tac_instr.receiver_obj)

			if hasattr(tac_instr, 'op1'):
				cur_live_set.add(tac_instr.op1)

			if hasattr(tac_instr, 'op2'):
				cur_live_set.add(tac_instr.op2)

			# Check if the current instr has an assignee
			assignee = None
			if hasattr(tac_instr, "assignee"):
				cur_live_set.discard(tac_instr.assignee)

				assignee = tac_instr.assignee

				# If the assignee is not in the graph, add it
				if assignee not in register_graph:
					register_graph[assignee] = set()

			# Registers in the same live set should have edges in the graph
			cur_live_list = list(cur_live_set);

			# DEBUG
			# output_list.append(str(tac_instr) + "\t\t" + str(cur_live_list))

			for i in range(len(cur_live_set)):
				reg1 = cur_live_list[i]

				# If the register is not in the graph, add it
				if reg1 not in register_graph:
					register_graph[reg1] = set()

				# Loop through other registers to add edges
				for j in range(i+1, len(cur_live_set)):
					# Get the registers from the live set
					reg2 = cur_live_list[j]

					# If the register is not in the graph, add it
					if reg2 not in register_graph:
						register_graph[reg2] = set()

					# Add an edge between the registers in the graph
					if reg2 not in register_graph[reg1]:
						register_graph[reg1].add(reg2)
					if reg1 not in register_graph[reg2]:
						register_graph[reg2].add(reg1)
				# -- end j loop

				# Handle assignee explicitly
				if assignee != None:
					register_graph[reg1].add(assignee)
					register_graph[assignee].add(reg1)

					
			# -- end i loop
		# -- end live_set loop
		# DEBUG
		# for string in reversed(output_list):
		# 	print string
		# print
	# -- end block loop

	# print "Register Graph:"
	# for register in register_graph:
	# 	print register, ":", list(register_graph[register])
	# print

	return register_graph