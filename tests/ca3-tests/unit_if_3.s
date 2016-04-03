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
	movl	%r8d, %r9d
	movl	$2, %r8d
	movl	$1, %r10d
	movl	%r10d, %r8d
	xorl	$1, %r8d
	test	%r10d, %r10d
	jnz	.if_then_2
	test	%r8d, %r8d
	jnz	.if_else_2
.if_then_2:
	movl	$7, %r8d
	addl	%r9d, %r8d
	movl	%r8d, %r9d
	jmp	.if_exit_2
.if_else_2:
	jmp	.if_exit_2
.if_exit_2:
	movl	%r9d, %eax
	leave
	ret
