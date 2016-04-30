	.file	"internal_in_string.c"
	.text
	.globl	cool_io_in_str
	.type	cool_io_in_str, @function
cool_io_in_str:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$20, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	-16(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
.L8:
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
	jmp	.L4
.L6:
	call	getchar
	movb	%al, -17(%rbp)
.L4:
	cmpb	$10, -17(%rbp)
	je	.L5
	cmpb	$-1, -17(%rbp)
	jne	.L6
.L5:
	jmp	.L2
.L3:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jne	.L7
	addl	$20, -16(%rbp)
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, -8(%rbp)
	jmp	.L8
.L7:
	jmp	.L8
.L2:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	cool_io_in_str, .-cool_io_in_str
	.section	.rodata
.LC0:
	.string	"strlen: %lu\n"
.LC1:
	.string	"str: \"%s\"\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %eax
	call	cool_io_in_str
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	cool_io_in_str
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
