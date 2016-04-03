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
	movl	$0, %r9d
	jmp	.loop_start_2
.loop_start_2:
	movl	$10, %r8d
	cmpl	%r8d, %r9d
	movl	$1, %r10d
	jl	.asm_label_1
	movl	$0, %r10d
.asm_label_1:
	movl	%r10d, %r8d
	xorl	$1, %r8d
	test	%r10d, %r10d
	jnz	.loop_body_2
	test	%r8d, %r8d
	jnz	.loop_exit_2
.loop_body_2:
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
	movl	%r9d, %esi
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
	movl	$1, %r8d
	addl	%r9d, %r8d
	movl	%r8d, %r9d
	jmp	.loop_start_2
.loop_exit_2:
	movl	%r8d, %eax
	leave
	ret
