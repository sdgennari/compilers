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
	movl	$7, %r8d
	movl	%r8d, %r9d
	movl	$10, %r8d
	movl	%r8d, %r8d
	cmpl	%r8d, %r9d
	movl	$1, %r8d
	jl	.asm_label_1
	movl	$0, %r8d
.asm_label_1:
	movl	%r8d, %r9d
	xorl	$1, %r9d
	test	%r8d, %r8d
	jnz	.if_then_2
	test	%r9d, %r9d
	jnz	.if_else_2
.if_then_2:
	movl	$777, %r8d
	movl	%r8d, %r8d
	jmp	.if_exit_2
.if_else_2:
	movl	$9001, %r8d
	movl	%r8d, %r8d
	jmp	.if_exit_2
.if_exit_2:
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	movl	%r8d, %eax
	leave
	ret
