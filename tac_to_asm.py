from tac_objects import *
from asm_objects import *
from shared_vars import *
from asm_internals import *
import sys

# Initialize global vars
asm_label_counter = 0
const_string_label_counter = 0

register_names_32 = [
	"%r8d", "%r9d", "%r10d",
	"%r11d", "%r12d", "%r13d",
	"%r14d", "%r15d", "%ecx",
	"%edx", "%esi",	"%edi",
]

register_names_64 = [
	"%r8", "%r9", "%r10",
	"%r11", "%r12", "%r13",
	"%r14", "%r15", "%rcx",
	"%rdx", "%rsi",	"%rdi",
]

def new_const_string_label():
	global const_string_label_counter
	const_string_label_counter += 1
	return "string_" + str(const_string_label_counter)

# Returns the label for the string or makes a new one
def get_const_string_label(string):
	if string not in const_string_label_map:
		const_string_label_map[string] = new_const_string_label()
	return const_string_label_map[string]

def next_asm_label():
	global asm_label_counter
	asm_label_counter += 1
	return ".asm_label_" + str(asm_label_counter)

def get_asm_register(register_color_map, tac_register, size=32):
	asm_reg_idx = register_color_map[tac_register]

	# Get different name depending on register size
	if size == 32:
		register_name = register_names_32[asm_reg_idx]
	elif size == 64:
		register_name = register_names_64[asm_reg_idx]
	else:
		raise ValueError("Invalid register size")

	return register_name

# BOXED + UNBOXED
def gen_asm_for_tac_const_int(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_const_int):
	src = "$" + str(tac_const_int.val)
	dest = get_asm_register(register_color_map, tac_const_int.assignee, 64)
	# dest_reg_offset = "24("+dest+")"

	# Create a new Int and put value into box
	# cur_asm_list.append(ASMComment("new const Int: " + str(tac_const_int.val)))
	# gen_asm_for_new_boxed_type(cur_asm_list, "Int", dest)
	# cur_asm_list.append(ASMMovL(src, dest_reg_offset))

	cur_asm_list.append(ASMComment("new const Int: " + str(tac_const_int.val)))
	cur_asm_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_const_bool(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_const_bool):
	if tac_const_bool.val == "true":
		src = "$1"
	else:
		src = "$0"

	dest = get_asm_register(register_color_map, tac_const_bool.assignee, 64)
	# dest_reg_offset = "24("+dest+")"

	# Create new Bool and put value into box
	# cur_asm_list.append(ASMComment("const Bool"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "Bool", dest)
	# cur_asm_list.append(ASMMovL(src, dest_reg_offset))
	cur_asm_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_const_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_const_string):
	src = "$" + get_const_string_label(tac_const_string.val)
	dest = get_asm_register(register_color_map, tac_const_string.assignee, 64)
	# dest_reg_offset = "24("+dest+")"

	# Create new String and put raw string ptr into box
	# cur_asm_list.append(ASMComment("const String"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "String", dest)
	# cur_asm_list.append(ASMMovQ(src, dest_reg_offset))

	cur_asm_list.append(ASMComment("new const String"))
	cur_asm_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_default(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_default):
	# Set default value to $0
	src = "$0"

	# Change default value for Strings and raw Strings
	if tac_default.type == "String" or tac_default.type == "raw.String":
		src = "$empty.string"

	# Get the dest register
	dest = get_asm_register(register_color_map, tac_default.assignee, 64)

	cur_asm_list.append(ASMComment("default " + tac_default.type))
	cur_asm_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_label(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_label):
	asm_label = "." + tac_label.label

	cur_asm_list.append(ASMLabel(asm_label))

# BOXED + UNBOXED
def gen_asm_for_tac_not(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_neg_bool):
	# Uses unboxed values, so have 32-bit registers
	src = get_asm_register(register_color_map, tac_neg_bool.op1)
	dest = get_asm_register(register_color_map, tac_neg_bool.assignee)

	cur_asm_list.append(ASMComment("not"))
	cur_asm_list.append(ASMMovL(src, dest))
	cur_asm_list.append(ASMXorL("$1", dest))

# BOXED + UNBOXED
def gen_asm_for_tac_negate(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_neg_arith):
	# Uses unboxed values, so have 32-bit registers
	src = get_asm_register(register_color_map, tac_neg_arith.op1)
	dest = get_asm_register(register_color_map, tac_neg_arith.assignee)

	cur_asm_list.append(ASMComment("negate"))
	cur_asm_list.append(ASMMovL(src, dest))
	cur_asm_list.append(ASMNegL(dest))

# BOXED + UNBOXED
def gen_asm_for_tac_assign(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_assign):
	src = get_asm_register(register_color_map, tac_assign.op1, 64)
	dest = get_asm_register(register_color_map, tac_assign.assignee, 64)

	cur_asm_list.append(ASMComment("assign"))
	cur_asm_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_new(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_new):
	dest = get_asm_register(register_color_map, tac_new.assignee, 64)
	cur_asm_list.append(ASMComment("new " + tac_new.type))

	# If new type is unboxed, just move the default value into dest
	if tac_new.type == "Int" or tac_new.type == "Bool":
		cur_asm_list.append(ASMMovQ("$0", dest))
	elif tac_new.type == "String":
		cur_asm_list.append(ASMMovQ("$empty.string", dest))
	else:
		gen_asm_for_new_boxed_type(cur_asm_list, tac_new.type, dest)

# BOXED + UNBOXED
def gen_asm_for_tac_new_self_type(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	dest = get_asm_register(register_color_map, tac_instr.assignee, 64)

	cur_asm_list.append(ASMComment("Lookup 'new' in vtable for self"))
	# Get vtable ptr
	cur_asm_list.append(ASMMovQ("16(%rbx)", "%rax"))

	# Find constructor dynamically
	cur_asm_list.append(ASMMovQ("8(%rax)", "%rax"))

	# Call method
	cur_asm_list.append(ASMCall("*%rax"))

	# Move result into dest
	cur_asm_list.append(ASMMovQ("%rax", dest))

# BOXED + UNBOXED
def gen_asm_for_tac_return(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_return):
	src = get_asm_register(register_color_map, tac_return.op1, 64)
	dest = "%rax"

	cur_asm_list.append(ASMComment("move ret val " + src + " into " + dest))
	cur_asm_list.append(ASMMovQ(src, dest));

# BOXED + UNBOXED
def gen_asm_for_tac_jmp(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_jmp):
	label = "." + str(tac_jmp.label)

	cur_asm_list.append(ASMJmp(label))

def gen_asm_for_tac_bt(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_bt):
	label = "." + str(tac_bt.label)
	reg = get_asm_register(register_color_map, tac_bt.op1)

	# cur_asm_list.append(ASMCmpL("$1", reg))
	# cur_asm_list.append(ASMJmpEq(label))

	cur_asm_list.append(ASMComment("branch " + label))
	cur_asm_list.append(ASMTestL(reg, reg))
	cur_asm_list.append(ASMJmpNz(label))
	# raise NotImplementedError("branch not yet implemented")

# ---- TODO Update for boxing + unboxing
def gen_asm_for_tac_store(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_store):
	# raise NotImplementedError("tac_store not yet implemented")
	src = get_asm_register(register_color_map, tac_store.op1, 64)
	offset = spilled_reg_loc_map[tac_store.op1]

	dest = str(offset) + "(%rbp)"

	cur_asm_list.append(ASMComment("store"))
	cur_asm_list.append(ASMMovQ(src, dest))

# ---- TODO Update for boxing + unboxing
def gen_asm_for_tac_load(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_load):
	# raise NotImplementedError("tac_load not yet implemented")
	dest = get_asm_register(register_color_map, tac_load.assignee, 64)

	offset = spilled_reg_loc_map[tac_load.location]
	src = str(offset) + "(%rbp)"

	cur_asm_list.append(ASMComment("load"))
	cur_asm_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_plus(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_plus):
	# Uses unboxed values, so have 32-bit registers
	op1_reg = get_asm_register(register_color_map, tac_plus.op1, 32)
	op2_reg = get_asm_register(register_color_map, tac_plus.op2, 32)
	dest = get_asm_register(register_color_map, tac_plus.assignee, 32)

	cur_asm_list.append(ASMComment("plus"))
	
	if op2_reg == dest:
		cur_asm_list.append(ASMAddL(op1_reg, dest))
	else:
		cur_asm_list.append(ASMMovL(op1_reg, dest))
		cur_asm_list.append(ASMAddL(op2_reg, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_minus(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_minus):
	# Uses unboxed values, so have 32-bit registers
	op1_reg = get_asm_register(register_color_map, tac_minus.op1, 32)
	op2_reg = get_asm_register(register_color_map, tac_minus.op2, 32)
	dest = get_asm_register(register_color_map, tac_minus.assignee, 32)

	cur_asm_list.append(ASMComment("minus"))

	if op2_reg == dest:
		cur_asm_list.append(ASMSubL(op1_reg, dest))
		cur_asm_list.append(ASMNegL(dest))
	else:
		cur_asm_list.append(ASMMovL(op1_reg, dest))
		cur_asm_list.append(ASMSubL(op2_reg, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_mult(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_mult):
	# Uses unboxed values, so have 32-bit registers
	op1_reg = get_asm_register(register_color_map, tac_mult.op1, 32)
	op2_reg = get_asm_register(register_color_map, tac_mult.op2, 32)
	dest = get_asm_register(register_color_map, tac_mult.assignee, 32)

	cur_asm_list.append(ASMComment("mult"))

	if op2_reg == dest:
		cur_asm_list.append(ASMImulL(op1_reg, dest))
	else:
		cur_asm_list.append(ASMMovL(op1_reg, dest))
		cur_asm_list.append(ASMImulL(op2_reg, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_div(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_div):
	# Uses unboxed values, so have 32-bit registers
	#rX = rY / rZ
	op1_reg = get_asm_register(register_color_map, tac_div.op1, 32)
	op2_reg = get_asm_register(register_color_map, tac_div.op2, 32)
	dest = get_asm_register(register_color_map, tac_div.assignee, 32)

	cur_asm_list.append(ASMComment("divide"))

	cur_asm_list.append(ASMComment("if " + op2_reg + " not zero, jmp over error"))
	div_label = next_asm_label()
	cur_asm_list.append(ASMCmpL("$0", op2_reg))
	cur_asm_list.append(ASMJmpNz(div_label))
	gen_asm_for_error(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_div.line, "division by zero")
	cur_asm_list.append(ASMLabel(div_label))

	# Alloc temp stack space
	cur_asm_list.append(ASMSubQ("$8", "%rsp"))

	# Save registers
	cur_asm_list.append(ASMPushQ("%rdx"))
	cur_asm_list.append(ASMPushQ("%rax"))
	cur_asm_list.append(ASMPushQ("%rcx"))

	# Store rZ in temp space on stack
	cur_asm_list.append(ASMMovL(op2_reg, "24(%rsp)"))

	# Move rY into eax
	cur_asm_list.append(ASMMovL(op1_reg, "%eax"))

	# Zero extend eax to edx:eax
	cur_asm_list.append(ASMCltd())

	# Move rZ from stack to ecx
	cur_asm_list.append(ASMMovL("24(%rsp)", "%ecx"))

	# Divide rY by rZ
	cur_asm_list.append(ASMIdivL("%ecx"))

	# Store result in temp space on stack
	cur_asm_list.append(ASMMovL("%eax", "28(%rsp)"))

	# Restore registers
	cur_asm_list.append(ASMPopQ("%rcx"))
	cur_asm_list.append(ASMPopQ("%rax"))
	cur_asm_list.append(ASMPopQ("%rdx"))

	# Save result
	cur_asm_list.append(ASMMovL("4(%rsp)", dest))

	# Dealloc temp stack space
	cur_asm_list.append(ASMAddQ("$8", "%rsp"))

def gen_asm_for_tac_comp_l(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_l):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg = get_asm_register(register_color_map, tac_comp_l.op1, 64)
	op2_reg = get_asm_register(register_color_map, tac_comp_l.op2, 64)
	dest = get_asm_register(register_color_map, tac_comp_l.assignee, 64)

	cur_asm_list.append(ASMComment("use lt_helper to compare " + op1_reg + " < " + op2_reg))

	# Save all caller-saved regs
	cur_asm_list.append(ASMComment("push caller-saved regs and self ptr"))
	for reg in caller_saved_registers:
		cur_asm_list.append(ASMPushQ(reg))
	cur_asm_list.append(ASMPushQ(SELF_REG))

	# Push lhs and rhs regs
	cur_asm_list.append(ASMComment("push lhs (" + op1_reg + ") and rhs (" + op2_reg + ")"))
	cur_asm_list.append(ASMPushQ(op2_reg))
	cur_asm_list.append(ASMPushQ(op1_reg))

	# Call lt_helper
	cur_asm_list.append(ASMCall("lt_helper"))

	# Add 16 to stack to remove pushed lhs and rhs
	cur_asm_list.append(ASMAddQ("$16", "%rsp"))

	# Restore all caller-saved regs
	cur_asm_list.append(ASMComment("pop self ptr and caller-saved regs"))
	cur_asm_list.append(ASMPopQ(SELF_REG))
	for reg in reversed(caller_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

	# Move result into dest
	cur_asm_list.append(ASMComment("move comparison result into " + dest))
	cur_asm_list.append(ASMMovQ("%rax", dest))

def gen_asm_for_tac_comp_l_unboxed(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_l):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg_32 = get_asm_register(register_color_map, tac_comp_l.op1)
	op2_reg_32 = get_asm_register(register_color_map, tac_comp_l.op2)
	dest = get_asm_register(register_color_map, tac_comp_l.assignee, 64)

	# Compare 32-bit values in lhs and rhs
	cur_asm_list.append(ASMComment("compare " + op1_reg_32 + " and " + op2_reg_32 + " inline"))
	cur_asm_list.append(ASMCmpL(op2_reg_32, op1_reg_32))
	cur_asm_list.append(ASMMovQ("$0", dest))
	cur_asm_list.append(ASMMovQ("$1", "%rax"))
	cur_asm_list.append(ASMCmovL("%rax", dest))

def gen_asm_for_tac_comp_l_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_l):
	raise NotImplementedError("Unboxed string comparison not yet implemented")

def gen_asm_for_tac_comp_le(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_le):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg = get_asm_register(register_color_map, tac_comp_le.op1, 64)
	op2_reg = get_asm_register(register_color_map, tac_comp_le.op2, 64)
	dest = get_asm_register(register_color_map, tac_comp_le.assignee, 64)

	cur_asm_list.append(ASMComment("use le_helper to compare " + op1_reg + " <= " + op2_reg))

	# Save all caller-saved regs
	cur_asm_list.append(ASMComment("push caller-saved regs and self ptr"))
	for reg in caller_saved_registers:
		cur_asm_list.append(ASMPushQ(reg))
	cur_asm_list.append(ASMPushQ(SELF_REG))

	# Push lhs and rhs regs
	cur_asm_list.append(ASMComment("push lhs (" + op1_reg + ") and rhs (" + op2_reg + ")"))
	cur_asm_list.append(ASMPushQ(op2_reg))
	cur_asm_list.append(ASMPushQ(op1_reg))

	# Call lt_helper
	cur_asm_list.append(ASMCall("le_helper"))

	# Add 16 to stack to remove pushed lhs and rhs
	cur_asm_list.append(ASMAddQ("$16", "%rsp"))

	# Restore all caller-saved regs
	cur_asm_list.append(ASMComment("pop self ptr and caller-saved regs"))
	cur_asm_list.append(ASMPopQ(SELF_REG))
	for reg in reversed(caller_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

	# Move result into dest
	cur_asm_list.append(ASMComment("move comparison result into " + dest))
	cur_asm_list.append(ASMMovQ("%rax", dest))

def gen_asm_for_tac_comp_le_unboxed(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_le):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg_32 = get_asm_register(register_color_map, tac_comp_le.op1)
	op2_reg_32 = get_asm_register(register_color_map, tac_comp_le.op2)
	dest = get_asm_register(register_color_map, tac_comp_le.assignee, 64)

	# Compare 32-bit values in lhs and rhs
	cur_asm_list.append(ASMComment("compare " + op1_reg_32 + " and " + op2_reg_32 + " inline"))
	cur_asm_list.append(ASMCmpL(op2_reg_32, op1_reg_32))
	cur_asm_list.append(ASMMovQ("$0", dest))
	cur_asm_list.append(ASMMovQ("$1", "%rax"))
	cur_asm_list.append(ASMCmovLe("%rax", dest))

def gen_asm_for_tac_comp_le_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_le):
	raise NotImplementedError("Unboxed string comparison not yet implemented")

def gen_asm_for_tac_comp_e(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_eq):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg = get_asm_register(register_color_map, tac_comp_eq.op1, 64)
	op2_reg = get_asm_register(register_color_map, tac_comp_eq.op2, 64)
	dest = get_asm_register(register_color_map, tac_comp_eq.assignee, 64)

	cur_asm_list.append(ASMComment("use eq_helper to compare " + op1_reg + " = " + op2_reg))

	# Save all caller-saved regs
	cur_asm_list.append(ASMComment("push caller-saved regs and self ptr"))
	for reg in caller_saved_registers:
		cur_asm_list.append(ASMPushQ(reg))
	cur_asm_list.append(ASMPushQ(SELF_REG))

	# Push lhs and rhs regs
	cur_asm_list.append(ASMComment("push lhs (" + op1_reg + ") and rhs (" + op2_reg + ")"))
	cur_asm_list.append(ASMPushQ(op2_reg))
	cur_asm_list.append(ASMPushQ(op1_reg))

	# Call lt_helper
	cur_asm_list.append(ASMCall("eq_helper"))

	# Add 16 to stack to remove pushed lhs and rhs
	cur_asm_list.append(ASMAddQ("$16", "%rsp"))

	# Restore all caller-saved regs
	cur_asm_list.append(ASMComment("pop self ptr and caller-saved regs"))
	cur_asm_list.append(ASMPopQ(SELF_REG))
	for reg in reversed(caller_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

	# Move result into dest
	cur_asm_list.append(ASMComment("move comparison result into " + dest))
	cur_asm_list.append(ASMMovQ("%rax", dest))

def gen_asm_for_tac_comp_e_unboxed(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_eq):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg_32 = get_asm_register(register_color_map, tac_comp_eq.op1)
	op2_reg_32 = get_asm_register(register_color_map, tac_comp_eq.op2)
	dest = get_asm_register(register_color_map, tac_comp_eq.assignee, 64)

	# Compare 32-bit values in lhs and rhs
	cur_asm_list.append(ASMComment("compare " + op1_reg_32 + " and " + op2_reg_32 + " inline"))
	cur_asm_list.append(ASMCmpL(op2_reg_32, op1_reg_32))
	cur_asm_list.append(ASMMovQ("$0", dest))
	cur_asm_list.append(ASMMovQ("$1", "%rax"))
	cur_asm_list.append(ASMCmovE("%rax", dest))

def gen_asm_for_tac_comp_e_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_comp_eq_string):
	raise NotImplementedError("Unboxed string comparison not yet implemented")

# BOXED + UNBOXED
def gen_asm_for_tac_box(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_box):
	op1_reg = get_asm_register(register_color_map, tac_box.op1, 64)
	dest = get_asm_register(register_color_map, tac_box.assignee, 64)

	constructor_method = tac_box.exp_type + "..new"
	dest_reg_offset = "24(" + dest + ")"

	cur_asm_list.append(ASMComment("box value of " + op1_reg + " into " + dest),)
	gen_asm_for_new_boxed_type(cur_asm_list, tac_box.exp_type, dest)
	cur_asm_list.append(ASMMovQ(op1_reg, dest_reg_offset))

# BOXED + UNBOXED
def gen_asm_for_new_boxed_type(cur_asm_list, type_name, dest_reg):
	constructor_method = type_name + "..new"

	cur_asm_list.append(ASMComment("push caller-saved regs"))
	for reg in caller_saved_registers:
		cur_asm_list.append(ASMPushQ(reg))
	cur_asm_list.append(ASMComment("push self ptr"))
	cur_asm_list.append(ASMPushQ(SELF_REG))

	cur_asm_list.append(ASMCall(constructor_method))

	cur_asm_list.append(ASMComment("restore self ptr"))
	cur_asm_list.append(ASMPopQ(SELF_REG))
	cur_asm_list.append(ASMComment("pop caller-saved regs"))
	for reg in reversed(caller_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

	cur_asm_list.append(ASMMovQ("%rax", dest_reg))

# BOXED + UNBOXED
def gen_asm_for_tac_unbox(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_unbox):
	op1_reg = get_asm_register(register_color_map, tac_unbox.op1, 64)
	dest = get_asm_register(register_color_map, tac_unbox.assignee, 64)

	cur_asm_list.append(ASMComment("unbox value of " + op1_reg + " into " + dest))
	op1_reg_offset = "24(" + op1_reg + ")"
	cur_asm_list.append(ASMMovQ(op1_reg_offset, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_load_attr(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_load_attr):
	global attr_offset_map

	# Handle self explicitly
	# Note: Up to this point self was treated as an attribute
	if tac_load_attr.ident == "self":
		dest = get_asm_register(register_color_map, tac_load_attr.assignee, 64)
		cur_asm_list.append(ASMComment("move self ptr into " + dest))
		cur_asm_list.append(ASMMovQ(SELF_REG, dest))

	else:
		# Get the offset from the self ptr
		tup = (current_type, tac_load_attr.ident)
		attr_idx = attr_offset_map[tup]
		self_offset = 8 * attr_idx

		# Move the contents of the attr into assignee
		src = str(self_offset)+"("+SELF_REG+")"
		dest = get_asm_register(register_color_map, tac_load_attr.assignee, 64)
		cur_asm_list.append(ASMComment("load self[" + str(attr_idx) + "] (" + \
			tac_load_attr.ident + ") into " + dest))
		cur_asm_list.append(ASMMovQ(src, dest))

def gen_asm_for_tac_store_attr(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_store_attr):
	global attr_offset_map

	# Get the offset from the self ptr
	tup = (current_type, tac_store_attr.ident)
	attr_idx = attr_offset_map[tup]
	self_offset = 8 * attr_idx

	# Move the value into the attr
	src = get_asm_register(register_color_map, tac_store_attr.op1, 64)
	dest = str(self_offset)+"("+SELF_REG+")"
	cur_asm_list.append(ASMComment("store " + src + " in self[" + str(attr_idx) + \
		"] (" + tac_store_attr.ident + ")"))
	cur_asm_list.append(ASMMovQ(src, dest))

def gen_asm_for_tac_alloc_type(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	# Allocate space for the object based on the size via calloc(obj_size {rdi}, 8 {rsi})
	type_size = "$" + str(tac_instr.obj_size)
	type_name = tac_instr.type_name
	cur_asm_list.append(ASMComment("allocate space for " + type_name + " (size: " + str(tac_instr.obj_size) + ")"))
	cur_asm_list.append(ASMMovQ("$8", "%rsi"))
	cur_asm_list.append(ASMMovQ(type_size, "%rdi"))
	cur_asm_list.append(ASMCall("calloc"))

	# Move the pointer to the object into SELF_REG
	cur_asm_list.append(ASMMovQ("%rax", SELF_REG))

	# Store type_tag, obj_size, vtable ptr
	type_tag = "$" + str(tac_instr.type_tag)
	vtable_str = "$" + tac_instr.type_name + "..vtable"

	cur_asm_list.append(ASMComment("store type_tag, obj_size, vtable in " + SELF_REG))
	cur_asm_list.append(ASMMovQ(type_tag, "%rax"))
	cur_asm_list.append(ASMMovQ("%rax", "0("+SELF_REG+")"))
	cur_asm_list.append(ASMMovQ(type_size, "%rax"))
	cur_asm_list.append(ASMMovQ("%rax", "8("+SELF_REG+")"))
	cur_asm_list.append(ASMMovQ(vtable_str, "%rax"))
	cur_asm_list.append(ASMMovQ("%rax", "16("+SELF_REG+")"))

def gen_asm_for_tac_call(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_call):
	# Note: This function assumes that all params and the receiver object
	# 	have already been evaluated and stored (done via TAC instructions)
	global vtable_offset_map

	# Push all caller-saved regs
	num_regs_saved = 0
	for reg in caller_saved_registers:
		num_regs_saved += 1
		cur_asm_list.append(ASMPushQ(reg))

	# Store self ptr and INC NUM_REGS_SAVED (very important)
	cur_asm_list.append(ASMComment("save self ptr (" + SELF_REG + ")"))
	cur_asm_list.append(ASMPushQ(SELF_REG))
	num_regs_saved += 1

	# Move all params from location on stack to new stack location
	# Note: Take into account offset from above caller-saved regs
	num_params = len(tac_call.params_list)
	cur_asm_list.append(ASMComment("pushing " + str(num_params) + " params to the stack"))
	
	# Allocate space for all the params
	space_required = "$" + str(8 * num_params)
	cur_asm_list.append(ASMSubQ(space_required, "%rsp"))
	
	original_value_stack_offset = 2 * num_params + num_regs_saved - 1

	for i in range(num_params):
		# Get the original value offset on the stack
		value_offset = 8 * (original_value_stack_offset - i)
		rsp_value_offset= str(value_offset) + "(%rsp)"

		# Get destination offset on stack
		param_offset = 8 * i
		rsp_param_offset = str(param_offset) + "(%rsp)"

		# Move the saved param value to the spot on the stack
		cur_asm_list.append(ASMComment("moving rsp[" + str(value_offset) + "] to rsp[" + str(param_offset) + "]"))
		cur_asm_list.append(ASMMovQ(rsp_value_offset, "%rax"))
		cur_asm_list.append(ASMMovQ("%rax", rsp_param_offset))

	# Set receiver object as self pointer (unless self dispatch)
	if hasattr(tac_call, "receiver_obj"):
		ro_reg = get_asm_register(register_color_map, tac_call.receiver_obj, 64)
		cur_asm_list.append(ASMComment("set receiver_obj (" + ro_reg + ") as self ptr (" + SELF_REG + ")"))
		cur_asm_list.append(ASMMovQ(ro_reg, SELF_REG))

	# Get method pointer based on type of call
	if isinstance(tac_call, TACStaticCall):
		cur_asm_list.append(ASMComment("static: lookup method in <static_type>..vtable"))

		tup = (tac_call.static_type, tac_call.method_ident)
		method_idx = vtable_offset_map[tup]

		# Get pointer to vtable explicitly with static type
		vtable_label = "$" + tac_call.static_type + "..vtable"
		cur_asm_list.append(ASMComment("get ptr to vtable from static type"))
		cur_asm_list.append(ASMMovQ(vtable_label, "%rax"))

		# Get pointer to method label from offset in vtable
		cur_asm_list.append(ASMComment("find method " + tac_call.method_ident + "in vtable[" + str(method_idx) + "]"))
		vtable_offset = method_idx * 8
		method_ptr = str(vtable_offset) + "(%rax)"
		cur_asm_list.append(ASMMovQ(method_ptr, "%rax"))

		# Call method
		cur_asm_list.append(ASMComment("call method"))
		cur_asm_list.append(ASMCall("*%rax"))

	elif isinstance(tac_call, TACDynamicCall):
		# Find method label via vtable
		# Handle SELF_TYPE explicitly
		receiver_obj_type = tac_call.ro_cur_exp_type
		if receiver_obj_type == "SELF_TYPE":
			receiver_obj_type = current_type

		tup = (receiver_obj_type, tac_call.method_ident)
		method_idx = vtable_offset_map[tup]

		cur_asm_list.append(ASMComment("dynamic: lookup method in vtable"))

		# Get pointer to vtable (offset of 16 from receiver object)
		cur_asm_list.append(ASMComment("get ptr to vtable from receiver obj"))
		vtable_ptr = "16(" + ro_reg + ")"
		cur_asm_list.append(ASMMovQ(vtable_ptr, "%rax"))

		# Get pointer to method label from offset in vtable
		cur_asm_list.append(ASMComment("find method " + tac_call.method_ident + " in vtable[" + str(method_idx) + "]"))
		vtable_offset = method_idx * 8
		method_ptr = str(vtable_offset) + "(%rax)"
		cur_asm_list.append(ASMMovQ(method_ptr, "%rax"))

		# Call method dynamically
		cur_asm_list.append(ASMComment("call method dynamically"))
		cur_asm_list.append(ASMCall("*%rax"))

		# raise NotImplementedError("Dynamic not yet impl")
	elif isinstance(tac_call, TACSelfCall):
		# Find method label via vtable (very similar to dynamic, but with SELF_REG)
		tup = (current_type, tac_call.method_ident)

		method_idx = vtable_offset_map[tup]

		cur_asm_list.append(ASMComment("self: lookup method in vtable"))

		# Get pointer to vtable (offset of 16 from self)
		cur_asm_list.append(ASMComment("get ptr to vtable from self"))
		vtable_ptr = "16(" + SELF_REG + ")"
		cur_asm_list.append(ASMMovQ(vtable_ptr, "%rax"))

		# Get pointer to method label from offset in vtable
		cur_asm_list.append(ASMComment("find method " + tac_call.method_ident + " in vtable[" + str(method_idx) + "]"))
		vtable_offset = method_idx * 8
		method_ptr = str(vtable_offset) + "(%rax)"
		cur_asm_list.append(ASMMovQ(method_ptr, "%rax"))

		# Call method dynamically
		cur_asm_list.append(ASMComment("call method dynamically"))
		cur_asm_list.append(ASMCall("*%rax"))		

	else:
		raise NotImplementedError("No dispatch for " + tac_call.__class__.__name__)

	# Subtract offset from stack to remove params
	cur_asm_list.append(ASMComment("removing " + str(num_params) + " params from stack with subq"))
	offset = 8 * num_params
	offset_str = "$" + str(offset)
	cur_asm_list.append(ASMAddQ(offset_str, "%rsp"))

	# Store self ptr
	cur_asm_list.append(ASMComment("restore self ptr (" + SELF_REG + ")"))
	cur_asm_list.append(ASMPopQ(SELF_REG))

	# Pop all caller-saved regs
	for reg in reversed(caller_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

	# Subtract offset from stack to remove stored params
	cur_asm_list.append(ASMComment("removing " + str(num_params) + " stored params from stack (2nd time)"))
	cur_asm_list.append(ASMAddQ(offset_str, "%rsp"))

	# Move result into dest
	dest = get_asm_register(register_color_map, tac_call.assignee, 64)
	cur_asm_list.append(ASMComment("storing method result in " + dest))
	cur_asm_list.append(ASMMovQ("%rax", dest))

def gen_asm_for_tac_store_param(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_store_param):
	op1_reg = get_asm_register(register_color_map, tac_store_param.op1, 64)
	cur_asm_list.append(ASMComment("storing param [" + str(tac_store_param.param_idx) + "]"))
	cur_asm_list.append(ASMPushQ(op1_reg))

def gen_asm_for_tac_load_param(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_load_param):
	dest = get_asm_register(register_color_map, tac_load_param.assignee, 64)

	# Calculate the offset from rbp, taking into account ret addr and saved rbp (+2)
	offset = 8 * (tac_load_param.param_idx + 2)
	rbp_offset = str(offset) + "(%rbp)"

	cur_asm_list.append(ASMComment("loading param [" + str(tac_load_param.param_idx) + "] into " + dest))
	cur_asm_list.append(ASMMovQ(rbp_offset, dest))

def gen_asm_for_tac_is_void(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	op1_reg = get_asm_register(register_color_map, tac_instr.op1, 64)
	dest = get_asm_register(register_color_map, tac_instr.assignee, 64)
	false_label = next_asm_label()

	# Make a new Bool to hold the result
	# gen_asm_for_new_boxed_type(cur_asm_list, "Bool", dest)

	# Compare op1_reg to $0 to see if it is void
	cur_asm_list.append(ASMComment("check if " + op1_reg + " is void and set result accordingly"))
	cur_asm_list.append(ASMMovQ("$0", dest))
	cur_asm_list.append(ASMCmpQ("$0", op1_reg))
	cur_asm_list.append(ASMJmpNz(false_label))
	# dest_reg_offset = "24(" + dest + ")"
	# cur_asm_list.append(ASMMovQ("$1", dest_reg_offset))
	cur_asm_list.append(ASMMovQ("$1", dest))
	cur_asm_list.append(ASMLabel(false_label))

def gen_asm_for_tac_error(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	# Call helper function to generate asm
	gen_asm_for_error(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr.line, tac_instr.error_msg)

def gen_asm_for_error(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, line, error_msg):
	# Create a string of the form:
	# ERROR: 3: Exception: case without matching branch: String()
	error_string = "ERROR: " + str(line) + ": Exception: "
	error_string += error_msg

	# Get the string label for the error (and add to global string map)
	error_string_label = get_const_string_label(error_string)

	# Move the string into rdi and call raw_out_string
	cur_asm_list.append(ASMMovQ("$" + error_string_label, "%rdi"))
	cur_asm_list.append(ASMCall("raw_out_string"))

	# Exit the program
	cur_asm_list.append(ASMMovQ("$0", "%rax"))
	cur_asm_list.append(ASMCall("exit"))

def gen_asm_for_tac_case_type_cmp(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	op1_reg = get_asm_register(register_color_map, tac_instr.op1, 64)
	# Get type tag from map
	type_tag_num = "$" + str(type_tag_map[tac_instr.type_name])

	cur_asm_list.append(ASMComment("check for type " + tac_instr.type_name))
	cur_asm_list.append(ASMMovQ(type_tag_num, "%rax"))
	cur_asm_list.append(ASMCmpQ("%rax", op1_reg))
	cur_asm_list.append(ASMJmpEq("." + tac_instr.type_case_label))

def gen_asm_for_tac_get_type_tag(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	op1_reg = get_asm_register(register_color_map, tac_instr.op1, 64)
	dest = get_asm_register(register_color_map, tac_instr.assignee, 64)

	op1_reg_offset = "0(" + op1_reg + ")"
	cur_asm_list.append(ASMComment("move type tag of " + op1_reg + " into " + dest))
	cur_asm_list.append(ASMMovQ(op1_reg_offset, dest))

def gen_asm_for_tac_instr(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr):
	# Skip instructions whose assignees do not have colors
	# This will only skip instructions that are never live (dead code)
	if not isinstance(tac_instr, TACIOCall) and hasattr(tac_instr, "assignee"):
		if not tac_instr.assignee in register_color_map:
			return

	# Check each type of TAC instruction and handle accordingly
	if isinstance(tac_instr, TACConstInt):
		gen_asm_for_tac_const_int(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACConstBool):
		gen_asm_for_tac_const_bool(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACConstString):
		gen_asm_for_tac_const_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACLabel):
		gen_asm_for_tac_label(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACDefault):
		gen_asm_for_tac_default(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACNegBool):
		gen_asm_for_tac_not(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACNegArith):
		gen_asm_for_tac_negate(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACAssign):
		gen_asm_for_tac_assign(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACReturn):
		gen_asm_for_tac_return(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACJmp):
		gen_asm_for_tac_jmp(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACBt):
		gen_asm_for_tac_bt(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACStore):
		gen_asm_for_tac_store(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACLoad):
		gen_asm_for_tac_load(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACPlus):
		gen_asm_for_tac_plus(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACMinus):
		gen_asm_for_tac_minus(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACMult):
		gen_asm_for_tac_mult(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACDiv):
		gen_asm_for_tac_div(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompL):
		gen_asm_for_tac_comp_l(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompLString):
		gen_asm_for_tac_comp_l_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompLInt) or isinstance(tac_instr, TACCompLBool):
		gen_asm_for_tac_comp_l_unboxed(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompLE):
		gen_asm_for_tac_comp_le(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompLEString):
		gen_asm_for_tac_comp_le_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompLEBool) or isinstance(tac_instr, TACCompLEInt):
		gen_asm_for_tac_comp_le_unboxed(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompE):
		gen_asm_for_tac_comp_e(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompEString):
		gen_asm_for_tac_comp_e_string(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCompEBool) or isinstance(tac_instr, TACCompEInt):
		gen_asm_for_tac_comp_e_unboxed(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACBox):
		gen_asm_for_tac_box(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACUnbox):
		gen_asm_for_tac_unbox(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACNew):
		gen_asm_for_tac_new(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACLoadAttr):
		gen_asm_for_tac_load_attr(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACStoreAttr):
		gen_asm_for_tac_store_attr(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACIsVoid):
		gen_asm_for_tac_is_void(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACNewSelfType):
		gen_asm_for_tac_new_self_type(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACCaseCmpTypesAndJe):
		gen_asm_for_tac_case_type_cmp(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACGetTypeTag):
		gen_asm_for_tac_get_type_tag(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACError):
		gen_asm_for_tac_error(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACAllocType):
		gen_asm_for_tac_alloc_type(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	# ========================================
	# 				DISPATCH
	# ========================================
	elif isinstance(tac_instr, TACCall):
		gen_asm_for_tac_call(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	# elif isinstance(tac_instr, TACMakeParamSpace):
	# 	gen_asm_for_tac_make_param_space(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	# elif isinstance(tac_instr, TACRemoveParamSpace):
	# 	gen_asm_for_tac_remove_param_space(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACStoreParam):
		gen_asm_for_tac_store_param(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	elif isinstance(tac_instr, TACLoadParam):
		gen_asm_for_tac_load_param(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	# elif isinstance(tac_instr, TACCall):
	# 	gen_asm_for_tac_call(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	else:
		raise NotImplementedError(str(tac_instr.__class__.__name__) + " not yet implemented")

def add_initial_method_setup(stack_offset):
	cur_asm_list.insert(1, ASMPushQ("%rbp"))
	cur_asm_list.insert(2, ASMMovQ("%rsp", "%rbp"))

	src = "$" + str(stack_offset)
	dest = "%rsp"
	cur_asm_list.insert(3, ASMSubQ(src, dest))

def gen_asm_for_block_list(cur_asm_list, block_list, register_color_map, spilled_registers, current_type):
	# For now, assume everything has an offset of 8 bytes on the stack
	spilled_reg_loc_map = {}
	stack_offset = 0
	for idx, register in enumerate(spilled_registers):
		spilled_reg_loc_map[register] = (idx+1) * -8
		stack_offset += 8

	# Allocate space on stack for spilled regs
	stack_offset_str = "$" + str(stack_offset)
	cur_asm_list.append(ASMComment("allocate space to store " + str(len(spilled_registers)) + " spilled regs"))
	cur_asm_list.append(ASMSubQ(stack_offset_str, "%rsp"))

	# Push all callee-saved registers
	cur_asm_list.append(ASMComment("push callee-saved regs"))
	for reg in callee_saved_registers:
		cur_asm_list.append(ASMPushQ(reg))

	# Generate the asm instructions for each tac instr
	for block in block_list:
		for tac_instr in block.instr_list:
			gen_asm_for_tac_instr(current_type, register_color_map, spilled_reg_loc_map, cur_asm_list, tac_instr)

	# Pop all callee-saved registers
	cur_asm_list.append(ASMComment("pop callee-saved regs"))
	for reg in reversed(callee_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

	# Restore stack ptr
	cur_asm_list.append(ASMComment("remove temporary stack space for " + str(len(spilled_registers)) + " spilled regs"))
	cur_asm_list.append(ASMAddQ(stack_offset_str, "%rsp"))

	# Add initial setup to the asm instr list
	# add_initial_method_setup(stack_offset)

# ========================================
#  INTERNAL FUNCTIONS
# ========================================
def gen_asm_for_internal_method(cur_asm_list, internal_name):
	if internal_name == "String.length":
		gen_asm_for_internal_length(cur_asm_list)

	elif internal_name == "String.concat":
		gen_asm_for_internal_str_concat(cur_asm_list)

	elif internal_name == "String.substr":
		gen_asm_for_internal_str_substr(cur_asm_list)

	elif internal_name == "IO.in_int":
		gen_asm_for_internal_in_int(cur_asm_list)

	elif internal_name == "IO.out_int":
		gen_asm_for_internal_out_int(cur_asm_list)

	elif internal_name == "IO.out_string":
		gen_asm_for_internal_out_string(cur_asm_list)

	elif internal_name == "IO.in_string":
		gen_asm_for_internal_in_string(cur_asm_list)

	elif internal_name == "Object.copy":
		gen_asm_for_internal_copy(cur_asm_list)

	elif internal_name == "Object.abort":
		gen_asm_for_internal_abort(cur_asm_list)

	elif internal_name == "Object.type_name":
		gen_asm_for_internal_type_name(cur_asm_list)

	else:
		# raise NotImplementedError(internal_name + " has not been implemented")
		pass

def gen_asm_for_internal_str_concat(cur_asm_list):
	# Unbox values into rdi and rsi
	cur_asm_list.append(ASMComment("unbox self into rdi"))
	cur_asm_list.append(ASMMovQ("24(%rbx)", "%rdi"))
	cur_asm_list.append(ASMComment("unbox param[0] into rsi"))
	cur_asm_list.append(ASMMovQ("16(%rbp)", "%rsi"))
	# cur_asm_list.append(ASMMovQ("24(%rax)", "%rsi"))

	# Call string concat helper
	cur_asm_list.append(ASMCall("cool_str_concat"))

	# Box result in a new String
	# cur_asm_list.append(ASMComment("make new box in rax to store result (moved into r8 temporarily)"))
	# cur_asm_list.append(ASMMovQ("%rax", "%r8"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "String", "%rax")
	# cur_asm_list.append(ASMMovQ("%r8", "24(%rax)"))

def gen_asm_for_internal_str_substr(cur_asm_list):
	# Move values into rdi, rsi, and rdx
	cur_asm_list.append(ASMComment("unbox self into rdi"))
	cur_asm_list.append(ASMMovQ("24(%rbx)", "%rdi"))
	cur_asm_list.append(ASMComment("move param[0] into rsi"))
	cur_asm_list.append(ASMMovQ("16(%rbp)", "%rsi"))
	# cur_asm_list.append(ASMMovQ("24(%rax)", "%rsi"))
	cur_asm_list.append(ASMComment("move param[1] into rdx"))
	cur_asm_list.append(ASMMovQ("24(%rbp)", "%rdx"))
	# cur_asm_list.append(ASMMovQ("24(%rax)", "%rdx"))

	# Call string substr helper
	cur_asm_list.append(ASMCall("cool_str_substr"))

	# Box result in a new String
	# cur_asm_list.append(ASMComment("make new box to store result (moved into r8 temporarily)"))
	# cur_asm_list.append(ASMMovQ("%rax", "%r8"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "String", "%rax")
	# cur_asm_list.append(ASMMovQ("%r8", "24(%rax)"))

def gen_asm_for_internal_type_name(cur_asm_list):
	# Make new String to hold result
	# cur_asm_list.append(ASMComment("make new String to hold the result"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "String", "%rax")

	# Move the value of type_name from vtable into the new String
	cur_asm_list.append(ASMComment("move type_name from vtable[0] into %rax"))
	cur_asm_list.append(ASMMovQ("16("+SELF_REG+")", "%rax"))
	cur_asm_list.append(ASMMovQ("0(%rax)", "%rax"))
	# cur_asm_list.append(ASMMovQ("%r8", "24(%rax)"))

def gen_asm_for_internal_abort(cur_asm_list):
	custom_asm = ASMCustomString(
		"\t\t\tmovq $abort.string, %rdi\n" +
		"\t\t\tcall raw_out_string\n" +
		"\t\t\tmovq $0, %rdi\n" +
		"\t\t\tcall exit\n"
		)
	cur_asm_list.append(custom_asm)

def gen_asm_for_internal_copy(cur_asm_list):
	# Check the type tag of the object
	cur_asm_list.append(ASMComment("check type tag"))
	cur_asm_list.append(ASMMovQ("(%rbx)", "%rax"))
	int_type_tag = "$" + str(type_tag_map["Int"])
	cur_asm_list.append(ASMCmpQ(int_type_tag, "%rax"))
	cur_asm_list.append(ASMJmpEq("copy_unboxed"))
	string_type_tag = "$" + str(type_tag_map["String"])
	cur_asm_list.append(ASMCmpQ(string_type_tag, "%rax"))
	cur_asm_list.append(ASMJmpEq("copy_unboxed"))
	bool_type_tag = "$" + str(type_tag_map["Bool"])
	cur_asm_list.append(ASMCmpQ(bool_type_tag, "%rax"))
	cur_asm_list.append(ASMJmpEq("copy_unboxed"))

	# COPY OBJECTS
	# Alloc space for the new object
	cur_asm_list.append(ASMLabel("copy_object"))
	cur_asm_list.append(ASMComment("call malloc to make space for the new object"))
	cur_asm_list.append(ASMComment("use leaq to multiply the size by 8"))
	cur_asm_list.append(ASMMovQ("8(%rbx)", "%rdi"))
	cur_asm_list.append(ASMLeaQ("0(,%rdi,8)", "%rdi"))
	cur_asm_list.append(ASMCall("malloc"))

	# Setup and call memcpy
	cur_asm_list.append(ASMComment("call memcpy to copy %rbx into %rax"))
	cur_asm_list.append(ASMComment("use leaq to multiply the size by 8"))
	cur_asm_list.append(ASMMovQ("8(%rbx)", "%rdx"))
	cur_asm_list.append(ASMLeaQ("0(,%rdx,8)", "%rdx"))
	cur_asm_list.append(ASMMovQ("%rbx", "%rsi"))
	cur_asm_list.append(ASMMovQ("%rax", "%rdi"))
	cur_asm_list.append(ASMCall("memcpy"))
	cur_asm_list.append(ASMComment("result of mempy in %rax, so good to return"))
	cur_asm_list.append(ASMJmp("copy_exit"))

	# COPY UNBOXED VALUE
	cur_asm_list.append(ASMLabel("copy_unboxed"))
	cur_asm_list.append(ASMMovQ("24(%rbx)", "%rax"))
	cur_asm_list.append(ASMJmp("copy_exit"))

	# Include label for copy exit
	cur_asm_list.append(ASMLabel("copy_exit"))

def gen_asm_for_internal_in_string(cur_asm_list):
	# Call in_string helper
	cur_asm_list.append(ASMComment("call in_string helper method"))
	cur_asm_list.append(ASMCall("raw_in_string"))

	# Box result in a new String
	# cur_asm_list.append(ASMComment("make new box to store result (moved into r8 temporarily)"))
	# cur_asm_list.append(ASMMovQ("%rax", "%r8"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "String", "%rax")
	# cur_asm_list.append(ASMMovQ("%r8", "24(%rax)"))

def gen_asm_for_internal_out_string(cur_asm_list):
	# Unbox string to get raw value
	# Note: string value must be in specific reg (%r8) for raw assembly to work
	cur_asm_list.append(ASMComment("loading param [0] into %rax"))
	cur_asm_list.append(ASMMovQ("16(%rbp)", "%rdi"))
	# cur_asm_list.append(ASMComment("unboxing param [0] (in %rax) into %rdi for call to raw_out_string"))
	# cur_asm_list.append(ASMMovQ("24(%rax)", "%rdi"))
	cur_asm_list.append(ASMCall("raw_out_string"))

	# Move self ptr into %rax for return value
	cur_asm_list.append(ASMComment("move self ptr into %rax for return"))
	cur_asm_list.append(ASMMovQ(SELF_REG, "%rax"))

def gen_asm_for_internal_out_int(cur_asm_list):
	# No need to save caller-saved regs because done before calling out_int
	cur_asm_list.append(ASMComment("loading param [0] into %rax"))
	cur_asm_list.append(ASMMovQ("16(%rbp)", "%rax"))

	# Setup and call printf
	cur_asm_list.append(ASMComment("setup and call printf"))
	# cur_asm_list.append(ASMMovL("24(%rax)", "%esi"))
	cur_asm_list.append(ASMMovL("%eax", "%esi"))
	cur_asm_list.append(ASMMovQ("$out_int_format_str", "%rdi"))
	cur_asm_list.append(ASMMovL("$0", "%eax"))
	cur_asm_list.append(ASMCall("printf"))

	# Set return type to self ptr
	cur_asm_list.append(ASMComment("set self ptr as return type"))
	cur_asm_list.append(ASMMovQ(SELF_REG, "%rax"))

def gen_asm_for_internal_in_int(cur_asm_list):
	cur_asm_list.append(ASMComment("use generated function to read int"))
	custom_asm = ASMCustomString(
		# "\t\t\tpushq\t%rbp\n" +
		# "\t\t\tmovq\t%rsp, %rbp\n" +
		"\t\t\tsubq\t$32, %rsp\n" +
		"\t\t\tmovl\t$32, -24(%rbp)\n" +
		"\t\t\tmovl\t$0, -20(%rbp)\n" +
		"\t\t\tmovl\t-24(%rbp), %eax\n" +
		"\t\t\tcltq\n" +
		"\t\t\tmovq\t%rax, %rdi\n" +
		"\t\t\tcall\tmalloc\n" +
		"\t\t\tmovq\t%rax, -8(%rbp)\n" +
		".in_int_5:\n" +
		"\t\t\tcall\tgetchar\n" +
		"\t\t\tmovb\t%al, -25(%rbp)\n" +
		"\t\t\tcmpb\t$10, -25(%rbp)\n" +
		"\t\t\tje\t.in_int_2\n" +
		"\t\t\tcmpb\t$-1, -25(%rbp)\n" +
		"\t\t\tje\t.in_int_2\n" +
		"\t\t\tmovl\t-20(%rbp), %eax\n" +
		"\t\t\tmovslq\t%eax, %rdx\n" +
		"\t\t\tmovq\t-8(%rbp), %rax\n" +
		"\t\t\taddq\t%rax, %rdx\n" +
		"\t\t\tmovzbl\t-25(%rbp), %eax\n" +
		"\t\t\tmovb\t%al, (%rdx)\n" +
		"\t\t\taddl\t$1, -20(%rbp)\n" +
		"\t\t\tcmpb\t$0, -25(%rbp)\n" +
		"\t\t\tjne\t.in_int_3\n" +
		"\t\t\tmovl\t$0, -20(%rbp)\n" +
		"\t\t\tjmp\t.in_int_2\n" +
		".in_int_3:\n" +
		"\t\t\tmovl\t-20(%rbp), %eax\n" +
		"\t\t\tcmpl\t-24(%rbp), %eax\n" +
		"\t\t\tjne\t.in_int_4\n" +
		"\t\t\taddl\t$20, -24(%rbp)\n" +
		"\t\t\tmovl\t-24(%rbp), %eax\n" +
		"\t\t\tmovslq\t%eax, %rdx\n" +
		"\t\t\tmovq\t-8(%rbp), %rax\n" +
		"\t\t\tmovq\t%rdx, %rsi\n" +
		"\t\t\tmovq\t%rax, %rdi\n" +
		"\t\t\tcall\trealloc\n" +
		"\t\t\tmovq\t%rax, -8(%rbp)\n" +
		"\t\t\tjmp\t.in_int_5\n" +
		".in_int_4:\n" +
		"\t\t\tjmp\t.in_int_5\n" +
		".in_int_2:\n" +
		"\t\t\tmovq\t-8(%rbp), %rax\n" +
		"\t\t\tmovq\t%rax, %rdi\n" +
		"\t\t\tcall\tatol\n" +
		"\t\t\tmovq\t%rax, -16(%rbp)\n" +
		"\t\t\tcmpq\t$2147483647, -16(%rbp)\n" +
		"\t\t\tjle\t.in_int_6\n" +
		"\t\t\tmovq\t$0, -16(%rbp)\n" +
		"\t\t\tjmp\t.in_int_7\n" +
		".in_int_6:\n" +
		"\t\t\tcmpq\t$-2147483648, -16(%rbp)\n" +
		"\t\t\tjge\t.in_int_7\n" +
		"\t\t\tmovq\t$0, -16(%rbp)\n" +
		".in_int_7:\n" +
		"\t\t\tmovq\t-16(%rbp), %rax\n" + 			# this is now rax instead of r8
		"\n"
	)
	cur_asm_list.append(custom_asm)

	# gen_asm_for_new_boxed_type(cur_asm_list, "Int", "%rax")
	# cur_asm_list.append(ASMComment("move result into boxed Int"))
	# cur_asm_list.append(ASMMovQ("%r8", "24(%rax)"))

	
def gen_asm_for_internal_length(cur_asm_list):
	# Push all callee-saved regs
	for reg in callee_saved_registers:
		cur_asm_list.append(ASMPushQ(reg))

	# Call strlen and keep result in rax
	# Note: No need to save caller-saved regs since none are in use
	cur_asm_list.append(ASMComment("call strlen to compute length"))
	str_val_src = "24("+SELF_REG+")"
	cur_asm_list.append(ASMMovQ(str_val_src, "%rdi"))
	cur_asm_list.append(ASMCall("strlen"))
	# cur_asm_list.append(ASMMovQ("%rax", "%r8")) 

	# Make new Int box and put the result inside
	# Note: r9 is arbitrary here
	# cur_asm_list.append(ASMComment("box final result"))
	# gen_asm_for_new_boxed_type(cur_asm_list, "Int", "%r9")
	# cur_asm_list.append(ASMMovQ("%r8", "24(%r9)"))

	# Move final result into rax to return
	# cur_asm_list.append(ASMComment("move result into rax"))
	# cur_asm_list.append(ASMMovQ("%r9", "%rax"))

	cur_asm_list.append(ASMComment("result from strlen already in rax"))

	# Pop all callee-saved regs
	for reg in reversed(callee_saved_registers):
		cur_asm_list.append(ASMPopQ(reg))

def get_asm_internal_helpers_string():
	result = get_raw_out_string_helper()
	result += get_raw_in_string_helper()
	result += get_string_concat_helper()
	result += get_string_substr_helper()
	return result