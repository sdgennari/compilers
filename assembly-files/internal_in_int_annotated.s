	.file	"internal_in_int.c"
	.section	.rodata
.in_int_C0:
	.string	"%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$32, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	-24(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
.in_int_5:
	call	getchar
	movb	%al, -25(%rbp)
	cmpb	$10, -25(%rbp)
	je	.in_int_2
	cmpb	$-1, -25(%rbp)
	je	.in_int_2
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-25(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -20(%rbp)
	cmpb	$0, -25(%rbp)
	jne	.in_int_3
	movl	$0, -20(%rbp)
	jmp	.in_int_2
.in_int_3:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	.in_int_4
	addl	$20, -24(%rbp)
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, -8(%rbp)
	jmp	.in_int_5
.in_int_4:
	jmp	.in_int_5
.in_int_2:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atol
	movq	%rax, -16(%rbp)
	cmpq	$2147483647, -16(%rbp)
	jle	.in_int_6
	movq	$0, -16(%rbp)
	jmp	.in_int_7
.in_int_6:
	cmpq	$-2147483648, -16(%rbp)
	jge	.in_int_7
	movq	$0, -16(%rbp)
.in_int_7:
	movq	-16(%rbp), %rax

	# Call printf
	movq	%rax, %rsi
	movl	$.in_int_C0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	ret
.in_int_FE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
