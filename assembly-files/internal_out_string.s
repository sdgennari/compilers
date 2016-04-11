	.file	"internal_out_string.c"
	.text
	.globl	raw_out_string
	.type	raw_out_string, @function
raw_out_string:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	cmpb	$92, -6(%rbp)
	jne	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -5(%rbp)
	cmpb	$110, -5(%rbp)
	jne	.L4
	movb	$10, -6(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L3
.L4:
	cmpb	$116, -5(%rbp)
	jne	.L3
	movb	$9, -6(%rbp)
	addl	$1, -4(%rbp)
.L3:
	movsbl	-6(%rbp), %eax
	movl	%eax, %edi
	call	putchar
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -6(%rbp)
	cmpb	$0, -6(%rbp)
	jne	.L5
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	raw_out_string, .-raw_out_string
	.section	.rodata
.LC0:
	.string	"hello\t\tc\\\\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	$.LC0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	raw_out_string
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
