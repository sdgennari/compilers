			## ::::::::::::::::::::::::::::::::::::::::
			##  VTABLES
			## ::::::::::::::::::::::::::::::::::::::::

.globl Bool..vtable
Bool..vtable:		## vtable for Bool
			.quad type_name_Bool
			.quad Bool..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name

.globl IO..vtable
IO..vtable:		## vtable for IO
			.quad type_name_IO
			.quad IO..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad IO.in_int
			.quad IO.in_string
			.quad IO.out_int
			.quad IO.out_string

.globl Int..vtable
Int..vtable:		## vtable for Int
			.quad type_name_Int
			.quad Int..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name

.globl Main..vtable
Main..vtable:		## vtable for Main
			.quad type_name_Main
			.quad Main..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad Main.main

.globl Object..vtable
Object..vtable:		## vtable for Object
			.quad type_name_Object
			.quad Object..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name

.globl String..vtable
String..vtable:		## vtable for String
			.quad type_name_String
			.quad String..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad String.concat
			.quad String.length
			.quad String.substr


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
			pushq	%rbx
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
			popq	%rbx
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
			pushq	%rbx
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
			popq	%rbx
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
			pushq	%rbx
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
			popq	%rbx
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
			pushq	%rbx
			## Allocate space for Main
			movq	$8, %rsi
			movq	$5, %rdi
			call	calloc
			movq	%rax, %rbx
			## Store type_tag, obj_size, vtable
			movq	$5, %rax
			movq	%rax, 0(%rbx)
			movq	$5, %rax
			movq	%rax, 8(%rbx)
			movq	$Main..vtable, %rax
			movq	%rax, 16(%rbx)
			## create default attrs
			## self[3] holds x (Int)
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			call	Int..new
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, 24(%rbx)
			## self[4] holds y (Int)
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			call	Int..new
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, 32(%rbx)
			## initialize attrs
			## self[3] x <- init exp
			## Load self[4] (y) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r10
			## new const Int: 7
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			call	Int..new
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movl	$7, 24(%r8)
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			call	Int..new
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r9
			movq	%r8, 24(%r9)
			movq	%r9, 24(%rbx)
			## assign self register to %rax
			movq	%rbx, %rax
			## pop callee-saved regs
			popq	%rbx
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
			pushq	%rbx
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
			popq	%rbx
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
			pushq	%rbx
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
			popq	%rbx
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret


			## ::::::::::::::::::::::::::::::::::::::::
			##  METHOD IMPLEMENTATIONS
			## ::::::::::::::::::::::::::::::::::::::::

.globl IO.in_int
IO.in_int:
			call exit
.globl IO.in_string
IO.in_string:
			call exit
.globl IO.out_int
IO.out_int:
			call exit
.globl IO.out_string
IO.out_string:
			call exit
.globl Main.main
Main.main:
			pushq	%rbp
			movq	%rsp, %rbp
.Main_main_1:
			## new const Int: 0
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			call	Int..new
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movl	$0, 24(%r8)
			## return
			movq	%r8, %rax
			leave
			ret

.globl Object.abort
Object.abort:
			call exit
.globl Object.copy
Object.copy:
			call exit
.globl Object.type_name
Object.type_name:
			call exit
.globl String.concat
String.concat:
			call exit
.globl String.length
String.length:
			call exit
.globl String.substr
String.substr:
			call exit

			## ::::::::::::::::::::::::::::::::::::::::
			##  PROGRAM START
			## ::::::::::::::::::::::::::::::::::::::::

			.globl main
			.type main, @function
main:
			call	Main..new
			movq	%rax, %rbx
			call	Main.main
			movq	$0, %rax
			call	exit

			## ::::::::::::::::::::::::::::::::::::::::
			##  CONSTANT STRINGS
			## ::::::::::::::::::::::::::::::::::::::::

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


