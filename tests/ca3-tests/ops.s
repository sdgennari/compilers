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

			## begin in_int

			subq	$4, %rsp

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			leaq	72(%rsp), %rsi

			movl	$.int_fmt_string, %edi

			movl	$0, %eax

			call	__isoc99_scanf

			popq	%r11

			popq	%r10

			popq	%r9

			popq	%r8

			popq	%rdi

			popq	%rsi

			popq	%rdx

			popq	%rcx

			popq	%rax

			movl	(%rsp), %r8d

			addq	$4, %rsp

			## end in_int

			## assign

			movl	%r8d, %r12d

			## begin in_int

			subq	$4, %rsp

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			leaq	72(%rsp), %rsi

			movl	$.int_fmt_string, %edi

			movl	$0, %eax

			call	__isoc99_scanf

			popq	%r11

			popq	%r10

			popq	%r9

			popq	%r8

			popq	%rdi

			popq	%rsi

			popq	%rdx

			popq	%rcx

			popq	%rax

			movl	(%rsp), %r8d

			addq	$4, %rsp

			## end in_int

			## assign

			movl	%r8d, %r10d

			## begin in_int

			subq	$4, %rsp

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			leaq	72(%rsp), %rsi

			movl	$.int_fmt_string, %edi

			movl	$0, %eax

			call	__isoc99_scanf

			popq	%r11

			popq	%r10

			popq	%r9

			popq	%r8

			popq	%rdi

			popq	%rsi

			popq	%rdx

			popq	%rcx

			popq	%rax

			movl	(%rsp), %r9d

			addq	$4, %rsp

			## end in_int

			## assign

			movl	%r9d, %r8d

			## begin in_int

			subq	$4, %rsp

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			leaq	72(%rsp), %rsi

			movl	$.int_fmt_string, %edi

			movl	$0, %eax

			call	__isoc99_scanf

			popq	%r11

			popq	%r10

			popq	%r9

			popq	%r8

			popq	%rdi

			popq	%rsi

			popq	%rdx

			popq	%rcx

			popq	%rax

			movl	(%rsp), %r8d

			addq	$4, %rsp

			## end in_int

			## assign

			movl	%r8d, %r13d

			## begin in_int

			subq	$4, %rsp

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			leaq	72(%rsp), %rsi

			movl	$.int_fmt_string, %edi

			movl	$0, %eax

			call	__isoc99_scanf

			popq	%r11

			popq	%r10

			popq	%r9

			popq	%r8

			popq	%rdi

			popq	%rsi

			popq	%rdx

			popq	%rcx

			popq	%rax

			movl	(%rsp), %r9d

			addq	$4, %rsp

			## end in_int

			## assign

			movl	%r9d, %r8d

			## assign

			movl	%r12d, %r11d

			## assign

			movl	%r10d, %r8d

			## plus

			movl	%r11d, %r9d

			addl	%r8d, %r9d

			## assign

			movl	%r12d, %r11d

			## assign

			movl	%r10d, %r8d

			## minus

			movl	%r11d, %r10d

			subl	%r8d, %r10d

			## mult

			movl	%r9d, %r8d

			imull	%r10d, %r8d

			## assign

			movl	%r13d, %r10d

			## divide

			subq	$8, %rsp

			pushq	%rdx

			pushq	%rax

			pushq	%rcx

			movl	%r10d, 24(%rsp)

			movl	%r8d, %eax

			cltd

			movl	24(%rsp), %ecx

			idivl	%ecx

			movl	%eax, 28(%rsp)

			popq	%rcx

			popq	%rax

			popq	%rdx

			movl	4(%rsp), %r9d

			addq	$8, %rsp

			## assign

			movl	%r9d, %r8d

			## assign

			movl	%r8d, %r9d

			## return

			movl	%r9d, %eax

			leave

			ret

