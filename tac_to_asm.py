from tac_objects import *
from asm_objects import *
from shared_vars import *
import sys

# Initialize global vars
# asm_instr_list = []
register_color_map = {}
spilled_register_location_map = {}
asm_label_counter = 0
const_string_label_counter = 0
# Map constant strings to their label
const_string_label_map = {}
# Keep track of the current type
current_type = ""

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

def get_asm_register(tac_register, size=32):
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
def gen_asm_for_tac_const_int(tac_const_int):
	src = "$" + str(tac_const_int.val)
	dest = get_asm_register(tac_const_int.assignee, 64)
	dest_reg_offset = "24("+dest+")"

	# Create a new Int and put value into box
	asm_instr_list.append(ASMComment("new const Int: " + str(tac_const_int.val)))
	gen_asm_for_new_boxed_type("Int", dest)
	asm_instr_list.append(ASMMovL(src, dest_reg_offset))

# BOXED + UNBOXED
def gen_asm_for_tac_const_bool(tac_const_bool):
	if tac_const_bool.val == "true":
		src = "$1"
	else:
		src = "$0"

	dest = get_asm_register(tac_const_bool.assignee, 64)
	dest_reg_offset = "24("+dest+")"

	# Create new Bool and put value into box
	asm_instr_list.append(ASMComment("const Bool"))
	gen_asm_for_new_boxed_type("Bool", dest)
	asm_instr_list.append(ASMMovL(src, dest_reg_offset))

# BOXED + UNBOXED
def gen_asm_for_tac_const_string(tac_const_string):
	src = "$" + get_const_string_label(tac_const_string.val)
	dest = get_asm_register(tac_const_string.assignee, 64)
	dest_reg_offset = "24("+dest+")"

	# Create new String and put raw string ptr into box
	asm_instr_list.append(ASMComment("const String"))
	gen_asm_for_new_boxed_type("String", dest)
	asm_instr_list.append(ASMMovQ(src, dest_reg_offset))

# BOXED + UNBOXED
def gen_asm_for_tac_default(tac_default):
	# Set default value to $0
	src = "$0"
	if tac_default.type == "String":
		src = "$empty.string"
	dest = get_asm_register(tac_default.assignee, 64)

	asm_instr_list.append(ASMComment("default " + tac_default.type))
	if tac_default.type == "Int" or tac_default.type == "Bool" or \
			tac_default.type == "String":

		# Make a new box for the type and store the value
		dest_reg_offset = "24("+dest+")"
		gen_asm_for_new_boxed_type(tac_default.type, dest)
		asm_instr_list.append(ASMMovQ(src, dest_reg_offset))

	else:
		# Move null ptr into dest
		asm_instr_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_label(tac_label):
	asm_label = "." + tac_label.label

	asm_instr_list.append(ASMLabel(asm_label))

# BOXED + UNBOXED
def gen_asm_for_tac_not(tac_neg_bool):
	# Uses unboxed values, so have 32-bit registers
	src = get_asm_register(tac_neg_bool.op1)
	dest = get_asm_register(tac_neg_bool.assignee)

	asm_instr_list.append(ASMComment("not"))
	asm_instr_list.append(ASMMovL(src, dest))
	asm_instr_list.append(ASMXorL("$1", dest))

# BOXED + UNBOXED
def gen_asm_for_tac_negate(tac_neg_arith):
	# Uses unboxed values, so have 32-bit registers
	src = get_asm_register(tac_neg_arith.op1)
	dest = get_asm_register(tac_neg_arith.assignee)

	asm_instr_list.append(ASMComment("negate"))
	asm_instr_list.append(ASMMovL(src, dest))
	asm_instr_list.append(ASMNegL(dest))

# BOXED + UNBOXED
def gen_asm_for_tac_assign(tac_assign):
	src = get_asm_register(tac_assign.op1, 64)
	dest = get_asm_register(tac_assign.assignee, 64)

	asm_instr_list.append(ASMComment("assign"))
	asm_instr_list.append(ASMMovQ(src, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_new(tac_new):
	dest = get_asm_register(tac_new.assignee, 64)
	asm_instr_list.append(ASMComment("new " + tac_new.type))
	gen_asm_for_new_boxed_type(tac_new.type, dest)

# BOXED + UNBOXED
def gen_asm_for_tac_return(tac_return):
	src = get_asm_register(tac_return.op1, 64)
	dest = "%rax"

	asm_instr_list.append(ASMComment("return"))
	asm_instr_list.append(ASMMovQ(src, dest))
	asm_instr_list.append(ASMLeave())
	asm_instr_list.append(ASMRet())

# BOXED + UNBOXED
def gen_asm_for_tac_jmp(tac_jmp):
	label = "." + str(tac_jmp.label)

	asm_instr_list.append(ASMJmp(label))

def gen_asm_for_tac_bt(tac_bt):
	label = "." + str(tac_bt.label)
	reg = get_asm_register(tac_bt.op1)

	# asm_instr_list.append(ASMCmpL("$1", reg))
	# asm_instr_list.append(ASMJmpEq(label))

	asm_instr_list.append(ASMComment("branch " + label))
	asm_instr_list.append(ASMTestL(reg, reg))
	asm_instr_list.append(ASMJmpNz(label))
	# raise NotImplementedError("branch not yet implemented")

# ---- TODO Update for boxing + unboxing
def gen_asm_for_tac_store(tac_store):
	raise NotImplementedError("tac_store not yet implemented")
	# src = get_asm_register(tac_store.op1, 64)
	# offset = spilled_register_location_map[tac_store.op1]

	# dest = str(offset) + "(%rbp)"

	# asm_instr_list.append(ASMComment("store"))
	# asm_instr_list.append(ASMMovL(src, dest))

# ---- TODO Update for boxing + unboxing
def gen_asm_for_tac_load(tac_load):
	raise NotImplementedError("tac_load not yet implemented")
	# dest = get_asm_register(tac_load.assignee)

	# offset = spilled_register_location_map[tac_load.location]
	# src = str(offset) + "(%rbp)"

	# asm_instr_list.append(ASMComment("load"))
	# asm_instr_list.append(ASMMovL(src, dest))

def gen_asm_for_tac_out_int(tac_out_int):
	raise NotImplementedError("out_int not yet implemented")
	# asm_instr_list.append(ASMComment("begin out_int"))

	# # Save all caller saved registers
	# # TODO keep track of currently used registers and only save those
	# for asm_register in caller_saved_registers:
	# 	asm_instr_list.append(ASMPushQ(asm_register))

	# # Move the value to print into esi (param 2)
	# reg_to_print = get_asm_register(tac_out_int.op1)
	# asm_instr_list.append(ASMMovL(reg_to_print, "%esi"))

	# # Move format string into edi (param 1)
	# asm_instr_list.append(ASMMovL("$.int_fmt_string", "%edi"))

	# # Move 0 into eax (no vector params)
	# asm_instr_list.append(ASMMovL("$0", "%eax"))

	# # Call printf
	# asm_instr_list.append(ASMCall("printf"))

	# # Restore all caller saved registers
	# # TODO keep track of currently used registers and only save those
	# for asm_register in reversed(caller_saved_registers):
	# 	asm_instr_list.append(ASMPopQ(asm_register))

	# asm_instr_list.append(ASMComment("end out_int"))

def gen_asm_for_tac_in_int(tac_in_int):
	raise NotImplementedError("in_int() not yet implemented")
	# asm_instr_list.append(ASMComment("begin in_int"))

	# # Allocate temp space on stack
	# asm_instr_list.append(ASMSubQ("$4", "%rsp"))

	# # Save all caller saved registers
	# # TODO keep track of currently used registers and only save those
	# offset = 0
	# for asm_register in caller_saved_registers:
	# 	asm_instr_list.append(ASMPushQ(asm_register))
	# 	offset += 8

	# # Move address of temp space into esi (param 2)
	# temp_space_loc = str(offset) + "(%rsp)"
	# asm_instr_list.append(ASMLeaQ(temp_space_loc, "%rsi"))

	# # Move format string into edi (param 1)
	# asm_instr_list.append(ASMMovL("$.int_fmt_string", "%edi"))

	# # Move 0 into eax (no vector params)
	# asm_instr_list.append(ASMMovL("$0", "%eax"))

	# # Call scanf
	# asm_instr_list.append(ASMCall("__isoc99_scanf"))

	# # Restore all caller saved registers
	# # TODO keep track of currently used registers and only save those
	# for asm_register in reversed(caller_saved_registers):
	# 	asm_instr_list.append(ASMPopQ(asm_register))

	# # Move value from temp space to dest register
	# dest = get_asm_register(tac_in_int.assignee)
	# asm_instr_list.append(ASMMovL("(%rsp)", dest))

	# # Dealloc temp space on stack
	# asm_instr_list.append(ASMAddQ("$4", "%rsp"))

	# asm_instr_list.append(ASMComment("end in_int"))

# BOXED + UNBOXED
def gen_asm_for_tac_plus(tac_plus):
	# Uses unboxed values, so have 32-bit registers
	op1_reg = get_asm_register(tac_plus.op1, 32)
	op2_reg = get_asm_register(tac_plus.op2, 32)
	dest = get_asm_register(tac_plus.assignee, 32)

	asm_instr_list.append(ASMComment("plus"))
	
	if op2_reg == dest:
		asm_instr_list.append(ASMAddL(op1_reg, dest))
	else:
		asm_instr_list.append(ASMMovL(op1_reg, dest))
		asm_instr_list.append(ASMAddL(op2_reg, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_minus(tac_minus):
	# Uses unboxed values, so have 32-bit registers
	op1_reg = get_asm_register(tac_minus.op1, 32)
	op2_reg = get_asm_register(tac_minus.op2, 32)
	dest = get_asm_register(tac_minus.assignee, 32)

	asm_instr_list.append(ASMComment("minus"))

	if op2_reg == dest:
		asm_instr_list.append(ASMSubL(op1_reg, dest))
		asm_instr_list.append(ASMNegL(dest))
	else:
		asm_instr_list.append(ASMMovL(op1_reg, dest))
		asm_instr_list.append(ASMSubL(op2_reg, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_mult(tac_mult):
	# Uses unboxed values, so have 32-bit registers
	op1_reg = get_asm_register(tac_mult.op1, 32)
	op2_reg = get_asm_register(tac_mult.op2, 32)
	dest = get_asm_register(tac_mult.assignee, 32)

	asm_instr_list.append(ASMComment("mult"))

	if op2_reg == dest:
		asm_instr_list.append(ASMImulL(op1_reg, dest))
	else:
		asm_instr_list.append(ASMMovL(op1_reg, dest))
		asm_instr_list.append(ASMImulL(op2_reg, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_div(tac_div):
	# Uses unboxed values, so have 32-bit registers
	#rX = rY / rZ
	op1_reg = get_asm_register(tac_div.op1, 32)
	op2_reg = get_asm_register(tac_div.op2, 32)
	dest = get_asm_register(tac_div.assignee, 32)

	asm_instr_list.append(ASMComment("divide"))

	# Alloc temp stack space
	asm_instr_list.append(ASMSubQ("$8", "%rsp"))

	# Save registers
	asm_instr_list.append(ASMPushQ("%rdx"))
	asm_instr_list.append(ASMPushQ("%rax"))
	asm_instr_list.append(ASMPushQ("%rcx"))

	# Store rZ in temp space on stack
	asm_instr_list.append(ASMMovL(op2_reg, "24(%rsp)"))

	# Move rY into eax
	asm_instr_list.append(ASMMovL(op1_reg, "%eax"))

	# Zero extend eax to edx:eax
	asm_instr_list.append(ASMCltd())

	# Move rZ from stack to ecx
	asm_instr_list.append(ASMMovL("24(%rsp)", "%ecx"))

	# Divide rY by rZ
	asm_instr_list.append(ASMIdivL("%ecx"))

	# Store result in temp space on stack
	asm_instr_list.append(ASMMovL("%eax", "28(%rsp)"))

	# Restore registers
	asm_instr_list.append(ASMPopQ("%rcx"))
	asm_instr_list.append(ASMPopQ("%rax"))
	asm_instr_list.append(ASMPopQ("%rdx"))

	# Save result
	asm_instr_list.append(ASMMovL("4(%rsp)", dest))

	# Dealloc temp stack space
	asm_instr_list.append(ASMAddQ("$8", "%rsp"))

def gen_asm_for_tac_comp_l(tac_comp_l):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg = get_asm_register(tac_comp_l.op1, 64)
	op2_reg = get_asm_register(tac_comp_l.op2, 64)
	dest = get_asm_register(tac_comp_l.assignee, 64)

	asm_instr_list.append(ASMComment("use lt_helper to compare " + op1_reg + " < " + op2_reg))

	# Save all caller-saved regs
	for reg in caller_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))

	# Push lhs and rhs regs
	asm_instr_list.append(ASMComment("push lhs (" + op1_reg + ") and rhs (" + op2_reg + ")"))
	asm_instr_list.append(ASMPushQ(op2_reg))
	asm_instr_list.append(ASMPushQ(op1_reg))

	# Call lt_helper
	asm_instr_list.append(ASMCall("lt_helper"))

	# Add 16 to stack to remove pushed lhs and rhs
	asm_instr_list.append(ASMAddQ("$16", "%rsp"))

	# Restore all caller-saved regs
	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	# Move result into dest
	asm_instr_list.append(ASMComment("move comparison result into " + dest))
	asm_instr_list.append(ASMMovQ("%rax", dest))

def gen_asm_for_tac_comp_le(tac_comp_le):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg = get_asm_register(tac_comp_le.op1, 64)
	op2_reg = get_asm_register(tac_comp_le.op2, 64)
	dest = get_asm_register(tac_comp_le.assignee, 64)

	asm_instr_list.append(ASMComment("use le_helper to compare " + op1_reg + " <= " + op2_reg))

	# Save all caller-saved regs
	for reg in caller_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))

	# Push lhs and rhs regs
	asm_instr_list.append(ASMComment("push lhs (" + op1_reg + ") and rhs (" + op2_reg + ")"))
	asm_instr_list.append(ASMPushQ(op2_reg))
	asm_instr_list.append(ASMPushQ(op1_reg))

	# Call lt_helper
	asm_instr_list.append(ASMCall("le_helper"))

	# Add 16 to stack to remove pushed lhs and rhs
	asm_instr_list.append(ASMAddQ("$16", "%rsp"))

	# Restore all caller-saved regs
	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	# Move result into dest
	asm_instr_list.append(ASMComment("move comparison result into " + dest))
	asm_instr_list.append(ASMMovQ("%rax", dest))

def gen_asm_for_tac_comp_e(tac_comp_eq):
	# Get lhs_reg, rhs_reg, and dest
	op1_reg = get_asm_register(tac_comp_eq.op1, 64)
	op2_reg = get_asm_register(tac_comp_eq.op2, 64)
	dest = get_asm_register(tac_comp_eq.assignee, 64)

	asm_instr_list.append(ASMComment("use eq_helper to compare " + op1_reg + " = " + op2_reg))

	# Save all caller-saved regs
	for reg in caller_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))

	# Push lhs and rhs regs
	asm_instr_list.append(ASMComment("push lhs (" + op1_reg + ") and rhs (" + op2_reg + ")"))
	asm_instr_list.append(ASMPushQ(op2_reg))
	asm_instr_list.append(ASMPushQ(op1_reg))

	# Call lt_helper
	asm_instr_list.append(ASMCall("eq_helper"))

	# Add 16 to stack to remove pushed lhs and rhs
	asm_instr_list.append(ASMAddQ("$16", "%rsp"))

	# Restore all caller-saved regs
	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	# Move result into dest
	asm_instr_list.append(ASMComment("move comparison result into " + dest))
	asm_instr_list.append(ASMMovQ("%rax", dest))

# BOXED + UNBOXED
def gen_asm_for_tac_box(tac_box):
	global asm_instr_list
	op1_reg = get_asm_register(tac_box.op1, 64)
	dest = get_asm_register(tac_box.assignee, 64)

	constructor_method = tac_box.exp_type + "..new"
	dest_reg_offset = "24(" + dest + ")"

	asm_instr_list.append(ASMComment("box value of " + op1_reg + " into " + dest),)
	gen_asm_for_new_boxed_type(tac_box.exp_type, dest)
	asm_instr_list.append(ASMMovQ(op1_reg, dest_reg_offset))

# BOXED + UNBOXED
def gen_asm_for_new_boxed_type(type_name, dest_reg):
	global asm_instr_list
	constructor_method = type_name + "..new"

	asm_instr_list.append(ASMComment("push caller-saved regs"))
	for reg in caller_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))

	asm_instr_list.append(ASMCall(constructor_method))

	asm_instr_list.append(ASMComment("pop caller-saved regs"))
	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	asm_instr_list.append(ASMMovQ("%rax", dest_reg))

# BOXED + UNBOXED
def gen_asm_for_tac_unbox(tac_unbox):
	op1_reg = get_asm_register(tac_unbox.op1, 64)
	dest = get_asm_register(tac_unbox.assignee, 64)

	asm_instr_list.append(ASMComment("unbox value of " + op1_reg + " into " + dest))
	op1_reg_offset = "24(" + op1_reg + ")"
	asm_instr_list.append(ASMMovQ(op1_reg_offset, dest))

# BOXED + UNBOXED
def gen_asm_for_tac_load_attr(tac_load_attr):
	global attr_offset_map, current_type

	# Get the offset from the self ptr
	tup = (current_type, tac_load_attr.ident)
	attr_idx = attr_offset_map[tup]
	self_offset = 8 * attr_idx

	# Move the contents of the attr into assignee
	src = str(self_offset)+"("+SELF_REG+")"
	dest = get_asm_register(tac_load_attr.assignee, 64)
	asm_instr_list.append(ASMComment("load self[" + str(attr_idx) + "] (" + \
		tac_load_attr.ident + ") into " + dest))
	asm_instr_list.append(ASMMovQ(src, dest))

def gen_asm_for_tac_store_attr(tac_store_attr):
	global attr_offset_map, current_type

	# Get the offset from the self ptr
	tup = (current_type, tac_store_attr.ident)
	attr_idx = attr_offset_map[tup]
	self_offset = 8 * attr_idx

	# Move the value into the attr
	src = get_asm_register(tac_store_attr.op1, 64)
	dest = str(self_offset)+"("+SELF_REG+")"
	asm_instr_list.append(ASMComment("store " + src + " in self[" + str(attr_idx) + \
		"] (" + tac_store_attr.ident + ")"))
	asm_instr_list.append(ASMMovQ(src, dest))

def gen_asm_for_tac_call(tac_call):
	# Note: This function assumes that all params and the receiver object
	# 	have already been evaluated and stored (done via TAC instructions)
	global vtable_offset_map

	# Push all caller-saved regs
	num_regs_saved = 0
	for reg in caller_saved_registers:
		num_regs_saved += 1
		asm_instr_list.append(ASMPushQ(reg))

	# Store self ptr and INC NUM_REGS_SAVED (very important)
	asm_instr_list.append(ASMComment("save self ptr (" + SELF_REG + ")"))
	asm_instr_list.append(ASMPushQ(SELF_REG))
	num_regs_saved += 1

	# Move all params from location on stack to new stack location
	# Note: Take into account offset from above caller-saved regs
	num_params = len(tac_call.params_list)
	asm_instr_list.append(ASMComment("pushing " + str(num_params) + " params to the stack"))
	
	# Allocate space for all the params
	space_required = "$" + str(8 * num_params)
	asm_instr_list.append(ASMSubQ(space_required, "%rsp"))
	
	original_value_stack_offset = 2 * num_params + num_regs_saved - 1

	for i in range(num_params):
		# Get the original value offset on the stack
		value_offset = 8 * (original_value_stack_offset - i)
		rsp_value_offset= str(value_offset) + "(%rsp)"

		# Get destination offset on stack
		param_offset = 8 * i
		rsp_param_offset = str(param_offset) + "(%rsp)"

		# Move the saved param value to the spot on the stack
		asm_instr_list.append(ASMComment("moving rsp[" + str(value_offset) + "] to rsp[" + str(param_offset) + "]"))
		asm_instr_list.append(ASMMovQ(rsp_value_offset, "%rax"))
		asm_instr_list.append(ASMMovQ("%rax", rsp_param_offset))

	# Set receiver object as self pointer (unless self dispatch)
	if hasattr(tac_call, "receiver_obj"):
		ro_reg = get_asm_register(tac_call.receiver_obj, 64)
		asm_instr_list.append(ASMComment("set receiver_obj (" + ro_reg + ") as self ptr (" + SELF_REG + ")"))
		asm_instr_list.append(ASMMovQ(ro_reg, SELF_REG))

	# Get method pointer based on type of call
	if isinstance(tac_call, TACStaticCall):
		# Call method label explicitly
		asm_instr_list.append(ASMComment("static: call method label explicitly"))
		method_label = tac_call.static_type + "." + tac_call.method_ident
		asm_instr_list.append(ASMCall(method_label))
	elif isinstance(tac_call, TACDynamicCall):
		# Find method label via vtable
		# Handle SELF_TYPE explicitly
		receiver_obj_type = tac_call.ro_type_from_ast
		if receiver_obj_type == "SELF_TYPE":
			receiver_obj_type = current_type

		tup = (receiver_obj_type, tac_call.method_ident)
		method_idx = vtable_offset_map[tup]

		asm_instr_list.append(ASMComment("dynamic: lookup method in vtable"))

		# Get pointer to vtable (offset of 16 from receiver object)
		asm_instr_list.append(ASMComment("get ptr to vtable from receiver obj"))
		vtable_ptr = "16(" + ro_reg + ")"
		asm_instr_list.append(ASMMovQ(vtable_ptr, "%rax"))

		# Get pointer to method label from offset in vtable
		asm_instr_list.append(ASMComment("find method " + tac_call.method_ident + " in vtable[" + str(method_idx) + "]"))
		vtable_offset = method_idx * 8
		method_ptr = str(vtable_offset) + "(%rax)"
		asm_instr_list.append(ASMMovQ(method_ptr, "%rax"))

		# Call method dynamically
		asm_instr_list.append(ASMComment("call method dynamically"))
		asm_instr_list.append(ASMCall("*%rax"))

		# raise NotImplementedError("Dynamic not yet impl")
	elif isinstance(tac_call, TACSelfCall):
		# Find method label via vtable (very similar to dynamic, but with SELF_REG)
		tup = (current_type, tac_call.method_ident)

		method_idx = vtable_offset_map[tup]

		asm_instr_list.append(ASMComment("self: lookup method in vtable"))

		# Get pointer to vtable (offset of 16 from self)
		asm_instr_list.append(ASMComment("get ptr to vtable from self"))
		vtable_ptr = "16(" + SELF_REG + ")"
		asm_instr_list.append(ASMMovQ(vtable_ptr, "%rax"))

		# Get pointer to method label from offset in vtable
		asm_instr_list.append(ASMComment("find method " + tac_call.method_ident + " in vtable[" + str(method_idx) + "]"))
		vtable_offset = method_idx * 8
		method_ptr = str(vtable_offset) + "(%rax)"
		asm_instr_list.append(ASMMovQ(method_ptr, "%rax"))

		# Call method dynamically
		asm_instr_list.append(ASMComment("call method dynamically"))
		asm_instr_list.append(ASMCall("*%rax"))		

	else:
		raise NotImplementedError("No dispatch for " + tac_call.__class__.__name__)

	# Subtract offset from stack to remove params
	asm_instr_list.append(ASMComment("removing " + str(num_params) + " params from stack with subq"))
	offset = 8 * num_params
	offset_str = "$" + str(offset)
	asm_instr_list.append(ASMAddQ(offset_str, "%rsp"))

	# Store self ptr
	asm_instr_list.append(ASMComment("restore self ptr (" + SELF_REG + ")"))
	asm_instr_list.append(ASMPopQ(SELF_REG))

	# Pop all caller-saved regs
	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	# Subtract offset from stack to remove stored params
	asm_instr_list.append(ASMComment("removing " + str(num_params) + " stored params from stack (2nd time)"))
	asm_instr_list.append(ASMAddQ(offset_str, "%rsp"))

	# Move result into dest
	dest = get_asm_register(tac_call.assignee, 64)
	asm_instr_list.append(ASMComment("storing method result in " + dest))
	asm_instr_list.append(ASMMovQ("%rax", dest))

# def gen_asm_for_tac_make_param_space(tac_instr):
# 	rsp_offset = 8 * tac_instr.num_params
# 	rsp_offset = "$" + str(rsp_offset)

# 	asm_instr_list.append(ASMComment("making room for " + str(tac_instr.num_params) + " params"))
# 	asm_instr_list.append(ASMSubQ(rsp_offset, "%rsp"))

# def gen_asm_for_tac_remove_param_space(tac_instr):
# 	rsp_offset = 8 * tac_instr.num_params
# 	rsp_offset = "$" + str(rsp_offset)

# 	asm_instr_list.append(ASMComment("reset rsp after " + str(tac_instr.num_params) + " params"))
# 	asm_instr_list.append(ASMAddQ(rsp_offset, "%rsp"))

def gen_asm_for_tac_store_param(tac_store_param):
	op1_reg = get_asm_register(tac_store_param.op1, 64)
	asm_instr_list.append(ASMComment("storing param [" + str(tac_store_param.param_idx) + "]"))
	asm_instr_list.append(ASMPushQ(op1_reg))

def gen_asm_for_tac_load_param(tac_load_param):
	dest = get_asm_register(tac_load_param.assignee, 64)

	# Calculate the offset from rbp, taking into account ret addr and saved rbp (+2)
	offset = 8 * (tac_load_param.param_idx + 2)
	rbp_offset = str(offset) + "(%rbp)"

	asm_instr_list.append(ASMComment("loading param [" + str(tac_load_param.param_idx) + "] into " + dest))
	asm_instr_list.append(ASMMovQ(rbp_offset, dest))

def gen_asm_for_tac_is_void(tac_instr):
	op1_reg = get_asm_register(tac_instr.op1, 64)
	dest = get_asm_register(tac_instr.assignee, 64)
	false_label = next_asm_label()

	# Make a new Bool to hold the result
	gen_asm_for_new_boxed_type("Bool", dest)

	# Compare op1_reg to $0 to see if it is void
	asm_instr_list.append(ASMComment("check if " + op1_reg + " is void and set result accordingly"))
	asm_instr_list.append(ASMCmpQ("$0", op1_reg))
	asm_instr_list.append(ASMJmpNz(false_label))
	dest_reg_offset = "24(" + dest + ")"
	asm_instr_list.append(ASMMovQ("$1", dest_reg_offset))
	asm_instr_list.append(ASMLabel(false_label))

def gen_asm_for_tac_instr(tac_instr):
	# Skip instructions whose assignees do not have colors
	# This will only skip instructions that are never live (dead code)
	if not isinstance(tac_instr, TACIOCall) and hasattr(tac_instr, "assignee"):
		if not tac_instr.assignee in register_color_map:
			return

	# Check each type of TAC instruction and handle accordingly
	if isinstance(tac_instr, TACConstInt):
		gen_asm_for_tac_const_int(tac_instr)

	elif isinstance(tac_instr, TACConstBool):
		gen_asm_for_tac_const_bool(tac_instr)

	elif isinstance(tac_instr, TACConstString):
		gen_asm_for_tac_const_string(tac_instr)

	elif isinstance(tac_instr, TACLabel):
		gen_asm_for_tac_label(tac_instr)

	elif isinstance(tac_instr, TACDefault):
		gen_asm_for_tac_default(tac_instr)

	elif isinstance(tac_instr, TACNegBool):
		gen_asm_for_tac_not(tac_instr)

	elif isinstance(tac_instr, TACNegArith):
		gen_asm_for_tac_negate(tac_instr)

	elif isinstance(tac_instr, TACAssign):
		gen_asm_for_tac_assign(tac_instr)

	elif isinstance(tac_instr, TACReturn):
		gen_asm_for_tac_return(tac_instr)

	elif isinstance(tac_instr, TACJmp):
		gen_asm_for_tac_jmp(tac_instr)

	elif isinstance(tac_instr, TACBt):
		gen_asm_for_tac_bt(tac_instr)

	elif isinstance(tac_instr, TACStore):
		gen_asm_for_tac_store(tac_instr)

	elif isinstance(tac_instr, TACLoad):
		gen_asm_for_tac_load(tac_instr)

	elif isinstance(tac_instr, TACOutInt):
		# gen_asm_for_tac_out_int(tac_instr)
		raise ValueError("TACOutInt should not exist")

	elif isinstance(tac_instr, TACInInt):
		# gen_asm_for_tac_in_int(tac_instr)
		raise ValueError("TACInInt should not exist")

	elif isinstance(tac_instr, TACPlus):
		gen_asm_for_tac_plus(tac_instr)

	elif isinstance(tac_instr, TACMinus):
		gen_asm_for_tac_minus(tac_instr)

	elif isinstance(tac_instr, TACMult):
		gen_asm_for_tac_mult(tac_instr)

	elif isinstance(tac_instr, TACDiv):
		gen_asm_for_tac_div(tac_instr)

	elif isinstance(tac_instr, TACCompL):
		gen_asm_for_tac_comp_l(tac_instr)

	elif isinstance(tac_instr, TACCompLE):
		gen_asm_for_tac_comp_le(tac_instr)

	elif isinstance(tac_instr, TACCompE):
		gen_asm_for_tac_comp_e(tac_instr)

	elif isinstance(tac_instr, TACBox):
		gen_asm_for_tac_box(tac_instr)

	elif isinstance(tac_instr, TACUnbox):
		gen_asm_for_tac_unbox(tac_instr)

	elif isinstance(tac_instr, TACAlloc):
		gen_asm_for_tac_new(tac_instr)

	elif isinstance(tac_instr, TACLoadAttr):
		gen_asm_for_tac_load_attr(tac_instr)

	elif isinstance(tac_instr, TACStoreAttr):
		gen_asm_for_tac_store_attr(tac_instr)

	elif isinstance(tac_instr, TACIsVoid):
		gen_asm_for_tac_is_void(tac_instr)

	# ========================================
	# 				DISPATCH
	# ========================================
	elif isinstance(tac_instr, TACCall):
		gen_asm_for_tac_call(tac_instr)

	# elif isinstance(tac_instr, TACMakeParamSpace):
	# 	gen_asm_for_tac_make_param_space(tac_instr)

	# elif isinstance(tac_instr, TACRemoveParamSpace):
	# 	gen_asm_for_tac_remove_param_space(tac_instr)

	elif isinstance(tac_instr, TACStoreParam):
		gen_asm_for_tac_store_param(tac_instr)

	elif isinstance(tac_instr, TACLoadParam):
		gen_asm_for_tac_load_param(tac_instr)

	# elif isinstance(tac_instr, TACCall):
	# 	gen_asm_for_tac_call(tac_instr)

	else:
		raise NotImplementedError(str(tac_instr.__class__.__name__) + " not yet implemented")

def add_initial_method_setup(stack_offset):
	asm_instr_list.insert(1, ASMPushQ("%rbp"))
	asm_instr_list.insert(2, ASMMovQ("%rsp", "%rbp"))

	src = "$" + str(stack_offset)
	dest = "%rsp"
	asm_instr_list.insert(3, ASMSubQ(src, dest))

def gen_asm_for_block_list(block_list, register_colors, spilled_registers, type_name):
	global register_color_map, spilled_register_location_map, current_type

	# Set the current type
	current_type = type_name

	# Initalize global register color map
	register_color_map = register_colors

	# For now, assume everything has an offset of 8 bytes on the stack
	spilled_register_location_map = {}
	stack_offset = 0
	for idx, register in enumerate(spilled_registers):
		spilled_register_location_map[register] = (idx+1) * -8
		stack_offset += 8

	# ===============================================
	# TODO: Maybe save rbp here to ensure that offset from rbp is valid
	# This would effectively make a new stack frame
	# ===============================================

	# Allocate space on stack for saved regs
	stack_offset_str = "$" + str(stack_offset)
	asm_instr_list.append(ASMComment("allocate space to store " + str(len(spilled_registers)) + " spilled regs"))
	asm_instr_list.append(ASMSubQ(stack_offset_str, "%rsp"))

	# Generate the asm instructions for each tac instr
	for block in block_list:
		for tac_instr in block.instr_list:
			gen_asm_for_tac_instr(tac_instr)

	# Restore stack ptr
	asm_instr_list.append(ASMComment("remove temporary stack space for " + str(len(spilled_registers)) + " spilled regs"))
	asm_instr_list.append(ASMAddQ(stack_offset_str, "%rsp"))

	# ===============================================
	# TODO: Maybe restore rbp here to end stack frame
	# ===============================================


	# Add initial setup to the asm instr list
	# add_initial_method_setup(stack_offset)

# ========================================
#  INTERNAL FUNCTIONS
# ========================================
def gen_asm_for_internal_method(internal_name):
	if internal_name == "String.length":
		gen_asm_for_internal_length()

	elif internal_name == "IO.in_int":
		gen_asm_for_internal_in_int()

	elif internal_name == "IO.out_int":
		gen_asm_for_internal_out_int()

	elif internal_name == "IO.out_string":
		gen_asm_for_internal_out_string()

	elif internal_name == "IO.in_string":
		gen_asm_for_internal_in_string()

	else:
		# raise NotImplementedError(internal_name + " has not been implemented")
		pass

def gen_asm_for_internal_in_string():
	global asm_instr_list

	asm_instr_list.append(ASMComment("use generated code to get string"))

	custom_asm = ASMCustomString(
		"\t\t\tsubq	$32, %rsp\n" +
		"\t\t\tmovl	$20, -16(%rbp)\n" +
		"\t\t\tmovl	$0, -12(%rbp)\n" +
		"\t\t\tmovl	-16(%rbp), %eax\n" +
		"\t\t\tcltq\n" +
		"\t\t\tmovq	%rax, %rdi\n" +
		"\t\t\tcall	malloc\n" +
		"\t\t\tmovq	%rax, -8(%rbp)\n" +
		".in_string_L5:\n" +
		"\t\t\tcall	getchar\n" +
		"\t\t\tmovb	%al, -17(%rbp)\n" +
		"\t\t\tcmpb	$10, -17(%rbp)\n" +
		"\t\t\tje	.in_string_L2\n" +
		"\t\t\tcmpb	$-1, -17(%rbp)\n" +
		"\t\t\tje	.in_string_L2\n" +
		"\t\t\tmovl	-12(%rbp), %eax\n" +
		"\t\t\tmovslq	%eax, %rdx\n" +
		"\t\t\tmovq	-8(%rbp), %rax\n" +
		"\t\t\taddq	%rax, %rdx\n" +
		"\t\t\tmovzbl	-17(%rbp), %eax\n" +
		"\t\t\tmovb	%al, (%rdx)\n" +
		"\t\t\taddl	$1, -12(%rbp)\n" +
		"\t\t\tcmpb	$0, -17(%rbp)\n" +
		"\t\t\tjne	.in_string_L3\n" +
		"\t\t\tmovl	$0, -12(%rbp)\n" +
		"\t\t\tjmp	.in_string_L2\n" +
		".in_string_L3:\n" +
		"\t\t\tmovl	-12(%rbp), %eax\n" +
		"\t\t\tcmpl	-16(%rbp), %eax\n" +
		"\t\t\tjne	.in_string_L4\n" +
		"\t\t\taddl	$20, -16(%rbp)\n" +
		"\t\t\tmovl	-16(%rbp), %eax\n" +
		"\t\t\tmovslq	%eax, %rdx\n" +
		"\t\t\tmovq	-8(%rbp), %rax\n" +
		"\t\t\tmovq	%rdx, %rsi\n" +
		"\t\t\tmovq	%rax, %rdi\n" +
		"\t\t\tcall	realloc\n" +
		"\t\t\tmovq	%rax, -8(%rbp)\n" +
		"\t\t\tjmp	.in_string_L5\n" +
		".in_string_L4:\n" +
		"\t\t\tjmp	.in_string_L5\n" +
		".in_string_L2:\n" +
		"\t\t\tmovl	-12(%rbp), %eax\n" +
		"\t\t\tmovslq	%eax, %rdx\n" +
		"\t\t\tmovq	-8(%rbp), %rax\n" +
		"\t\t\tmovq	%rdx, %rsi\n" +
		"\t\t\tmovq	%rax, %rdi\n" +
		"\t\t\tcall	strndup\n" +
		"\t\t\tmovq	%rax, -8(%rbp)\n" #+
		# "\t\t\t## reset rsp\n" +
		# "\t\t\taddq 	$32, %rsp\n"
		)
	asm_instr_list.append(custom_asm)
	# Note: the string is now at -8(%rbp)
	asm_instr_list.append(ASMComment("result is now stored at -8(%rbp)"))

	# Create a new boxed string
	asm_instr_list.append(ASMComment("make new box in %rax to hold the str val"))
	gen_asm_for_new_boxed_type("String", "%rax")

	# Move the value of the string into the box
	asm_instr_list.append(ASMComment("use %r8 to move value of str into box"))
	asm_instr_list.append(ASMPushQ("%r8"))
	asm_instr_list.append(ASMMovQ("-8(%rbp)", "%r8"))
	asm_instr_list.append(ASMMovQ("%r8", "24(%rax)"))
	asm_instr_list.append(ASMPopQ("%r8"))

def gen_asm_for_internal_out_string():
	global asm_instr_list

	# Unbox string to get raw value
	# Note: string value must be in specific reg (%r8) for raw assembly to work
	asm_instr_list.append(ASMComment("loading param [0] into %rax"))
	asm_instr_list.append(ASMMovQ("16(%rbp)", "%rax"))
	asm_instr_list.append(ASMComment("unboxing param [0] (in %rax) into %r8"))
	asm_instr_list.append(ASMMovQ("24(%rax)", "%r8"))

	# Add generated assembly
	custom_asm = ASMCustomString(
			"\t\t\t## Start method body\n" +
			"\t\t\tsubq	$16, %rsp\n" +
			"\t\t\tmovq	%r8, -8(%rbp)\n" +
			"\t\t\tmovl	$0, -12(%rbp)\n" +
			"\t\t\tjmp	.L2\n" +
			".L5:\n" +
			"\t\t\tcmpb	$92, -14(%rbp)\n" +
			"\t\t\tjne	.L3\n" +
			"\t\t\tmovl	-12(%rbp), %eax\n" +
			"\t\t\tcltq\n" +
			"\t\t\tleaq	1(%rax), %rdx\n" +
			"\t\t\tmovq	-8(%rbp), %rax\n" +
			"\t\t\taddq	%rdx, %rax\n" +
			"\t\t\tmovzbl	(%rax), %eax\n" +
			"\t\t\tmovb	%al, -13(%rbp)\n" +
			"\t\t\tcmpb	$110, -13(%rbp)\n" +
			"\t\t\tjne	.L4\n" +
			"\t\t\tmovb	$10, -14(%rbp)\n" +
			"\t\t\taddl	$1, -12(%rbp)\n" +
			"\t\t\tjmp	.L3\n" +
			".L4:\n" +
			"\t\t\tcmpb	$116, -13(%rbp)\n" +
			"\t\t\tjne	.L3\n" +
			"\t\t\tmovb	$9, -14(%rbp)\n" +
			"\t\t\taddl	$1, -12(%rbp)\n" +
			".L3:\n" +
			"\t\t\tmovsbl	-14(%rbp), %eax\n" +
			"\t\t\tmovl	%eax, %edi\n" +
			"\t\t\tcall	putchar\n" +
			"\t\t\taddl	$1, -12(%rbp)\n" +
			".L2:\n" +
			"\t\t\tmovl	-12(%rbp), %eax\n" +
			"\t\t\tmovslq	%eax, %rdx\n" +
			"\t\t\tmovq	-8(%rbp), %rax\n" +
			"\t\t\taddq	%rdx, %rax\n" +
			"\t\t\tmovzbl	(%rax), %eax\n" +
			"\t\t\tmovb	%al, -14(%rbp)\n" +
			"\t\t\tcmpb	$0, -14(%rbp)\n" +
			"\t\t\tjne	.L5\n" #+
			# "\t\t\t## Fix the stack pointer\n" +
			# "\t\t\taddq	$16, %rsp\n"
		)
	asm_instr_list.append(custom_asm)

	# Move self ptr into %rax for return value
	asm_instr_list.append(ASMComment("move self ptr into %rax for return"))
	asm_instr_list.append(ASMMovQ(SELF_REG, "%rax"))

def gen_asm_for_internal_out_int():
	global asm_instr_list

	# No need to save caller-saved regs because done before calling out_int
	asm_instr_list.append(ASMComment("loading param [0] into %rax"))
	asm_instr_list.append(ASMMovQ("16(%rbp)", "%rax"))

	# Setup and call printf
	asm_instr_list.append(ASMComment("setup and call printf"))
	asm_instr_list.append(ASMMovL("24(%rax)", "%esi"))
	asm_instr_list.append(ASMMovQ("$out_int_format_str", "%rdi"))
	asm_instr_list.append(ASMMovL("$0", "%eax"))
	asm_instr_list.append(ASMCall("printf"))

	# Set return type to self ptr
	asm_instr_list.append(ASMComment("set self ptr as return type"))
	asm_instr_list.append(ASMMovQ(SELF_REG, "%rax"))

def gen_asm_for_internal_in_int():
	global asm_instr_list

	asm_instr_list.append(ASMComment("make tmp space on stack"))
	asm_instr_list.append(ASMSubQ("$8", "%rsp"))

	# Push caller-saved regs
	offset = 0
	for reg in caller_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))
		offset += 1
	rsp_offset = str(8 * offset) + "(%rsp)"

	# Setup and call scanf
	asm_instr_list.append(ASMComment("setup and call scanf"))
	asm_instr_list.append(ASMLeaQ(rsp_offset, "%rsi"))
	asm_instr_list.append(ASMMovQ("$in_int_format_str", "%rdi"))
	asm_instr_list.append(ASMMovL("$0", "%eax"))
	asm_instr_list.append(ASMCall("__isoc99_scanf"))

	# Pop all caller-saved regs
	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	# Make a new Int to store the result
	asm_instr_list.append(ASMComment("make new Int object in %rax"))
	for reg in caller_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))

	asm_instr_list.append(ASMCall("Int..new"))

	for reg in reversed(caller_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

	# Box the result in the int
	asm_instr_list.append(ASMComment("box answer in the new Int (use %r8 as tmp reg)"))
	asm_instr_list.append(ASMPushQ("%r8"))
	asm_instr_list.append(ASMMovQ("8(%rsp)", "%r8"))
	asm_instr_list.append(ASMMovQ("%r8", "24(%rax)"))
	asm_instr_list.append(ASMPopQ("%r8"))

	# Remove tmp space on stack
	asm_instr_list.append(ASMComment("remove tmp space on stack"))
	asm_instr_list.append(ASMAddQ("$8", "%rsp"))

def gen_asm_for_internal_length():
	global asm_instr_list

	# Push all callee-saved regs
	for reg in callee_saved_registers:
		asm_instr_list.append(ASMPushQ(reg))

	# Call strlen and keep result in rax
	# Note: No need to save caller-saved regs since none are in use
	asm_instr_list.append(ASMComment("call strlen to compute length"))
	str_val_src = "24("+SELF_REG+")"
	asm_instr_list.append(ASMMovQ(str_val_src, "%rdi"))
	asm_instr_list.append(ASMCall("strlen"))
	asm_instr_list.append(ASMMovQ("%rax", "%r8")) 

	# Make new Int box and put the result inside
	# Note: r9 is arbitrary here
	asm_instr_list.append(ASMComment("box final result"))
	gen_asm_for_new_boxed_type("Int", "%r9")
	asm_instr_list.append(ASMMovQ("%r8", "24(%r9)"))

	# Move final result into rax to return
	asm_instr_list.append(ASMComment("move result into rax"))
	asm_instr_list.append(ASMMovQ("%r9", "%rax"))

	# Pop all callee-saved regs
	for reg in reversed(callee_saved_registers):
		asm_instr_list.append(ASMPopQ(reg))

# ========================================
#  COMPARISON FUNCTIONS
# ========================================

# Returns a string representation of the asm for cmp lt
# Note: This uses a string since the asm can be hard-coded
def get_cmp_lt_helper_string():
	global type_tag_map
	tmp_instr_list = []

	# Set regs for lhs and rhs
	lhs_reg = "%r8"
	rhs_reg = "%r9"
	lhs_reg_32 = "%r8d"
	rhs_reg_32 = "%r9d"
	lhs_unbox_offset = "24("+lhs_reg+")"
	rhs_unbox_offset = "24("+rhs_reg+")"

	# Labels
	true_label = "cmp_lt_true"
	false_label = "cmp_lt_false"
	int_label = "cmp_lt_int"
	bool_label = "cmp_lt_bool"
	string_label = "cmp_lt_string"
	end_label = "cmp_lt_end"

	# Set up stack
	tmp_instr_list.append(ASMLabel("lt_helper"))
	tmp_instr_list.append(ASMPushQ("%rbp"))
	tmp_instr_list.append(ASMMovQ("%rsp", "%rbp"))

	# Get ptrs from stack
	tmp_instr_list.append(ASMComment("get lhs and rhs pointers from stack"))
	lhs_offset_rbp = "16(%rbp)"
	rhs_offset_rbp = "24(%rbp)"
	tmp_instr_list.append(ASMComment("move lhs into " + lhs_reg))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMComment("move rhs into " + rhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))

	# 1. Check if lhs_ptr = rhs_ptr
	# Skip this b/c lt

	# 2. Check if lhs_ptr = 0 || rhs_ptr = 0
	tmp_instr_list.append(ASMComment("check for void pointers"))
	tmp_instr_list.append(ASMCmpQ("$0", lhs_reg))
	tmp_instr_list.append(ASMJmpEq(false_label))
	tmp_instr_list.append(ASMCmpQ("$0", rhs_reg))
	tmp_instr_list.append(ASMJmpEq(false_label))

	# 3. Compare type tags
	tmp_instr_list.append(ASMComment("move type tags into " + lhs_reg + " and " + rhs_reg))
	lhs_type_tag_offset = "("+lhs_reg+")"
	rhs_type_tag_offset = "("+rhs_reg+")"
	tmp_instr_list.append(ASMMovQ(lhs_type_tag_offset, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_type_tag_offset, rhs_reg))

	# i. Check if different types
	tmp_instr_list.append(ASMComment("check for different types"))
	tmp_instr_list.append(ASMCmpQ(rhs_reg, lhs_reg))
	tmp_instr_list.append(ASMJmpNe(false_label))

	# ii. Check if type_tag = Int
	int_type_tag = "$" + str(type_tag_map["Int"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Ints"))
	tmp_instr_list.append(ASMCmpQ(int_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(int_label))

	# iii. Check if type_tag = Bool
	bool_type_tag = "$" + str(type_tag_map["Bool"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Bools"))
	tmp_instr_list.append(ASMCmpQ(bool_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(bool_label))

	# iv. Check if type_tag = String
	string_type_tag = "$" + str(type_tag_map["String"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Strings"))
	tmp_instr_list.append(ASMCmpQ(string_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(string_label))

	# v. Return false
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make labels for Int and Bool
	tmp_instr_list.append(ASMComment("compare Ints and Bools"))
	tmp_instr_list.append(ASMLabel(bool_label))
	tmp_instr_list.append(ASMLabel(int_label))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))
	tmp_instr_list.append(ASMMovL(lhs_unbox_offset, lhs_reg_32))
	tmp_instr_list.append(ASMMovL(rhs_unbox_offset, rhs_reg_32))
	tmp_instr_list.append(ASMCmpL(rhs_reg_32, lhs_reg_32))
	tmp_instr_list.append(ASMJmpL(true_label))
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make label for String
	tmp_instr_list.append(ASMComment("compare Strings"))
	tmp_instr_list.append(ASMLabel(string_label))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))
	tmp_instr_list.append(ASMMovQ(lhs_unbox_offset, "%rdi"))
	tmp_instr_list.append(ASMMovQ(rhs_unbox_offset, "%rsi"))
	tmp_instr_list.append(ASMCall("strcmp"))
	tmp_instr_list.append(ASMCmpL("$0", "%eax"))
	tmp_instr_list.append(ASMJmpL(true_label))
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make true and false labels
	tmp_instr_list.append(ASMComment("make new true object in %rax"))
	tmp_instr_list.append(ASMLabel(true_label))
	for reg in caller_saved_registers:
		tmp_instr_list.append(ASMPushQ(reg))

	tmp_instr_list.append(ASMCall("Bool..new"))

	for reg in reversed(caller_saved_registers):
		tmp_instr_list.append(ASMPopQ(reg))

	tmp_instr_list.append(ASMMovQ("$1", "24(%rax)"))
	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	tmp_instr_list.append(ASMComment("make new false object in %rax"))
	tmp_instr_list.append(ASMLabel(false_label))
	for reg in caller_saved_registers:
		tmp_instr_list.append(ASMPushQ(reg))

	tmp_instr_list.append(ASMCall("Bool..new"))

	for reg in reversed(caller_saved_registers):
		tmp_instr_list.append(ASMPopQ(reg))

	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	# Restore stack
	tmp_instr_list.append(ASMLabel(end_label))
	tmp_instr_list.append(ASMLeave())
	tmp_instr_list.append(ASMRet())

	# Make result string
	result = ""
	for asm_instr in tmp_instr_list:
		result += str(asm_instr)

	return result

# Returns a string representation of the asm for cmp le
# Note: This uses a string since the asm can be hard-coded
def get_cmp_le_helper_string():
	global type_tag_map
	tmp_instr_list = []

	# Set regs for lhs and rhs
	lhs_reg = "%r8"
	rhs_reg = "%r9"
	lhs_reg_32 = "%r8d"
	rhs_reg_32 = "%r9d"
	lhs_unbox_offset = "24("+lhs_reg+")"
	rhs_unbox_offset = "24("+rhs_reg+")"

	# Labels
	true_label = "cmp_le_true"
	false_label = "cmp_le_false"
	int_label = "cmp_le_int"
	bool_label = "cmp_le_bool"
	string_label = "cmp_le_string"
	end_label = "cmp_le_end"

	# Set up stack
	tmp_instr_list.append(ASMLabel("le_helper"))
	tmp_instr_list.append(ASMPushQ("%rbp"))
	tmp_instr_list.append(ASMMovQ("%rsp", "%rbp"))

	# Get ptrs from stack
	tmp_instr_list.append(ASMComment("get lhs and rhs pointers from stack"))
	lhs_offset_rbp = "16(%rbp)"
	rhs_offset_rbp = "24(%rbp)"
	tmp_instr_list.append(ASMComment("move lhs into " + lhs_reg))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMComment("move rhs into " + rhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))

	# 1. Check if lhs_ptr = rhs_ptr
	tmp_instr_list.append(ASMComment("check for same pointer"))
	tmp_instr_list.append(ASMCmpQ(rhs_reg, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(true_label))

	# 2. Check if lhs_ptr = 0 || rhs_ptr = 0
	tmp_instr_list.append(ASMComment("check for void pointers"))
	tmp_instr_list.append(ASMCmpQ("$0", lhs_reg))
	tmp_instr_list.append(ASMJmpEq(false_label))
	tmp_instr_list.append(ASMCmpQ("$0", rhs_reg))
	tmp_instr_list.append(ASMJmpEq(false_label))

	# 3. Compare type tags
	tmp_instr_list.append(ASMComment("move type tags into " + lhs_reg + " and " + rhs_reg))
	lhs_type_tag_offset = "("+lhs_reg+")"
	rhs_type_tag_offset = "("+rhs_reg+")"
	tmp_instr_list.append(ASMMovQ(lhs_type_tag_offset, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_type_tag_offset, rhs_reg))

	# i. Check if different types
	tmp_instr_list.append(ASMComment("check for different types"))
	tmp_instr_list.append(ASMCmpQ(rhs_reg, lhs_reg))
	tmp_instr_list.append(ASMJmpNe(false_label))

	# ii. Check if type_tag = Int
	int_type_tag = "$" + str(type_tag_map["Int"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Ints"))
	tmp_instr_list.append(ASMCmpQ(int_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(int_label))

	# iii. Check if type_tag = Bool
	bool_type_tag = "$" + str(type_tag_map["Bool"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Bools"))
	tmp_instr_list.append(ASMCmpQ(bool_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(bool_label))

	# iv. Check if type_tag = String
	string_type_tag = "$" + str(type_tag_map["String"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Strings"))
	tmp_instr_list.append(ASMCmpQ(string_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(string_label))

	# v. Return false
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make labels for Int and Bool
	tmp_instr_list.append(ASMComment("compare Ints and Bools"))
	tmp_instr_list.append(ASMLabel(bool_label))
	tmp_instr_list.append(ASMLabel(int_label))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))
	tmp_instr_list.append(ASMMovL(lhs_unbox_offset, lhs_reg_32))
	tmp_instr_list.append(ASMMovL(rhs_unbox_offset, rhs_reg_32))
	tmp_instr_list.append(ASMCmpL(rhs_reg_32, lhs_reg_32))
	tmp_instr_list.append(ASMJmpLe(true_label))
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make label for String
	tmp_instr_list.append(ASMComment("compare Strings"))
	tmp_instr_list.append(ASMLabel(string_label))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))
	tmp_instr_list.append(ASMMovQ(lhs_unbox_offset, "%rdi"))
	tmp_instr_list.append(ASMMovQ(rhs_unbox_offset, "%rsi"))
	tmp_instr_list.append(ASMCall("strcmp"))
	tmp_instr_list.append(ASMCmpL("$0", "%eax"))
	tmp_instr_list.append(ASMJmpLe(true_label))
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make true and false labels
	tmp_instr_list.append(ASMComment("make new true object in %rax"))
	tmp_instr_list.append(ASMLabel(true_label))
	for reg in caller_saved_registers:
		tmp_instr_list.append(ASMPushQ(reg))

	tmp_instr_list.append(ASMCall("Bool..new"))

	for reg in reversed(caller_saved_registers):
		tmp_instr_list.append(ASMPopQ(reg))

	tmp_instr_list.append(ASMMovQ("$1", "24(%rax)"))
	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	tmp_instr_list.append(ASMComment("make new false object in %rax"))
	tmp_instr_list.append(ASMLabel(false_label))
	for reg in caller_saved_registers:
		tmp_instr_list.append(ASMPushQ(reg))

	tmp_instr_list.append(ASMCall("Bool..new"))

	for reg in reversed(caller_saved_registers):
		tmp_instr_list.append(ASMPopQ(reg))

	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	# Restore stack
	tmp_instr_list.append(ASMLabel(end_label))
	tmp_instr_list.append(ASMLeave())
	tmp_instr_list.append(ASMRet())

	# Make result string
	result = ""
	for asm_instr in tmp_instr_list:
		result += str(asm_instr)

	return result

# Returns a string representation of the asm for cmp eq
# Note: This uses a string since the asm can be hard-coded
def get_cmp_eq_helper_string():
	global type_tag_map
	tmp_instr_list = []

	# Set regs for lhs and rhs
	lhs_reg = "%r8"
	rhs_reg = "%r9"
	lhs_reg_32 = "%r8d"
	rhs_reg_32 = "%r9d"
	lhs_unbox_offset = "24("+lhs_reg+")"
	rhs_unbox_offset = "24("+rhs_reg+")"

	# Labels
	true_label = "cmp_eq_true"
	false_label = "cmp_eq_false"
	int_label = "cmp_eq_int"
	bool_label = "cmp_eq_bool"
	string_label = "cmp_eq_string"
	end_label = "cmp_eq_end"

	# Set up stack
	tmp_instr_list.append(ASMLabel("eq_helper"))
	tmp_instr_list.append(ASMPushQ("%rbp"))
	tmp_instr_list.append(ASMMovQ("%rsp", "%rbp"))

	# Get ptrs from stack
	tmp_instr_list.append(ASMComment("get lhs and rhs pointers from stack"))
	lhs_offset_rbp = "16(%rbp)"
	rhs_offset_rbp = "24(%rbp)"
	tmp_instr_list.append(ASMComment("move lhs into " + lhs_reg))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMComment("move rhs into " + rhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))

	# 1. Check if lhs_ptr = rhs_ptr
	tmp_instr_list.append(ASMComment("check for same pointer"))
	tmp_instr_list.append(ASMCmpQ(rhs_reg, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(true_label))

	# 2. Check if lhs_ptr = 0 || rhs_ptr = 0
	tmp_instr_list.append(ASMComment("check for void pointers"))
	tmp_instr_list.append(ASMCmpQ("$0", lhs_reg))
	tmp_instr_list.append(ASMJmpEq(false_label))
	tmp_instr_list.append(ASMCmpQ("$0", rhs_reg))
	tmp_instr_list.append(ASMJmpEq(false_label))

	# 3. Compare type tags
	tmp_instr_list.append(ASMComment("move type tags into " + lhs_reg + " and " + rhs_reg))
	lhs_type_tag_offset = "("+lhs_reg+")"
	rhs_type_tag_offset = "("+rhs_reg+")"
	tmp_instr_list.append(ASMMovQ(lhs_type_tag_offset, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_type_tag_offset, rhs_reg))

	# i. Check if different types
	tmp_instr_list.append(ASMComment("check for different types"))
	tmp_instr_list.append(ASMCmpQ(rhs_reg, lhs_reg))
	tmp_instr_list.append(ASMJmpNe(false_label))

	# ii. Check if type_tag = Int
	int_type_tag = "$" + str(type_tag_map["Int"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Ints"))
	tmp_instr_list.append(ASMCmpQ(int_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(int_label))

	# iii. Check if type_tag = Bool
	bool_type_tag = "$" + str(type_tag_map["Bool"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Bools"))
	tmp_instr_list.append(ASMCmpQ(bool_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(bool_label))

	# iv. Check if type_tag = String
	string_type_tag = "$" + str(type_tag_map["String"])
	tmp_instr_list.append(ASMComment("check if lhs and rhs are Strings"))
	tmp_instr_list.append(ASMCmpQ(string_type_tag, lhs_reg))
	tmp_instr_list.append(ASMJmpEq(string_label))

	# v. Return false
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make labels for Int and Bool
	tmp_instr_list.append(ASMComment("compare Ints and Bools"))
	tmp_instr_list.append(ASMLabel(bool_label))
	tmp_instr_list.append(ASMLabel(int_label))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))
	tmp_instr_list.append(ASMMovL(lhs_unbox_offset, lhs_reg_32))
	tmp_instr_list.append(ASMMovL(rhs_unbox_offset, rhs_reg_32))
	tmp_instr_list.append(ASMCmpL(rhs_reg_32, lhs_reg_32))
	tmp_instr_list.append(ASMJmpEq(true_label))
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make label for String
	tmp_instr_list.append(ASMComment("compare Strings"))
	tmp_instr_list.append(ASMLabel(string_label))
	tmp_instr_list.append(ASMMovQ(lhs_offset_rbp, lhs_reg))
	tmp_instr_list.append(ASMMovQ(rhs_offset_rbp, rhs_reg))
	tmp_instr_list.append(ASMMovQ(lhs_unbox_offset, "%rdi"))
	tmp_instr_list.append(ASMMovQ(rhs_unbox_offset, "%rsi"))
	tmp_instr_list.append(ASMCall("strcmp"))
	tmp_instr_list.append(ASMCmpL("$0", "%eax"))
	tmp_instr_list.append(ASMJmpEq(true_label))
	tmp_instr_list.append(ASMJmp(false_label))
	tmp_instr_list.append("\n")

	# Make true and false labels
	tmp_instr_list.append(ASMComment("make new true object in %rax"))
	tmp_instr_list.append(ASMLabel(true_label))
	for reg in caller_saved_registers:
		tmp_instr_list.append(ASMPushQ(reg))

	tmp_instr_list.append(ASMCall("Bool..new"))

	for reg in reversed(caller_saved_registers):
		tmp_instr_list.append(ASMPopQ(reg))

	tmp_instr_list.append(ASMMovQ("$1", "24(%rax)"))
	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	tmp_instr_list.append(ASMComment("make new false object in %rax"))
	tmp_instr_list.append(ASMLabel(false_label))
	for reg in caller_saved_registers:
		tmp_instr_list.append(ASMPushQ(reg))

	tmp_instr_list.append(ASMCall("Bool..new"))

	for reg in reversed(caller_saved_registers):
		tmp_instr_list.append(ASMPopQ(reg))

	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	# Restore stack
	tmp_instr_list.append(ASMLabel(end_label))
	tmp_instr_list.append(ASMLeave())
	tmp_instr_list.append(ASMRet())

	# Make result string
	result = ""
	for asm_instr in tmp_instr_list:
		result += str(asm_instr)

	return result