	.section	.rodata
.int_fmt_string:
	.string "%d"
	.text
.globl	main
	.type	main, @function
main:
.Main_main_1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
	movl	$7, %r8d
	movl	%r8d, %r10d
	movl	$3, %r8d
	movl	%r8d, %r11d
	cmpl	%r11d, %r10d
	movl	$1, %r8d
	jl	.asm_label_1
	movl	$0, %r8d
.asm_label_1:
	movl	%r8d, %r9d
	xorl	$1, %r9d
	test	%r8d, %r8d
	jnz	.if_then_2
	test	%r9d, %r9d
	jnz	.if_else_2
.if_then_2:
	movl	$1, %r8d
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	jmp	.if_exit_2
.if_else_2:
	movl	$0, %r8d
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	jmp	.if_exit_2
.if_exit_2:
	cmpl	%r11d, %r10d
	movl	$1, %r8d
	jle	.asm_label_2
	movl	$0, %r8d
.asm_label_2:
	movl	%r8d, %r9d
	xorl	$1, %r9d
	test	%r8d, %r8d
	jnz	.if_then_3
	test	%r9d, %r9d
	jnz	.if_else_3
.if_then_3:
	movl	$1, %r8d
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	jmp	.if_exit_3
.if_else_3:
	movl	$0, %r8d
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	jmp	.if_exit_3
.if_exit_3:
	cmpl	%r11d, %r10d
	movl	$1, %r8d
	je	.asm_label_3
	movl	$0, %r8d
.asm_label_3:
	movl	%r8d, %r9d
	xorl	$1, %r9d
	test	%r8d, %r8d
	jnz	.if_then_4
	test	%r9d, %r9d
	jnz	.if_else_4
.if_then_4:
	movl	$1, %r8d
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	movl	%r8d, %r8d
	jmp	.if_exit_4
.if_else_4:
	movl	$0, %r8d
	# begin out_int
	pushq	%rax
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	pushq	%rdi
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	%r8d, %esi
	movl	$.int_fmt_string, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%rax
	# end out_int
	movl	%r8d, %r8d
	jmp	.if_exit_4
.if_exit_4:
	movl	%r8d, %eax
	leave
	ret
