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
	movl	$1, %r8d
	# assign
	movl	%r8d, %r10d
	movl	$2, %r8d
	# assign
	movl	%r8d, %r11d
	# default Int
	movl	$0, %r9d
	# const Bool
	movl	$1, %r9d
	# not
	movl	%r9d, %r8d
	xorl	$1, %r8d
	# branch .if_then_2
	test	%r9d, %r9d
	jnz	.if_then_2
	# branch .if_else_2
	test	%r8d, %r8d
	jnz	.if_else_2
.if_then_2:
	# assign
	movl	%r10d, %r9d
	movl	$7, %r10d
	# plus
	movl	%r9d, %r8d
	addl	%r10d, %r8d
	# assign
	movl	%r8d, %r10d
	# assign
	movl	%r10d, %r8d
	jmp	.if_exit_2
.if_else_2:
	# assign
	movl	%r11d, %r8d
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%r9d, %r8d
	jmp	.if_exit_2
.if_exit_2:
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%r9d, %r8d
	# return
	movl	%r8d, %eax
	leave
	ret
