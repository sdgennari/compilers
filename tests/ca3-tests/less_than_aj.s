.section	.rodata
.int_fmt_string:
	.string "%d"
	.text
.global	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
Main_main_0:
	movl	$7, %r9d
	movl	%r9d, %r9d
	movl	$10, %r10d
	movl	%r10d, %r10d
	movl	%r9d, %r9d
	movl	%r10d, %r10d
	# less than
	cmpl	%r9d, %r10d
	movl	$1, %r9d
	jl	asm_label_4
	movl	$0, %r9d
asm_label_4:
	movl	%r9d, %r10d
	xorl	$1, %r10d
	# branch
	cmpl	$1, %r9d
	je	if_then_1
	# branch
	cmpl	$1, %r10d
	je	if_else_2
if_then_1:
	movl	$777, %r9d
	movl	%r9d, %r9d
	jmp	if_fi_3
if_else_2:
if_fi_3:
	movl	%r9d, %r9d
	# out_int
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
	movl	%r8d, %eax
	leave
	ret
