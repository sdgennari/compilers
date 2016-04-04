	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp

	movq	$8, %rsi		# 8 bytes per field
	movq	$4, %rdi		# 4 fields (3 standard + 1 attr)
	call	calloc 			# pointer to space now in RAX

	movq	$111, (%rax)
	movq	$222, 8(%rax)
	movq	$333, 16(%rax)
	movq	$777, 24(%rax)
	
	leave
	ret
