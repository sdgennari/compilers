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
	subq	$28, %rsp
	# default Int
	movl	$0, %r9d
	# store
	movl	%r9d, -16(%rbp)
	# default Int
	movl	$0, %edi
	# store
	movl	%edi, -12(%rbp)
	# default Int
	movl	$0, %r13d
	# default Int
	movl	$0, %r10d
	# store
	movl	%r10d, -28(%rbp)
	# default Int
	movl	$0, %r10d
	# store
	movl	%r10d, -24(%rbp)
	# default Int
	movl	$0, %r9d
	# store
	movl	%r9d, -20(%rbp)
	# default Int
	movl	$0, %r9d
	# store
	movl	%r9d, -8(%rbp)
	# default Int
	movl	$0, %r9d
	# store
	movl	%r9d, -4(%rbp)
	# default Int
	movl	$0, %r11d
	# default Int
	movl	$0, %r12d
	# default Int
	movl	$0, %r14d
	# default Int
	movl	$0, %r15d
	# default Int
	movl	$0, %esi
	# default Int
	movl	$0, %edx
	# default Int
	movl	$0, %ecx
	# default Int
	movl	$0, %ebx
	# default Int
	movl	$0, %r9d
	# default Int
	movl	$0, %edi
	# default Int
	movl	$0, %r8d
	movl	$1, %r8d
	# assign
	movl	%r8d, %r9d
	# store
	movl	%r9d, -16(%rbp)
	movl	$2, %r8d
	# assign
	movl	%r8d, %edi
	# store
	movl	%edi, -12(%rbp)
	movl	$3, %r8d
	# assign
	movl	%r8d, %r13d
	movl	$4, %r8d
	# assign
	movl	%r8d, %r10d
	# store
	movl	%r10d, -28(%rbp)
	movl	$5, %r8d
	# assign
	movl	%r8d, %r10d
	# store
	movl	%r10d, -24(%rbp)
	movl	$6, %r8d
	# assign
	movl	%r8d, %r9d
	# store
	movl	%r9d, -20(%rbp)
	movl	$7, %r8d
	# assign
	movl	%r8d, %r9d
	# store
	movl	%r9d, -8(%rbp)
	movl	$8, %r8d
	# assign
	movl	%r8d, %r9d
	# store
	movl	%r9d, -4(%rbp)
	movl	$9, %r8d
	# assign
	movl	%r8d, %r11d
	movl	$10, %r8d
	# assign
	movl	%r8d, %r12d
	movl	$11, %r8d
	# assign
	movl	%r8d, %r14d
	movl	$12, %r8d
	# assign
	movl	%r8d, %r15d
	movl	$13, %r8d
	# assign
	movl	%r8d, %esi
	movl	$14, %r8d
	# assign
	movl	%r8d, %edx
	movl	$15, %r8d
	# assign
	movl	%r8d, %ecx
	movl	$16, %r8d
	# assign
	movl	%r8d, %ebx
	# load
	movl	-16(%rbp), %r9d
	# assign
	movl	%r9d, %r8d
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%ebx, %r8d
	# assign
	movl	%r8d, %edi
	# load
	movl	-28(%rbp), %r10d
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%r9d, %r8d
	# assign
	movl	%edi, %eax
	# assign
	movl	%r8d, %r9d
	# divide
	subq	$8, %rsp
	pushq	%rdx
	pushq	%rax
	pushq	%rcx
	movl	%r9d, 24(%rsp)
	movl	%eax, %eax
	cltd
	movl	24(%rsp), %ecx
	idivl	%ecx
	movl	%eax, 28(%rsp)
	popq	%rcx
	popq	%rax
	popq	%rdx
	movl	4(%rsp), %r10d
	addq	$8, %rsp
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%r9d, %r10d
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
	movl	%r10d, %esi
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
	# assign
	movl	%edi, %r10d
	# assign
	movl	%r8d, %r9d
	# divide
	subq	$8, %rsp
	pushq	%rdx
	pushq	%rax
	pushq	%rcx
	movl	%r9d, 24(%rsp)
	movl	%r10d, %eax
	cltd
	movl	24(%rsp), %ecx
	idivl	%ecx
	movl	%eax, 28(%rsp)
	popq	%rcx
	popq	%rax
	popq	%rdx
	movl	4(%rsp), %r8d
	addq	$8, %rsp
	# assign
	movl	%r8d, %r9d
	# load
	movl	-12(%rbp), %edi
	# assign
	movl	%edi, %r8d
	# assign
	movl	%r13d, %r9d
	# divide
	subq	$8, %rsp
	pushq	%rdx
	pushq	%rax
	pushq	%rcx
	movl	%r9d, 24(%rsp)
	movl	%r8d, %eax
	cltd
	movl	24(%rsp), %ecx
	idivl	%ecx
	movl	%eax, 28(%rsp)
	popq	%rcx
	popq	%rax
	popq	%rdx
	movl	4(%rsp), %r10d
	addq	$8, %rsp
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%ecx, %r8d
	# load
	movl	-24(%rbp), %r10d
	# assign
	movl	%r10d, %r9d
	# divide
	subq	$8, %rsp
	pushq	%rdx
	pushq	%rax
	pushq	%rcx
	movl	%r9d, 24(%rsp)
	movl	%r8d, %eax
	cltd
	movl	24(%rsp), %ecx
	idivl	%ecx
	movl	%eax, 28(%rsp)
	popq	%rcx
	popq	%rax
	popq	%rdx
	movl	4(%rsp), %r10d
	addq	$8, %rsp
	# assign
	movl	%r10d, %r9d
	# assign
	movl	%r12d, %r9d
	# assign
	movl	%r14d, %r8d
	# divide
	subq	$8, %rsp
	pushq	%rdx
	pushq	%rax
	pushq	%rcx
	movl	%r8d, 24(%rsp)
	movl	%r9d, %eax
	cltd
	movl	24(%rsp), %ecx
	idivl	%ecx
	movl	%eax, 28(%rsp)
	popq	%rcx
	popq	%rax
	popq	%rdx
	movl	4(%rsp), %r10d
	addq	$8, %rsp
	# assign
	movl	%r10d, %r9d
	# load
	movl	-8(%rbp), %r9d
	# assign
	movl	%r9d, %r10d
	# load
	movl	-12(%rbp), %edi
	# assign
	movl	%edi, %r9d
	# divide
	subq	$8, %rsp
	pushq	%rdx
	pushq	%rax
	pushq	%rcx
	movl	%r9d, 24(%rsp)
	movl	%r10d, %eax
	cltd
	movl	24(%rsp), %ecx
	idivl	%ecx
	movl	%eax, 28(%rsp)
	popq	%rcx
	popq	%rax
	popq	%rdx
	movl	4(%rsp), %r8d
	addq	$8, %rsp
	# assign
	movl	%r8d, %r9d
	# assign
	movl	%r9d, %r8d
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
	# load
	movl	-16(%rbp), %r9d
	# assign
	movl	%r9d, %r8d
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
	# load
	movl	-12(%rbp), %edi
	# assign
	movl	%edi, %r9d
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
	# assign
	movl	%r13d, %r9d
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
	# load
	movl	-28(%rbp), %r10d
	# assign
	movl	%r10d, %r9d
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
	# load
	movl	-24(%rbp), %r10d
	# assign
	movl	%r10d, %r9d
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
	# load
	movl	-20(%rbp), %r9d
	# assign
	movl	%r9d, %r10d
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
	movl	%r10d, %esi
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
	# load
	movl	-8(%rbp), %r9d
	# assign
	movl	%r9d, %r8d
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
	# load
	movl	-4(%rbp), %r9d
	# assign
	movl	%r9d, %r10d
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
	movl	%r10d, %esi
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
	# assign
	movl	%r11d, %r8d
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
	# assign
	movl	%r12d, %r8d
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
	# assign
	movl	%r14d, %r8d
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
	# assign
	movl	%r15d, %r9d
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
	# assign
	movl	%esi, %r9d
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
	# assign
	movl	%edx, %r8d
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
	# assign
	movl	%ecx, %r9d
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
	# assign
	movl	%ebx, %r9d
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
	# assign
	movl	%r8d, %r9d
	# return
	movl	%r9d, %eax
	leave
	ret
