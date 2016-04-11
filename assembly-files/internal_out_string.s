	.file	"internal_out_string.c"
	.section	.rodata
.LC0:
	.string	"hello\t\tc\\n\\"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	$.LC0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L5:
	cmpb	$92, -14(%rbp)
	jne	.L3
	movl	-12(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -13(%rbp)
	cmpb	$110, -13(%rbp)
	jne	.L4
	movb	$10, -14(%rbp)
	addl	$1, -12(%rbp)
	jmp	.L3
.L4:
	cmpb	$116, -13(%rbp)
	jne	.L3
	movb	$9, -14(%rbp)
	addl	$1, -12(%rbp)
.L3:
	movsbl	-14(%rbp), %eax
	movl	%eax, %edi
	call	putchar
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -14(%rbp)
	cmpb	$0, -14(%rbp)
	jne	.L5
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
