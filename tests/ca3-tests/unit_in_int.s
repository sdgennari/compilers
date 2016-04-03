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
	# begin in_int
	subq	$4, %rsp
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	leaq	72(%rsp), %rsi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	movl	(%rsp), %r8d
	addq	$4, %rsp
	# end in_int
	# return
	movl	%r8d, %eax
	leave
	ret
