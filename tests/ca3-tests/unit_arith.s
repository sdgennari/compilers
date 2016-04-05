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

			## default Int

			movl	$0, %r13d

			## default Int

			movl	$0, %r11d

			## default Int

			movl	$0, %r12d

			## default Int

			movl	$0, %r8d

			movl	$7, %r8d

			## assign

			movl	%r8d, %r11d

			movl	$3, %r8d

			## assign

			movl	%r8d, %r12d

			## assign

			movl	%r11d, %r9d

			## assign

			movl	%r12d, %r10d

			## plus

			movl	%r9d, %r8d

			addl	%r10d, %r8d

			## assign

			movl	%r8d, %r13d

			## assign

			movl	%r13d, %r8d

			## begin out_int

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

			## end out_int

			## assign

			movl	%r11d, %r10d

			## assign

			movl	%r12d, %r8d

			## minus

			movl	%r10d, %r9d

			subl	%r8d, %r9d

			## assign

			movl	%r9d, %r8d

			## assign

			movl	%r8d, %r9d

			## begin out_int

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			movl	%r9d, %esi

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

			## end out_int

			## assign

			movl	%r11d, %r8d

			## assign

			movl	%r12d, %r10d

			## mult

			movl	%r8d, %r9d

			imull	%r10d, %r9d

			## assign

			movl	%r9d, %r13d

			## assign

			movl	%r13d, %r9d

			## begin out_int

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			movl	%r9d, %esi

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

			## end out_int

			## assign

			movl	%r13d, %r10d

			## assign

			movl	%r11d, %r8d

			## divide

			subq	$8, %rsp

			pushq	%rdx

			pushq	%rax

			pushq	%rcx

			movl	%r8d, 24(%rsp)

			movl	%r10d, %eax

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

			## begin out_int

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			movl	%r9d, %esi

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

			## end out_int

			## assign

			movl	%r11d, %r9d

			## negate

			movl	%r9d, %r8d

			negl	%r8d

			## assign

			movl	%r8d, %r11d

			## assign

			movl	%r11d, %r9d

			## begin out_int

			pushq	%rax

			pushq	%rcx

			pushq	%rdx

			pushq	%rsi

			pushq	%rdi

			pushq	%r8

			pushq	%r9

			pushq	%r10

			pushq	%r11

			movl	%r9d, %esi

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

			## end out_int

			## assign

			movl	%r8d, %r9d

			## return

			movl	%r9d, %eax

			leave

			ret

