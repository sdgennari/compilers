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
	movl	%r8d, %r8d
	movl	$0, %r8d
	addl	%r9d, %r8d
	movl	%r8d, %r8d
	movl	%r8d, %r8d
	addl	%r9d, %r8d
	movl	%r8d, %eax
	leave
	ret
