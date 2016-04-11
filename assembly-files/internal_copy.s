	.file	"internal_copy.c"
	.comm	person,44,32
	.comm	person_copy,44,32
	.section	.rodata
.LC0:
	.string	"Name here"
.LC1:
	.string	"%ld\n"
.LC2:
	.string	"%s %d\n"
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$person, %edi
	call	memcpy
	movl	$77, person+40(%rip)
	movq	person(%rip), %rax
	movq	%rax, person_copy(%rip)
	movq	person+8(%rip), %rax
	movq	%rax, person_copy+8(%rip)
	movq	person+16(%rip), %rax
	movq	%rax, person_copy+16(%rip)
	movq	person+24(%rip), %rax
	movq	%rax, person_copy+24(%rip)
	movq	person+32(%rip), %rax
	movq	%rax, person_copy+32(%rip)
	movl	person+40(%rip), %eax
	movl	%eax, person_copy+40(%rip)
	movl	$88, person+40(%rip)
	movl	$44, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	person+40(%rip), %eax
	movl	%eax, %edx
	movl	$person, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	person_copy+40(%rip), %eax
	movl	%eax, %edx
	movl	$person_copy, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
