	.file	"internal_in_int.c"
	.section	.rodata
.LC0:
	.string	"%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$32, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	-24(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
.L5:
	call	getchar
	movb	%al, -25(%rbp)
	cmpb	$10, -25(%rbp)
	je	.L2
	cmpb	$-1, -25(%rbp)
	je	.L2
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-25(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -20(%rbp)
	cmpb	$0, -25(%rbp)
	jne	.L3
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	.L4
	addl	$20, -24(%rbp)
	movl	-24(%rbp), %eax
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atol
	movq	%rax, -16(%rbp)
	cmpq	$2147483647, -16(%rbp)
	jle	.L6
	movq	$0, -16(%rbp)
	jmp	.L7
.L6:
	cmpq	$-2147483648, -16(%rbp)
	jge	.L7
	movq	$0, -16(%rbp)
.L7:
	movq	-16(%rbp), %rax

	# Call printf
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
