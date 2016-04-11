	.file	"internal_in_string.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$32, %rsp
	movl	$20, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	-16(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
.L5:
	call	getchar
	movb	%al, -17(%rbp)
	cmpb	$10, -17(%rbp)
	je	.L2
	cmpb	$-1, -17(%rbp)
	je	.L2
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-17(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
	cmpb	$0, -17(%rbp)
	jne	.L3
	movl	$0, -12(%rbp)
	jmp	.L2
.L3:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jne	.L4
	addl	$20, -16(%rbp)
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, -8(%rbp)
	jmp	.L5
.L4:
	jmp	.L5
.L2:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup
	movq	%rax, -8(%rbp)
	## reset rsp
	addq 	$32, %rsp

	movl	$0, %eax
	leave
	ret

.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
