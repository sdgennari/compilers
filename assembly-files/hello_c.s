	.file	"hello_c.c"
	.section	.rodata
.LC0:
	.asciz	"hello c\n"
	.text

.globl Int..vtable
Int..vtable:		## vtable for Int
			.quad type_name_Int
			.quad Int..new

			## ========================================
.globl Int..new
Int..new:		## Constructor for Int
			pushq	%rbp
			movq	%rsp, %rbp
			## Allocate space for Int
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$1, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$Int..vtable, %rax
			movq	%rax, 16(%rbx)
			## Create default attrs
			## self[3] holds val (raw.Int)
			movl	$0, 24(%rbx)
			## Initialize attrs
			## Assign self register to %rax
			movq	%rbx, %rax
			leave
			ret

.globl type_name_Int 
type_name_Int:			## type_name string for Int
	.asciz "Int"

	.globl	main
	.type	main, @function
main:
.LFB0:
 			pushq	%rbp
 			movq	%rsp, %rbp
 			subq	$0, %rsp
 			## new const Int: 111
 			pushq	%rsi
 			pushq	%rdi
 			call	Int..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			movl	$111, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## new const Int: 222
 			pushq	%rsi
 			pushq	%rdi
 			call	Int..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			movl	$222, 24(%r8)
 			## assign
 			movq	%r8, %r10
 			## new const Int: 333
 			pushq	%rsi
 			pushq	%rdi
 			call	Int..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r9
 			movl	$333, 24(%r9)
 			## assign
 			movq	%r9, %r8
 			## assign
 			movq	%r10, %r9
 			## assign
 			movq	%r8, %r10
 			## unboxing value of %r9 into %r8d
 			movl	24(%r9), %r8d
 			## unboxing value of %r10 into %r9d
 			movl	24(%r10), %r9d
 			## plus
 			movl	%r8d, %r10d
 			addl	%r9d, %r10d
 			## boxing value of %r10d into %r8
 			pushq	%rsi
 			pushq	%rdi
 			call	Int..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			movl	%r10d, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## assign
 			movq	%r9, %r8
 			## return
 			movq	%r8, %rax
 			leave
 			ret
	
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
