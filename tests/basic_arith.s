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
	movl	$0, %r9d
	# default Int
	movl	$0, %r10d
	# default Int
	movl	$0, %r8d
	movl	$111, %r8d
	# assign
	movl	%r8d, %r9d
	movl	$222, %r8d
	# assign
	movl	%r8d, %r10d
	movl	$333, %r9d
	# assign
	movl	%r9d, %r8d
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%r8d, %r10d
	# plus
	movl	%r9d, %r8d
	addl	%r10d, %r8d
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%r9d, %r8d
	# return
	movl	%r8d, %eax
	leave
	ret
