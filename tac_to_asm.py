from tac_objects import *
from asm_objects import *

# Initialize global vars
asm_instr_list = []
register_color_map = {}
spilled_register_location_map = {}
asm_label_counter = 0
const_string_label_counter = 0
# Map constant strings to their label
const_string_label_map = {}

caller_saved_registers = [
	"%rax", "%rcx", "%rdx",
	"%rsi", "%rdi", "%r8",
	"%r9", "%r10", "%r11",
]

register_names_32 = [
	"%r8d","%r9d", "%r10d",
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
	raise NotImplementedError("Branch not yet implemented")
	# label = "." + str(tac_bt.label)
	# reg = get_asm_register(tac_bt.op1)

	# # asm_instr_list.append(ASMCmpL("$1", reg))
	# # asm_instr_list.append(ASMJmpEq(label))

	# asm_instr_list.append(ASMComment("branch " + label))
	# asm_instr_list.append(ASMTestL(reg, reg))
	# asm_instr_list.append(ASMJmpNz(label))

# ---- TODO Update for boxing + unboxing
def gen_asm_for_tac_store(tac_store):
	src = get_asm_register(tac_store.op1)
	offset = spilled_register_location_map[tac_store.op1]

	dest = str(offset) + "(%rbp)"

	asm_instr_list.append(ASMComment("store"))
	asm_instr_list.append(ASMMovL(src, dest))

# ---- TODO Update for boxing + unboxing
def gen_asm_for_tac_load(tac_load):
	dest = get_asm_register(tac_load.assignee)

	offset = spilled_register_location_map[tac_load.location]
	src = str(offset) + "(%rbp)"

	asm_instr_list.append(ASMComment("load"))
	asm_instr_list.append(ASMMovL(src, dest))

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
	# op1_reg = get_asm_register(tac_comp_l.op1)
	# op2_reg = get_asm_register(tac_comp_l.op2)
	# dest = get_asm_register(tac_comp_l.assignee)
	# label = next_asm_label()

	# asm_instr_list.append(ASMComment("comp LT"))
	# asm_instr_list.append(ASMCmpL(op2_reg, op1_reg))
	# asm_instr_list.append(ASMMovL("$1", dest))
	# asm_instr_list.append(ASMJmpL(label))
	# asm_instr_list.append(ASMMovL("$0", dest))
	# asm_instr_list.append(ASMLabel(label))
	raise NotImplementedError("Comp LT not yet implemented")

def gen_asm_for_tac_comp_le(tac_comp_le):
	# op1_reg = get_asm_register(tac_comp_le.op1)
	# op2_reg = get_asm_register(tac_comp_le.op2)
	# dest = get_asm_register(tac_comp_le.assignee)
	# label = next_asm_label()

	# asm_instr_list.append(ASMComment("comp LE"))
	# asm_instr_list.append(ASMCmpL(op2_reg, op1_reg))
	# asm_instr_list.append(ASMMovL("$1", dest))
	# asm_instr_list.append(ASMJmpLe(label))
	# asm_instr_list.append(ASMMovL("$0", dest))
	# asm_instr_list.append(ASMLabel(label))
	raise NotImplementedError("Comp LE not yet implemented")

def gen_asm_for_tac_comp_e(tac_comp_e):
	# op1_reg = get_asm_register(tac_comp_e.op1)
	# op2_reg = get_asm_register(tac_comp_e.op2)
	# dest = get_asm_register(tac_comp_e.assignee)
	# label = next_asm_label()

	# asm_instr_list.append(ASMComment("comp EQ"))
	# asm_instr_list.append(ASMCmpL(op2_reg, op1_reg))
	# asm_instr_list.append(ASMMovL("$1", dest))
	# asm_instr_list.append(ASMJmpEq(label))
	# asm_instr_list.append(ASMMovL("$0", dest))
	# asm_instr_list.append(ASMLabel(label))
	raise NotImplementedError("Comp EQ not yet implemented")

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
	asm_instr_list += [
		# Note: <box_type>..new only changes %rsi and %rdi, so only have to push them
		ASMPushQ("%rsi"),
		ASMPushQ("%rdi"),
		ASMCall(constructor_method),
		ASMPopQ("%rdi"),
		ASMPopQ("%rsi"),
		# Move pointer to alloc'd space from rax into dest
		ASMMovQ("%rax", dest_reg),
	]

# BOXED + UNBOXED
def gen_asm_for_tac_unbox(tac_unbox):
	op1_reg = get_asm_register(tac_unbox.op1, 64)
	dest = get_asm_register(tac_unbox.assignee, 64)

	asm_instr_list.append(ASMComment("unbox value of " + op1_reg + " into " + dest))
	op1_reg_offset = "24(" + op1_reg + ")"
	asm_instr_list.append(ASMMovQ(op1_reg_offset, dest))

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
		gen_asm_for_tac_out_int(tac_instr)

	elif isinstance(tac_instr, TACInInt):
		gen_asm_for_tac_in_int(tac_instr)

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

	else:
		asm_instr_list.append("\t\t\t\t\t" + str(tac_instr))
		raise NotImplementedError(str(tac_instr.__class__.__name__) + " not yet implemented")

def add_initial_method_setup(stack_offset):
	asm_instr_list.insert(1, ASMPushQ("%rbp"))
	asm_instr_list.insert(2, ASMMovQ("%rsp", "%rbp"))

	src = "$" + str(stack_offset)
	dest = "%rsp"
	asm_instr_list.insert(3, ASMSubQ(src, dest))

def gen_asm_for_block_list(block_list, register_colors, spilled_registers):
	global register_color_map, spilled_register_location_map

	# Initalize global register color map
	register_color_map = register_colors

	# For now, assume everything has an offset of 4 bytes on the stack
	# This will change since strings will require 8 bytes
	stack_offset = 0
	for idx, register in enumerate(spilled_registers):
		spilled_register_location_map[register] = (idx+1) * -4
		stack_offset += 4

	# Generate the asm instructions for each tac instr
	for block in block_list:
		for tac_instr in block.instr_list:
			gen_asm_for_tac_instr(tac_instr)

	# Add initial setup to the asm instr list
	add_initial_method_setup(stack_offset)
