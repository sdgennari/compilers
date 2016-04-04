	.section	.rodata
.int_fmt_string:
	.string "%d"
	.text
.globl	main
	.type	main, @function
main:
.Main_main_1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
	# default Int
	movl	$0, %r15d
	# default Int
	movl	$0, %ebx
	# default Int
	movl	$0, %r11d
	# default Int
	movl	$0, %r12d
	# default Int
	movl	$0, %r13d
	# default Int
	movl	$0, %r14d
	# default Int
	movl	$0, %edx
	# default Int
	movl	$0, %ecx
	# default Int
	movl	$0, %r8d
	# default Int
	movl	$0, %r10d
	# default Int
	movl	$0, %r9d
	# assign
	movl	%r15d, %r9d
	# assign
	movl	%ebx, %r15d
	# comp LT
	cmpl	%r15d, %r9d
	movl	$1, %ebx
	jl	.asm_label_1
	movl	$0, %ebx
.asm_label_1:
	# not
	movl	%ebx, %r9d
	xorl	$1, %r9d
	# branch .if_then_2
	test	%ebx, %ebx
	jnz	.if_then_2
	# branch .if_else_2
	test	%r9d, %r9d
	jnz	.if_else_2
.if_then_2:
	# assign
	movl	%r11d, %r10d
	# assign
	movl	%r12d, %r8d
	# comp LT
	cmpl	%r8d, %r10d
	movl	$1, %r9d
	jl	.asm_label_2
	movl	$0, %r9d
.asm_label_2:
	# not
	movl	%r9d, %r8d
	xorl	$1, %r8d
	# branch .if_then_3
	test	%r9d, %r9d
	jnz	.if_then_3
	# branch .if_else_3
	test	%r8d, %r8d
	jnz	.if_else_3
.if_then_3:
	# assign
	movl	%r13d, %r8d
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%r9d, %r8d
	jmp	.if_exit_3
.if_else_3:
	# assign
	movl	%r14d, %r8d
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%r9d, %r8d
	jmp	.if_exit_3
.if_exit_3:
	# assign
	movl	%r8d, %r9d
	jmp	.if_exit_2
.if_else_2:
	# assign
	movl	%edx, %r11d
	# assign
	movl	%ecx, %r12d
	# comp LT
	cmpl	%r12d, %r11d
	movl	$1, %r9d
	jl	.asm_label_3
	movl	$0, %r9d
.asm_label_3:
	# not
	movl	%r9d, %r11d
	xorl	$1, %r11d
	# branch .if_then_4
	test	%r9d, %r9d
	jnz	.if_then_4
	# branch .if_else_4
	test	%r11d, %r11d
	jnz	.if_else_4
.if_then_4:
	# assign
	movl	%r8d, %r10d
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%r9d, %r8d
	jmp	.if_exit_4
.if_else_4:
	# assign
	movl	%r10d, %r8d
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%r9d, %r8d
	jmp	.if_exit_4
.if_exit_4:
	# assign
	movl	%r8d, %r9d
	jmp	.if_exit_2
.if_exit_2:
	# assign
	movl	%r9d, %r8d
	# return
	movl	%r8d, %eax
	leave
	ret
