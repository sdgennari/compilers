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
	movl	%r8d, %r10d
	movl	$2, %r8d
	movl	%r8d, %r8d
	movl	$0, %r8d
	movl	$1, %r11d
	movl	%r11d, %r9d
	xorl	$1, %r9d
	test	%r11d, %r11d
	jnz	.if_then_2
	test	%r9d, %r9d
	jnz	.if_else_2
.if_then_2:
	movl	%r10d, %r8d
	jmp	.if_exit_2
.if_else_2:
	movl	%r8d, %r8d
	jmp	.if_exit_2
.if_exit_2:
	movl	%r8d, %eax
	leave
	ret
