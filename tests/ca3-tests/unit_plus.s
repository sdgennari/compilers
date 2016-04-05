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

			movl	$1, %r8d

			## assign

			movl	%r8d, %r11d

			movl	$2, %r9d

			## assign

			movl	%r9d, %r8d

			## default Int

			movl	$0, %r10d

			## assign

			movl	%r11d, %r10d

			## assign

			movl	%r8d, %r9d

			## plus

			movl	%r10d, %r8d

			addl	%r9d, %r8d

			## assign

			movl	%r8d, %r10d

			## assign

			movl	%r10d, %r9d

			## assign

			movl	%r11d, %r10d

			## plus

			movl	%r9d, %r8d

			addl	%r10d, %r8d

			## assign

			movl	%r8d, %r9d

			## return

			movl	%r9d, %eax

			leave

			ret

