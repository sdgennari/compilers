	.file	"internal_substr.c"
	.section	.rodata
.LC0:
	.string	"hello c\n"
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
	movq	$.LC0, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$3, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	cool_str_substr
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC1:
	.string	"xyz"
	.text
	.globl	cool_str_substr
	.type	cool_str_substr, @function
cool_str_substr:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	cmpl	$0, -28(%rbp)
	js	.substr_L4
	movl	-32(%rbp), %eax
	movl	-28(%rbp), %edx
	addl	%edx, %eax
	movslq	%eax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jbe	.substr_L5
.substr_L4:
	// TODO HANDLE ERROR HERE
	movl	$.LC1, %eax
	// ----
.substr_L5:
	movl	-32(%rbp), %eax
	cltq
	movl	-28(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strndup
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.LFE1:
	.size	cool_str_substr, .-cool_str_substr
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
