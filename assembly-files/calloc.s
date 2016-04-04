	.file	"calloc.c"
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
	movl	$4, -24(%rbp)
	movl	$30583, -20(%rbp)
	movl	$1, -16(%rbp)
	movl	$777, -12(%rbp)
	movl	-24(%rbp), %eax
	cltq
	movl	$8, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	12(%rax), %rdx
	movl	-12(%rbp), %eax
	movl	%eax, (%rdx)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
