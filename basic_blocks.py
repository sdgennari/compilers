from tac_objects import *
import copy
import re
import sys

class TACBasicBlock:
	def __init__(self, instr_list):
		self.parents = []
		self.children = []

		self.parent_labels = []
		self.child_labels = []
		self.instr_list = instr_list

		# Initialize empty liveness sets
		self.live_in = set()
		self.live_out = set()
		self.liveness_sets_ready = False

		# Keep a list of all live sets and live ranges
		self.live_set_list = []
		self.live_ranges = {}

		# First item in instr_list will always be TACLabel, so get label for the block
		if hasattr(instr_list[0], "label"):
			self.label = instr_list[0].label
		else:
			self.label = "Block without beginning label"

		# Populate child labels
		for instr in instr_list:
			if isinstance(instr, TACJmp) or isinstance(instr, TACBt):
				self.child_labels += [instr.label]

	def __str__(self):
		s = "Label: " + str(self.label) + "\n"
		s += "Parents: "
		for parent in self.parents:
			s += parent.label + ", "
		s += "\n"
		s += "Children: "
		for child in self.children:
			s += child.label + ", "
		s += "\n"
		s += "Live In: " + str(self.live_in) + "\n"
		s += "Live Out: " + str(self.live_out) + "\n"
		for idx, instr in enumerate(self.instr_list):
			s += str(idx) + "\t" + str(instr) + "\n"
		return s

def get_file_line_list(filename):
	file_lines = []
	input_file = open(filename, 'r')
	is_nextline_string = False
	for line in input_file:
		line = line.strip('\r').strip('\n')
		
		# Put strings on the same line as the string assignment
		if is_nextline_string:
			file_lines[-1] += " " + line
			# print file_lines[-1]
			is_nextline_string = False
		# Check current line to see if next line is a string
		else:
			# Mark next string as line if needed
			if re.match(r"t\$(\d)+ \<\- string", line):
				is_nextline_string = True
			# Add current line to file_lines
			file_lines.append(line)

	# Return list of lines in the file
	return file_lines

def build_TAC_instr_list(file_line_list):
	TAC_instr_list = []
	for line in file_line_list:
		# Get the parts of the line
		line_parts = line.split()

		# Handle control flow TAC instr with different form
		if line_parts[0] == "jmp":			# Jumps
			TAC_instr_list.append(TACJmp(line_parts[1]))
		elif line_parts [0] == "label":		# Labels
			TAC_instr_list.append(TACLabel(line_parts[1]))
		elif line_parts[0] == "return":		# Returns
			TAC_instr_list.append(TACReturn(line_parts[1]))
		elif line_parts[0] == "comment":	# Comments
			TAC_instr_list.append(TACComment(" ".join(line_parts[1:])))
		elif line_parts[0] == "bt":			# Branches
			TAC_instr_list.append(TACBt(line_parts[1], line_parts[2]))
		# Handle assignments here since all other TAC instr have > 3 parts
		elif len(line_parts) == 3:
			TAC_instr_list.append(TACAssign(line_parts[0], line_parts[2]))
		# Handle general structure of remaining TAC instrs
		# line_parts[0] = assignee
		# line_parts[1] = '<-'
		# line_parts[2] = type of instr ('int', 'default', '*', etc.)
		# line_parts[3] = op1
		# line_parts[4] = op2 (if present)
		else:
			assignee = line_parts[0]
			instr_type = line_parts[2]
			op1 = line_parts[3]
			op2 = None
			if len(line_parts) > 4:
				op2 = line_parts[4]

			# Handle strings here because line.split() chops up strings
			if instr_type == "string":
				TAC_instr_list.append(TACConstString(assignee, " ".join(line_parts[3:])))

			if op2 == None:		# Instr with only 1 op
				if instr_type == "int":			# Int constant
					TAC_instr_list.append(TACConstInt(assignee, op1))
				elif instr_type == "bool":		# Bool constant
					TAC_instr_list.append(TACConstBool(assignee, op1))
				elif instr_type == "not":		# Boolean negation
					TAC_instr_list.append(TACNegBool(assignee, op1))
				elif instr_type == "~":			# Arithmetic negation
					TAC_instr_list.append(TACNegArith(assignee, op1))
				elif instr_type == "new":		# Allocation with 'new'
					TAC_instr_list.append(TACAlloc(assignee, op1))		# op1 = type
				elif instr_type == "default":	# Default value
					TAC_instr_list.append(TACDefault(assignee, op1))	# op1 = type
				elif instr_type == "isvoid":
					TAC_instr_list.append(TACIsVoid(assignee, op1))
				elif instr_type == "call":
					if op1 == "in_int":
						TAC_instr_list.append(TACInInt(assignee))
					elif op1 == "in_string":
						TAC_instr_list.append(TACInString(assignee))

			else:				# Instr with 2 ops
				if instr_type == "call":		# Various call instr (op1 = type of call)
					if op1 == "out_int":
						TAC_instr_list.append(TACOutInt(assignee, op2))
					elif op1 == "out_string":
						TAC_instr_list.append(TACOutString(assignee, op2))
				elif instr_type == "+":
					TAC_instr_list.append(TACPlus(assignee, op1, op2))
				elif instr_type == "-":
					TAC_instr_list.append(TACMinus(assignee, op1, op2))
				elif instr_type == "*":
					TAC_instr_list.append(TACMult(assignee, op1, op2))
				elif instr_type == "/":
					TAC_instr_list.append(TACDiv(assignee, op1, op2))
				elif instr_type == "<":
					TAC_instr_list.append(TACCompL(assignee, op1, op2))
				elif instr_type == "<=":
					TAC_instr_list.append(TACCompLE(assignee, op1, op2))
				elif instr_type == "=":
					TAC_instr_list.append(TACCompE(assignee, op1, op2))

	return TAC_instr_list

def buildBasicBlocks(TAC_instr_list):
	block_list = []
	block_instr_list = []
	for TAC_instr in TAC_instr_list:
		# If the current instr is a label, start a new basic block
		if isinstance(TAC_instr, TACLabel) and len(block_instr_list) != 0:
			# label = block_instr_list[0].label
			block_list.append(TACBasicBlock(block_instr_list))
			block_instr_list = []

		# Add the current instruction to instr list
		if not isinstance(TAC_instr, TACComment):
			block_instr_list.append(TAC_instr)

	# Add the final basic block to the block map
	# label = block_instr_list[0].label
	block_list.append(TACBasicBlock(block_instr_list))

	for parent in block_list:
		for child_label in parent.child_labels:
			for block in block_list:
				if block.label == child_label:
					parent.children += [block]
					block.parents += [parent]

	# Return list of basic blocks
	return block_list

def computeLiveSets(block_list):
	has_live_in_changed = True

	# Loop until live_in == live_in'
	while has_live_in_changed:
		# Assume live in has not changed
		has_live_in_changed = False

		for block in block_list:
			# Reset the current live_set_list
			block.live_set_list = []

			# Compute live_in for that block
			cur_live_in = copy.copy(block.live_out)
			for TAC_instr in reversed(block.instr_list):

				# Handle TACCall explicitly
				if isinstance(TAC_instr, TACStaticCall) or isinstance(TAC_instr, TACDynamicCall):
					# Add receiver object to live set
					cur_live_in.add(TAC_instr.receiver_obj)

				# Remove assignee from live_in
				if hasattr(TAC_instr, 'assignee'):
					cur_live_in.discard(TAC_instr.assignee)

				# Add op1
				if hasattr(TAC_instr, 'op1'):
					cur_live_in.add(TAC_instr.op1)

				# Add op2
				if hasattr(TAC_instr, 'op2'):
					cur_live_in.add(TAC_instr.op2)

				# Add current live set to live set list
				block.live_set_list.insert(0, copy.copy(list(cur_live_in)))
			# -- end TAC instr loop

			# Check if live in changed
			if block.live_in != cur_live_in:
				has_live_in_changed = True
			block.live_in = cur_live_in

			# Compute live ranges based on live set list
			block.live_ranges = {}
			for live_set in block.live_set_list:
				for virtual_reg in live_set:
					if block.live_ranges.has_key(virtual_reg):
						block.live_ranges[virtual_reg] += 1
					else:
						block.live_ranges[virtual_reg] = 1
				# -- end virtual reg loop
			# -- end live set loop
		# -- end loop to compute new live in sets

		# Compute live out for parent
		for parent_block in block_list:
			# Set parent's live_out to union of children's line_in
			cur_live_out = set()
			for child_block in parent_block.children:
				cur_live_out = cur_live_out.union(child_block.live_in)	
			parent_block.live_out = cur_live_out
		# -- end loop to update parent live out sets

	# -- end main while loop

def removeDeadCode(block_list):
	has_made_changes = False
	for block in block_list:
		cur_live_set = block.live_out
		instr_to_remove = []

		for TAC_instr in reversed(block.instr_list):
			# Skip control flow or io calls since they cannot be removed
			if not (isinstance(TAC_instr, TACIOCall) or isinstance(TAC_instr, TACControlFlow)):
				# If assignee not currently live, instr can be removed
				if TAC_instr.assignee not in cur_live_set:
					has_made_changes = True
					instr_to_remove += [TAC_instr]

			# Update cur_live_set based on assignee, op1, and op2
			if hasattr(TAC_instr, 'assignee'):
				cur_live_set.discard(TAC_instr.assignee)
			if hasattr(TAC_instr, 'op1'):
				cur_live_set.add(TAC_instr.op1)
			if hasattr(TAC_instr, 'op2'):
				cur_live_set.add(TAC_instr.op2)
		# -- end TAC_instr for loop

		# Remove all instr marked for removal
		block.instr_list = [instr for instr in block.instr_list if instr not in instr_to_remove]
	# -- end block for loop

	# If instr were removed from any block, recompute liveness and try to remove dead code again
	if has_made_changes:
		computeLiveSets(block_list)
		removeDeadCode(block_list)

def printOutput(block_list):
	print "comment start"
	for block in block_list:
		for TAC_instr in block.instr_list:
			print TAC_instr

if __name__ == "__main__":
	input_filename = sys.argv[1]
	file_lines = get_file_line_list(input_filename)
	TAC_instr_list = build_TAC_instr_list(file_lines)
	block_list = buildBasicBlocks(TAC_instr_list)
	computeLiveSets(block_list)
	removeDeadCode(block_list)
	printOutput(block_list)