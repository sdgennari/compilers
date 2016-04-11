	.file	"strcmp.c"
	.section	.rodata
.LC0:
	.string	"aaa"
.LC1:
	.string	"aaa"
.LC2:
	.string	"%d\n"
	.text

.globl cmp_true
cmp_true:
	movl	$1, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp		cmp_end

cmp_false:
	movl	$0, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp		cmp_end

	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp

	movq	$.LC0, -16(%rbp)
	movq	$.LC1, -8(%rbp)

	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax

	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp

	# Compare rax < 0
	cmpl 	$0, %eax
	je 	cmp_true
	jmp 	cmp_false
	
cmp_end:
	movl	$0, %eax
	leave
	ret
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
