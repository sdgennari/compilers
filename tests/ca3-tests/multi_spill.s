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

			movl	$0, %r10d

			## default Int

			movl	$0, %r13d

			## default Int

			movl	$0, %r11d

			## default Int

			movl	$0, %r12d

			movl	$0, %r8d

			## assign

			movl	%r8d, %r10d

			movl	$1, %r8d

			## assign

			movl	%r8d, %r13d

			movl	$2, %r8d

			## assign

			movl	%r8d, %r11d

			movl	$3, %r8d

			## assign

			movl	%r8d, %r12d

			## assign

			movl	%r10d, %r9d

			## assign

			movl	%r13d, %r10d

			## plus

			movl	%r9d, %r8d

			addl	%r10d, %r8d

			## assign

			movl	%r11d, %r10d

			## plus

			movl	%r8d, %r9d

			addl	%r10d, %r9d

			## assign

			movl	%r12d, %r10d

			## plus

			movl	%r9d, %r8d

			addl	%r10d, %r8d

			## assign

			movl	%r8d, %r9d

			## return

			movl	%r9d, %eax

			leave

			ret

