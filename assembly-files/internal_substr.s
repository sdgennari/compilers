	.file	"internal_substr.c"
	.text
	.p2align 4,,15
	.globl	substr
	.type	substr, @function
substr:
.LFB49:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%esi, %rax
	movslq	%edx, %rsi
	addq	%rax, %rdi
	call	strndup
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	puts
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE49:
	.size	substr, .-substr
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hello c\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB48:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$3, %edx
	movl	$2, %esi
	movl	$.LC0, %edi
	call	substr
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE48:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
