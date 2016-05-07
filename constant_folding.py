from tac_objects import *
from basic_blocks import *
import copy

def fold_constants(block_list):
	has_made_changes = True

	# Reset const_in of all blocks to start new iteration
	for block in block_list:
		block.const_in = {}

	# Loop until no changes to constants
	while has_made_changes:
		# Assume no changes were made
		has_made_changes = False

		# Fold constants in block
		for block in block_list:
			# Set the current constants to a copy of the const_in for the block
			# No need to deep copy here since const_in is reset later
			cur_const = block.const_in

			# Fold constants in the block
			for tac_instr in block.instr_list:
				# if hasattr(tac_instr, "assignee"):
				const_transfer_function(cur_const, tac_instr)

			# Check for changes and update const_out
			if block.const_out != cur_const:
				has_made_changes = True
			block.const_out = cur_const

		# Update const_in of all blocks
		for child_block in block_list:
			cur_const_in = {}
			for parent_block in child_block.parents:
				parent_const_out = parent_block.const_out
				for var in parent_const_out:
					if var not in cur_const_in:
						cur_const_in[var] = parent_const_out[var]
					else:
						# print "lub of " + str(cur_const_in[var]) + " and " + str(parent_const_out[var]) + " is " + str(const_lub(cur_const_in[var], parent_const_out[var]))
						cur_const_in[var] = const_lub(cur_const_in[var], parent_const_out[var])
			child_block.const_in = cur_const_in

	# Update TAC list with constants
	for block in block_list:
		# No need to use copy here since the results can be discarded
		# cur_const = copy.copy(block.const_in)
		cur_const = block.const_in
		for idx, tac_instr in enumerate(block.instr_list):
			if hasattr(tac_instr, "assignee"):
				const_transfer_function(cur_const, tac_instr)

				val = get_const_val(cur_const, tac_instr.assignee)
				if is_constant(val):
					block.instr_list[idx] = TACConstInt("Int", tac_instr.assignee, val)

def const_transfer_function(cur_const, tac_instr):
	# old_val = get_const_val(cur_const, tac_instr.assignee)

	# C_out(x,s) = # if C_in(x,s) = #
	# if get_const_val(cur_const, tac_instr.assignee) == "#":
		# return
		# return False

	# Handle C_out(x,x <- ...) = ???
	if isinstance(tac_instr, TACConstInt):
		cur_const[tac_instr.assignee] = tac_instr.val

	# Use separate if statements for each type of arith so isinstance is only called once
	elif isinstance(tac_instr, TACPlus):
		lhs = get_const_val(cur_const, tac_instr.op1)
		rhs = get_const_val(cur_const, tac_instr.op2)
		result = "*"
		if is_constant(lhs) and is_constant(rhs):
			lhs = int(lhs)
			rhs = int(rhs)
			result = lhs + rhs
			if result > 2147483647:
				result = -2147483648 + (result - 2147483648)
			elif result < -2147483648:
				result = 2147483648 + (result + 2147483648)
		cur_const[tac_instr.assignee] = result

	elif isinstance(tac_instr, TACMinus):
		lhs = get_const_val(cur_const, tac_instr.op1)
		rhs = get_const_val(cur_const, tac_instr.op2)
		result = "*"
		if is_constant(lhs) and is_constant(rhs):
			lhs = int(lhs)
			rhs = int(rhs)
			result = lhs - rhs	
			if result > 2147483647:
				result = -2147483648 + (result - 2147483648)
			elif result < -2147483648:
				result = 2147483648 + (result + 2147483648)
		cur_const[tac_instr.assignee] = result

	elif isinstance(tac_instr, TACMult):
		lhs = get_const_val(cur_const, tac_instr.op1)
		rhs = get_const_val(cur_const, tac_instr.op2)
		result = "*"
		if is_constant(lhs) and is_constant(rhs):
			lhs = int(lhs)
			rhs = int(rhs)
			result = lhs * rhs
			if result > 2147483647:
				result = -2147483648 + (result - 2147483648)
			elif result < -2147483648:
				result = 2147483648 + (result + 2147483648)
		cur_const[tac_instr.assignee] = result

	# elif isinstance(tac_instr, TACArith):
	# 	lhs = get_const_val(cur_const, tac_instr.op1)
	# 	rhs = get_const_val(cur_const, tac_instr.op2)

	# 	if is_constant(lhs) and is_constant(rhs):
	# 		lhs = int(lhs)
	# 		rhs = int(rhs)
	# 		result = 0
	# 		if isinstance(tac_instr, TACPlus):
	# 			result = lhs + rhs
	# 		elif isinstance(tac_instr, TACMinus):
	# 			result = lhs - rhs
	# 		elif isinstance(tac_instr, TACMult):
	# 			result = lhs * rhs
	# 		elif isinstance(tac_instr, TACDiv):
	# 			if rhs != 0:
	# 				result = lhs / rhs
	# 			else:
	# 				result = "*"

	# 		if result != "*":
	# 			if result > 2147483647:
	# 				result = -2147483648 + (result - 2147483647)
	# 			elif result < -2147483648:
	# 				result = 2147483647 + (result + 2147483647)

	# 		cur_const[tac_instr.assignee] = result
	# 	else:
	# 		cur_const[tac_instr.assignee] = "*"

	elif isinstance(tac_instr, TACNegArith):
		val = get_const_val(cur_const, tac_instr.op1)
		if is_constant(val):
			val = int(val)
			cur_const[tac_instr.assignee] = val * -1
		else:
			cur_const[tac_instr.assignee] = "*"

	elif isinstance(tac_instr, TACAssign) and tac_instr.cur_exp_type == "Int":
		cur_const[tac_instr.assignee] = get_const_val(cur_const, tac_instr.op1)

	elif isinstance(tac_instr, TACNew) and tac_instr.type == "Int":
		# New ints have a default value of zero
		cur_const[tac_instr.assignee] = 0

	elif isinstance(tac_instr, TACDefault) and tac_instr.type == "Int":
		# Default ints have a default value of zero
		cur_const[tac_instr.assignee] = 0

	elif hasattr(tac_instr, 'assignee'):
		cur_const[tac_instr.assignee] = "*"
		# raise NotImplementedError(str(tac_instr.__class__.__name__) + " not yet implemented")

	# Return whether or not the value was changed
	# return get_const_val(cur_const, tac_instr.assignee) != old_val


def get_const_val(cur_const, var):
	if var in cur_const:
		return cur_const[var]

	# Return * if the symbol has not been added yet
	return "*"

def is_constant(c):
	return c != "#" and c != "*"

def const_lub(lhs_const, rhs_const):
	if lhs_const == rhs_const:
		return lhs_const

	# Return top if either lhs or rhs at top
	elif lhs_const == "*" or rhs_const == "*":
		return "*"

	# Return constant c if lhs and rhs are c and #
	elif lhs_const == "#" and rhs_const != "#":
		return rhs_const
	elif lhs_const != "#" and rhs_const == "#":
		return lhs_const

	# Return * if lhs = c and rhs = d
	else:
		return "*"


if __name__ == "__main__":
	tac_list = [
		TACConstInt("Int", "1", "1"),
		TACConstInt("Int", "2", "2"),
		TACConstInt("Int", "3", "3"),
		TACPlus("Int", "4", "2", "3"),
		TACMinus("Int", "5", "1", "4"),
		TACNegArith("Int", "6", "5"),
		TACAssign("Int", "0", "6")
	]

	block_list = buildBasicBlocks(tac_list)

	for block in block_list:
		print block

	fold_constants(block_list)

	for block in block_list:
		print block