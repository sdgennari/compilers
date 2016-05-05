from tac_objects import *
from asm_objects import *
from shared_vars import *

def get_string_concat_helper():
	result = "cool_str_concat:\n" + \
	"\t\t\tpushq\t%rbp\n" + \
	"\t\t\tmovq\t%rsp, %rbp\n" + \
	"\t\t\tsubq\t$32, %rsp\n" + \
	"\t\t\tmovq\t%rdi, -24(%rbp)\n" + \
	"\t\t\tmovq\t%rsi, -32(%rbp)\n" + \
	"\t\t\tmovq\t-24(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tstrlen\n" + \
	"\t\t\tmovl\t%eax, -16(%rbp)\n" + \
	"\t\t\tmovq\t-32(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tstrlen\n" + \
	"\t\t\tmovl\t%eax, -12(%rbp)\n" + \
	"\t\t\tmovl\t-12(%rbp), %eax\n" + \
	"\t\t\tmovl\t-16(%rbp), %edx\n" + \
	"\t\t\taddl\t%edx, %eax\n" + \
	"\t\t\taddl\t$1, %eax\n" + \
	"\t\t\tcltq\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tmalloc\n" + \
	"\t\t\tmovq\t%rax, -8(%rbp)\n" + \
	"\t\t\tmovq\t-24(%rbp), %rdx\n" + \
	"\t\t\tmovq\t-8(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rdx, %rsi\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tstrcpy\n" + \
	"\t\t\tmovq\t-32(%rbp), %rdx\n" + \
	"\t\t\tmovq\t-8(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rdx, %rsi\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tstrcat\n" + \
	"\t\t\tmovq\t-8(%rbp), %rax\n" + \
	"\t\t\tleave\n" + \
	"\t\t\tret\n" + \
	"\n"
	return result

def get_string_substr_helper():
	result = "cool_str_substr:\n" + \
	"\t\t\tpushq\t%rbp\n" + \
	"\t\t\tmovq\t%rsp, %rbp\n" + \
	"\t\t\tpushq\t%rbx\n" + \
	"\t\t\tsubq\t$24, %rsp\n" + \
	"\t\t\tmovq\t%rdi, -24(%rbp)\n" + \
	"\t\t\tmovl\t%esi, -28(%rbp)\n" + \
	"\t\t\tmovl\t%edx, -32(%rbp)\n" + \
	"\t\t\tcmpl\t$0, -28(%rbp)\n" + \
	"\t\t\tjs\t.substr_L4\n" + \
	"\t\t\tmovl\t-32(%rbp), %eax\n" + \
	"\t\t\tmovl\t-28(%rbp), %edx\n" + \
	"\t\t\taddl\t%edx, %eax\n" + \
	"\t\t\tmovslq\t%eax, %rbx\n" + \
	"\t\t\tmovq\t-24(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tstrlen\n" + \
	"\t\t\tcmpq\t%rax, %rbx\n" + \
	"\t\t\tjbe\t.substr_L5\n" + \
	".substr_L4:\n" + \
	"\t\t\tmovq\t$error.substr_range, %rdi\n" + \
	"\t\t\tcall\traw_out_string\n" + \
	"\t\t\tmovq\t$0, %rax\n" + \
	"\t\t\tcall\texit\n" + \
	".substr_L5:\n" + \
	"\t\t\tmovl\t-32(%rbp), %eax\n" + \
	"\t\t\tcltq\n" + \
	"\t\t\tmovl\t-28(%rbp), %edx\n" + \
	"\t\t\tmovslq\t%edx, %rcx\n" + \
	"\t\t\tmovq\t-24(%rbp), %rdx\n" + \
	"\t\t\taddq\t%rcx, %rdx\n" + \
	"\t\t\tmovq\t%rax, %rsi\n" + \
	"\t\t\tmovq\t%rdx, %rdi\n" + \
	"\t\t\tcall\tstrndup\n" + \
	"\t\t\taddq\t$24, %rsp\n" + \
	"\t\t\tpopq\t%rbx\n" + \
	"\t\t\tpopq\t%rbp\n" + \
	"\t\t\tret\n" + \
	"\n"
	return result

def get_raw_in_string_helper():
	result = "raw_in_string:\n" + \
	"\t\t\tpushq\t%rbp\n" + \
	"\t\t\tmovq\t%rsp, %rbp\n" + \
	"\t\t\tsubq\t$32, %rsp\n" + \
	"\t\t\tmovl\t$20, -16(%rbp)\n" + \
	"\t\t\tmovl\t$0, -12(%rbp)\n" + \
	"\t\t\tmovl\t-16(%rbp), %eax\n" + \
	"\t\t\tcltq\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tmalloc\n" + \
	"\t\t\tmovq\t%rax, -8(%rbp)\n" + \
	".in_str_L8:\n" + \
	"\t\t\tcall\tgetchar\n" + \
	"\t\t\tmovb\t%al, -17(%rbp)\n" + \
	"\t\t\tcmpb\t$10, -17(%rbp)\n" + \
	"\t\t\tje\t.in_str_L2\n" + \
	"\t\t\tcmpb\t$-1, -17(%rbp)\n" + \
	"\t\t\tje\t.in_str_L2\n" + \
	"\t\t\tmovl\t-12(%rbp), %eax\n" + \
	"\t\t\tmovslq\t%eax, %rdx\n" + \
	"\t\t\tmovq\t-8(%rbp), %rax\n" + \
	"\t\t\taddq\t%rax, %rdx\n" + \
	"\t\t\tmovzbl\t-17(%rbp), %eax\n" + \
	"\t\t\tmovb\t%al, (%rdx)\n" + \
	"\t\t\taddl\t$1, -12(%rbp)\n" + \
	"\t\t\tcmpb\t$0, -17(%rbp)\n" + \
	"\t\t\tjne\t.in_str_L3\n" + \
	"\t\t\tmovl\t$0, -12(%rbp)\n" + \
	"\t\t\tjmp\t.in_str_L4\n" + \
	".in_str_L6:\n" + \
	"\t\t\tcall\tgetchar\n" + \
	"\t\t\tmovb\t%al, -17(%rbp)\n" + \
	".in_str_L4:\n" + \
	"\t\t\tcmpb\t$10, -17(%rbp)\n" + \
	"\t\t\tje\t.L5\n" + \
	"\t\t\tcmpb\t$-1, -17(%rbp)\n" + \
	"\t\t\tjne\t.in_str_L6\n" + \
	".L5:\n" + \
	"\t\t\tjmp\t.in_str_L2\n" + \
	".in_str_L3:\n" + \
	"\t\t\tmovl\t-12(%rbp), %eax\n" + \
	"\t\t\tcmpl\t-16(%rbp), %eax\n" + \
	"\t\t\tjne\t.in_str_L7\n" + \
	"\t\t\taddl\t$20, -16(%rbp)\n" + \
	"\t\t\tmovl\t-16(%rbp), %eax\n" + \
	"\t\t\tmovslq\t%eax, %rdx\n" + \
	"\t\t\tmovq\t-8(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rdx, %rsi\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\trealloc\n" + \
	"\t\t\tmovq\t%rax, -8(%rbp)\n" + \
	"\t\t\tjmp\t.in_str_L8\n" + \
	".in_str_L7:\n" + \
	"\t\t\tjmp\t.in_str_L8\n" + \
	".in_str_L2:\n" + \
	"\t\t\tmovl\t-12(%rbp), %eax\n" + \
	"\t\t\tmovslq\t%eax, %rdx\n" + \
	"\t\t\tmovq\t-8(%rbp), %rax\n" + \
	"\t\t\tmovq\t%rdx, %rsi\n" + \
	"\t\t\tmovq\t%rax, %rdi\n" + \
	"\t\t\tcall\tstrndup\n" + \
	"\t\t\tleave\n" + \
	"\t\t\tret\n" + \
	"\n"
	return result

def get_raw_out_string_helper():
	result = "	.globl	raw_out_string\n" + \
	"	.type	raw_out_string, @function\n" + \
	"raw_out_string:\n" + \
	".raw_out_LFB0:\n" + \
	"	.cfi_startproc\n" + \
	"	pushq	%rbp\n" + \
	"	.cfi_def_cfa_offset 16\n" + \
	"	.cfi_offset 6, -16\n" + \
	"	movq	%rsp, %rbp\n" + \
	"	.cfi_def_cfa_register 6\n" + \
	"	subq	$32, %rsp\n" + \
	"	movq	%rdi, -24(%rbp)\n" + \
	"	movl	$0, -4(%rbp)\n" + \
	"	jmp	.raw_out_string_L2\n" + \
	".raw_out_string_L5:\n" + \
	"	cmpb	$92, -6(%rbp)\n" + \
	"	jne	.raw_out_string_L3\n" + \
	"	movl	-4(%rbp), %eax\n" + \
	"	cltq\n" + \
	"	leaq	1(%rax), %rdx\n" + \
	"	movq	-24(%rbp), %rax\n" + \
	"	addq	%rdx, %rax\n" + \
	"	movzbl	(%rax), %eax\n" + \
	"	movb	%al, -5(%rbp)\n" + \
	"	cmpb	$110, -5(%rbp)\n" + \
	"	jne	.raw_out_string_L4\n" + \
	"	movb	$10, -6(%rbp)\n" + \
	"	addl	$1, -4(%rbp)\n" + \
	"	jmp	.raw_out_string_L3\n" + \
	".raw_out_string_L4:\n" + \
	"	cmpb	$116, -5(%rbp)\n" + \
	"	jne	.raw_out_string_L3\n" + \
	"	movb	$9, -6(%rbp)\n" + \
	"	addl	$1, -4(%rbp)\n" + \
	".raw_out_string_L3:\n" + \
	"	movsbl	-6(%rbp), %eax\n" + \
	"	movl	%eax, %edi\n" + \
	"	call	putchar\n" + \
	"	addl	$1, -4(%rbp)\n" + \
	".raw_out_string_L2:\n" + \
	"	movl	-4(%rbp), %eax\n" + \
	"	movslq	%eax, %rdx\n" + \
	"	movq	-24(%rbp), %rax\n" + \
	"	addq	%rdx, %rax\n" + \
	"	movzbl	(%rax), %eax\n" + \
	"	movb	%al, -6(%rbp)\n" + \
	"	cmpb	$0, -6(%rbp)\n" + \
	"	jne	.raw_out_string_L5\n" + \
	"	leave\n" + \
	"	.cfi_def_cfa 7, 8\n" + \
	"	ret\n" + \
	"	.cfi_endproc\n" + \
	"\n"
	return result


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
	# tmp_instr_list.append(ASMComment("make new true object in %rax"))
	tmp_instr_list.append(ASMLabel(true_label))
	# for reg in caller_saved_registers:
	# 	tmp_instr_list.append(ASMPushQ(reg))
	# tmp_instr_list.append(ASMComment("save self reg"))
	# tmp_instr_list.append(ASMPushQ(SELF_REG))

	# tmp_instr_list.append(ASMCall("Bool..new"))

	# tmp_instr_list.append(ASMComment("restore self reg"))
	# tmp_instr_list.append(ASMPopQ(SELF_REG))
	# for reg in reversed(caller_saved_registers):
	# 	tmp_instr_list.append(ASMPopQ(reg))

	# tmp_instr_list.append(ASMMovQ("$1", "24(%rax)"))
	tmp_instr_list.append(ASMMovQ("$1", "%rax"))
	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	# tmp_instr_list.append(ASMComment("make new false object in %rax"))
	tmp_instr_list.append(ASMLabel(false_label))
	# for reg in caller_saved_registers:
	# 	tmp_instr_list.append(ASMPushQ(reg))
	# tmp_instr_list.append(ASMComment("save self reg"))
	# tmp_instr_list.append(ASMPushQ(SELF_REG))	

	# tmp_instr_list.append(ASMCall("Bool..new"))

	# tmp_instr_list.append(ASMComment("restore self reg"))
	# tmp_instr_list.append(ASMPopQ(SELF_REG))
	# for reg in reversed(caller_saved_registers):
		# tmp_instr_list.append(ASMPopQ(reg))
	tmp_instr_list.append(ASMMovQ("$0", "%rax"))
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
	# tmp_instr_list.append(ASMComment("make new true object in %rax"))
	tmp_instr_list.append(ASMLabel(true_label))
	# for reg in caller_saved_registers:
		# tmp_instr_list.append(ASMPushQ(reg))
	# tmp_instr_list.append(ASMComment("save self reg"))
	# tmp_instr_list.append(ASMPushQ(SELF_REG))

	# tmp_instr_list.append(ASMCall("Bool..new"))

	# tmp_instr_list.append(ASMComment("restore self reg"))
	# tmp_instr_list.append(ASMPopQ(SELF_REG))
	# for reg in reversed(caller_saved_registers):
		# tmp_instr_list.append(ASMPopQ(reg))

	# tmp_instr_list.append(ASMMovQ("$1", "24(%rax)"))
	tmp_instr_list.append(ASMMovQ("$1", "%rax"))
	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	# tmp_instr_list.append(ASMComment("make new false object in %rax"))
	tmp_instr_list.append(ASMLabel(false_label))
	# for reg in caller_saved_registers:
		# tmp_instr_list.append(ASMPushQ(reg))
	# tmp_instr_list.append(ASMComment("save self reg"))
	# tmp_instr_list.append(ASMPushQ(SELF_REG))

	# tmp_instr_list.append(ASMCall("Bool..new"))

	# tmp_instr_list.append(ASMComment("restore self reg"))
	# tmp_instr_list.append(ASMPopQ(SELF_REG))
	# for reg in reversed(caller_saved_registers):
		# tmp_instr_list.append(ASMPopQ(reg))
	tmp_instr_list.append(ASMMovQ("$0", "%rax"))
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
	# tmp_instr_list.append(ASMComment("make new true object in %rax"))
	tmp_instr_list.append(ASMLabel(true_label))
	# for reg in caller_saved_registers:
	# 	tmp_instr_list.append(ASMPushQ(reg))
	# tmp_instr_list.append(ASMComment("save self reg"))
	# tmp_instr_list.append(ASMPushQ(SELF_REG))

	# tmp_instr_list.append(ASMCall("Bool..new"))

	# tmp_instr_list.append(ASMComment("restore self reg"))
	# tmp_instr_list.append(ASMPopQ(SELF_REG))
	# for reg in reversed(caller_saved_registers):
		# tmp_instr_list.append(ASMPopQ(reg))

	# tmp_instr_list.append(ASMMovQ("$1", "24(%rax)"))
	tmp_instr_list.append(ASMMovQ("$1", "%rax"))
	tmp_instr_list.append(ASMJmp(end_label))
	tmp_instr_list.append(("\n"))

	# tmp_instr_list.append(ASMComment("make new false object in %rax"))
	tmp_instr_list.append(ASMLabel(false_label))
	# for reg in caller_saved_registers:
	# 	tmp_instr_list.append(ASMPushQ(reg))
	# tmp_instr_list.append(ASMComment("save self reg"))
	# tmp_instr_list.append(ASMPushQ(SELF_REG))

	# tmp_instr_list.append(ASMCall("Bool..new"))

	# tmp_instr_list.append(ASMComment("restore self reg"))
	# tmp_instr_list.append(ASMPopQ(SELF_REG))
	# for reg in reversed(caller_saved_registers):
	# 	tmp_instr_list.append(ASMPopQ(reg))
	tmp_instr_list.append(ASMMovQ("$0", "%rax"))
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