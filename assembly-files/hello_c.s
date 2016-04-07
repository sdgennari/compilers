	.file	"hello_c.c"
	.section	.rodata
.LC0:
	.asciz	"hello c\n"
	.text

			## ========================================
.globl Bool..vtable
Bool..vtable:		## vtable for Bool
			.quad type_name_Bool
			.quad Bool..new
			## ========================================
.globl IO..vtable
IO..vtable:		## vtable for IO
			.quad type_name_IO
			.quad IO..new
			## ========================================
.globl Int..vtable
Int..vtable:		## vtable for Int
			.quad type_name_Int
			.quad Int..new
			## ========================================
.globl Main..vtable
Main..vtable:		## vtable for Main
			.quad type_name_Main
			.quad Main..new
			## ========================================
.globl Object..vtable
Object..vtable:		## vtable for Object
			.quad type_name_Object
			.quad Object..new
			## ========================================
.globl String..vtable
String..vtable:		## vtable for String
			.quad type_name_String
			.quad String..new

			## ::::::::::::::::::::::::::::::::::::::::
			##  CONSTRUCTORS
			## ::::::::::::::::::::::::::::::::::::::::

.globl Bool..new
Bool..new:		## Constructor for Bool
			pushq	%rbp
			movq	%rsp, %rbp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## Allocate space for Bool
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$0, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$Bool..vtable, %rax
			movq	%rax, 16(%rbx)
			## create default attrs
			## self[3] holds val (raw.Int)
			movl	$0, 24(%rbx)
			## initialize attrs
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

.globl IO..new
IO..new:		## Constructor for IO
			pushq	%rbp
			movq	%rsp, %rbp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## Allocate space for IO
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$2, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$IO..vtable, %rax
			movq	%rax, 16(%rbx)
			## create default attrs
			## initialize attrs
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

.globl Int..new
Int..new:		## Constructor for Int
			pushq	%rbp
			movq	%rsp, %rbp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
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
			## create default attrs
			## self[3] holds val (raw.Int)
			movl	$0, 24(%rbx)
			## initialize attrs
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

.globl Main..new
Main..new:		## Constructor for Main
			pushq	%rbp
			movq	%rsp, %rbp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## Allocate space for Main
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$5, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$Main..vtable, %rax
			movq	%rax, 16(%rbx)
			## create default attrs
			## initialize attrs
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

.globl Object..new
Object..new:		## Constructor for Object
			pushq	%rbp
			movq	%rsp, %rbp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## Allocate space for Object
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$3, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$Object..vtable, %rax
			movq	%rax, 16(%rbx)
			## create default attrs
			## initialize attrs
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

.globl String..new
String..new:		## Constructor for String
			pushq	%rbp
			movq	%rsp, %rbp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## Allocate space for String
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$4, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$String..vtable, %rax
			movq	%rax, 16(%rbx)
			## create default attrs
			## self[3] holds val (raw.String)
			movq	$empty.string, 24(%rbx)
			## initialize attrs
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

	.globl	main
	.type	main, @function
main:
.LFB0:
 			pushq	%rbp
 			movq	%rsp, %rbp
 			subq	$0, %rsp
 			## default Int
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r9
 			movq	$0, 24(%r9)
 			## default Int
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r12
 			movq	$0, 24(%r12)
 			## default Int
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r13
 			movq	$0, 24(%r13)
 			## default Bool
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Bool..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r11
 			movq	$0, 24(%r11)
 			## new const Int: 111
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movl	$111, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## new const Int: 222
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movl	$222, 24(%r8)
 			## assign
 			movq	%r8, %r12
 			## new const Int: 333
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movl	$333, 24(%r8)
 			## assign
 			movq	%r8, %r13
 			## assign
 			movq	%r12, %r8
 			## assign
 			movq	%r13, %r9
 			## unbox value of %r8 into %r10
 			movq	24(%r8), %r10
 			## unbox value of %r9 into %r14
 			movq	24(%r9), %r14
 			## plus
 			movl	%r10d, %r8d
 			addl	%r14d, %r8d
 			## box value of %r8 into %r10
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r10
 			movq	%r8, 24(%r10)
 			## assign
 			movq	%r10, %r9
 			## assign
 			movq	%r12, %r10
 			## assign
 			movq	%r13, %r9
 			## unbox value of %r10 into %r8
 			movq	24(%r10), %r8
 			## unbox value of %r9 into %r10
 			movq	24(%r9), %r10
 			## minus
 			movl	%r8d, %r9d
 			subl	%r10d, %r9d
 			## box value of %r9 into %r8
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movq	%r9, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## assign
 			movq	%r12, %r9
 			## assign
 			movq	%r13, %r8
 			## unbox value of %r9 into %r10
 			movq	24(%r9), %r10
 			## unbox value of %r8 into %r9
 			movq	24(%r8), %r9
 			## divide
 			subq	$8, %rsp
 			pushq	%rdx
 			pushq	%rax
 			pushq	%rcx
 			movl	%r9d, 24(%rsp)
 			movl	%r10d, %eax
 			cltd
 			movl	24(%rsp), %ecx
 			idivl	%ecx
 			movl	%eax, 28(%rsp)
 			popq	%rcx
 			popq	%rax
 			popq	%rdx
 			movl	4(%rsp), %r14d
 			addq	$8, %rsp
 			## box value of %r14 into %r8
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movq	%r14, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## assign
 			movq	%r12, %r8
 			## assign
 			movq	%r13, %r9
 			## unbox value of %r8 into %r10
 			movq	24(%r8), %r10
 			## unbox value of %r9 into %r8
 			movq	24(%r9), %r8
 			## mult
 			movl	%r10d, %r9d
 			imull	%r8d, %r9d
 			## box value of %r9 into %r8
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movq	%r9, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## assign
 			movq	%r9, %r10
 			## unbox value of %r10 into %r8
 			movq	24(%r10), %r8
 			## negate
 			movl	%r8d, %r9d
 			negl	%r9d
 			## box value of %r9 into %r8
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Int..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movq	%r9, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## assign
 			movq	%r11, %r9
 			## unbox value of %r9 into %r8
 			movq	24(%r9), %r8
 			## not
 			movl	%r8d, %r9d
 			xorl	$1, %r9d
 			## box value of %r9 into %r8
 			pushq	%rcx
 			pushq	%rdx
 			pushq	%rsi
 			pushq	%rdi
 			pushq	%r8
 			pushq	%r9
 			pushq	%r10
 			pushq	%r11
 			call	Bool..new
 			popq	%r11
 			popq	%r10
 			popq	%r9
 			popq	%r8
 			popq	%rdi
 			popq	%rsi
 			popq	%rdx
 			popq	%rcx
 			movq	%rax, %r8
 			movq	%r9, 24(%r8)
 			## assign
 			movq	%r8, %r11
 			## assign
 			movq	%r11, %r8
 			## return
 			movq	%r8, %rax
 			leave
 			ret

.globl type_name_Bool 
type_name_Bool:			## type_name string for Bool
	.asciz "Bool"

.globl type_name_IO 
type_name_IO:			## type_name string for IO
	.asciz "IO"

.globl type_name_Int 
type_name_Int:			## type_name string for Int
	.asciz "Int"

.globl type_name_Main 
type_name_Main:			## type_name string for Main
	.asciz "Main"

.globl type_name_Object 
type_name_Object:			## type_name string for Object
	.asciz "Object"

.globl type_name_String 
type_name_String:			## type_name string for String
	.asciz "String"

.globl empty.string
empty.string:			## empty string for default Strings
	.asciz ""

.globl string_1
string_1:
	.asciz "hello cool\n"

.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
