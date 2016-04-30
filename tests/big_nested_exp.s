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
			.quad IO.in_int
			.quad IO.in_string
			.quad IO.out_int
			.quad IO.out_string
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
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for Bool (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$0, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$Bool..vtable, %rax
			movq	%rax, 16(%rbx)
			## default raw.Int
			movq	$0, %r8
			## store %r8 in self[3] (val)
			movq	%r8, 24(%rbx)
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			## assign self register to %rax for return
			movq	%rbx, %rax
			leave
			ret

.globl IO..new
IO..new:		## Constructor for IO
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for IO (size: 3)
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$2, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$IO..vtable, %rax
			movq	%rax, 16(%rbx)
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			## assign self register to %rax for return
			movq	%rbx, %rax
			leave
			ret

.globl Int..new
Int..new:		## Constructor for Int
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for Int (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$1, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$Int..vtable, %rax
			movq	%rax, 16(%rbx)
			## default raw.Int
			movq	$0, %r8
			## store %r8 in self[3] (val)
			movq	%r8, 24(%rbx)
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			## assign self register to %rax for return
			movq	%rbx, %rax
			leave
			ret

.globl Main..new
Main..new:		## Constructor for Main
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for Main (size: 3)
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$5, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$Main..vtable, %rax
			movq	%rax, 16(%rbx)
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			## assign self register to %rax for return
			movq	%rbx, %rax
			leave
			ret

.globl Object..new
Object..new:		## Constructor for Object
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for Object (size: 3)
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$3, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$Object..vtable, %rax
			movq	%rax, 16(%rbx)
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			## assign self register to %rax for return
			movq	%rbx, %rax
			leave
			ret

.globl String..new
String..new:		## Constructor for String
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for String (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$4, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$String..vtable, %rax
			movq	%rax, 16(%rbx)
			## default raw.String
			movq	$empty.string, %r8
			## store %r8 in self[3] (val)
			movq	%r8, 24(%rbx)
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			## assign self register to %rax for return
			movq	%rbx, %rax
			leave
			ret

			## ::::::::::::::::::::::::::::::::::::::::
			##  METHOD IMPLEMENTATIONS
			## ::::::::::::::::::::::::::::::::::::::::

.globl IO.in_int
IO.in_int:
			pushq	%rbp
			movq	%rsp, %rbp
			## use generated function to read int
			subq	$32, %rsp
			movl	$32, -24(%rbp)
			movl	$0, -20(%rbp)
			movl	-24(%rbp), %eax
			cltq
			movq	%rax, %rdi
			call	malloc
			movq	%rax, -8(%rbp)
.in_int_5:
			call	getchar
			movb	%al, -25(%rbp)
			cmpb	$10, -25(%rbp)
			je	.in_int_2
			cmpb	$-1, -25(%rbp)
			je	.in_int_2
			movl	-20(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			addq	%rax, %rdx
			movzbl	-25(%rbp), %eax
			movb	%al, (%rdx)
			addl	$1, -20(%rbp)
			cmpb	$0, -25(%rbp)
			jne	.in_int_3
			movl	$0, -20(%rbp)
			jmp	.in_int_2
.in_int_3:
			movl	-20(%rbp), %eax
			cmpl	-24(%rbp), %eax
			jne	.in_int_4
			addl	$20, -24(%rbp)
			movl	-24(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	realloc
			movq	%rax, -8(%rbp)
			jmp	.in_int_5
.in_int_4:
			jmp	.in_int_5
.in_int_2:
			movq	-8(%rbp), %rax
			movq	%rax, %rdi
			call	atol
			movq	%rax, -16(%rbp)
			cmpq	$2147483647, -16(%rbp)
			jle	.in_int_6
			movq	$0, -16(%rbp)
			jmp	.in_int_7
.in_int_6:
			cmpq	$-2147483648, -16(%rbp)
			jge	.in_int_7
			movq	$0, -16(%rbp)
.in_int_7:
			movq	-16(%rbp), %r8

			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rax
			## move result into boxed Int
			movq	%r8, 24(%rax)
			leave
			ret

.globl IO.in_string
IO.in_string:
			pushq	%rbp
			movq	%rsp, %rbp
			## call in_string helper method
			call	raw_in_string
			## make new box to store result (moved into r8 temporarily)
			movq	%rax, %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	String..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rax
			movq	%r8, 24(%rax)
			leave
			ret

.globl IO.out_int
IO.out_int:
			pushq	%rbp
			movq	%rsp, %rbp
			## loading param [0] into %rax
			movq	16(%rbp), %rax
			## setup and call printf
			movl	24(%rax), %esi
			movq	$out_int_format_str, %rdi
			movl	$0, %eax
			call	printf
			## set self ptr as return type
			movq	%rbx, %rax
			leave
			ret

.globl IO.out_string
IO.out_string:
			pushq	%rbp
			movq	%rsp, %rbp
			## loading param [0] into %rax
			movq	16(%rbp), %rax
			## unboxing param [0] (in %rax) into %rdi for call to raw_out_string
			movq	24(%rax), %rdi
			call	raw_out_string
			## move self ptr into %rax for return
			movq	%rbx, %rax
			leave
			ret

.globl Main.main
Main.main:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 390 spilled regs
			subq	$3120, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## store
			movq	%r8, -8(%rbp)
			## new const Int: 1
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$1, 24(%r8)
			## store
			movq	%r8, -16(%rbp)
			## new const Int: 2
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$2, 24(%r8)
			## store
			movq	%r8, -24(%rbp)
			## new const Int: 3
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$3, 24(%r8)
			## store
			movq	%r8, -32(%rbp)
			## new const Int: 4
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$4, 24(%r10)
			## store
			movq	%r10, -40(%rbp)
			## new const Int: 5
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$5, 24(%r8)
			## store
			movq	%r8, -48(%rbp)
			## new const Int: 6
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$6, 24(%r9)
			## store
			movq	%r9, -56(%rbp)
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## store
			movq	%r8, -64(%rbp)
			## new const Int: 8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$8, 24(%r8)
			## store
			movq	%r8, -72(%rbp)
			## new const Int: 9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$9, 24(%r10)
			## store
			movq	%r10, -80(%rbp)
			## new const Int: 10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$10, 24(%r9)
			## store
			movq	%r9, -88(%rbp)
			## new const Int: 11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$11, 24(%r8)
			## store
			movq	%r8, -96(%rbp)
			## new const Int: 12
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$12, 24(%r9)
			## store
			movq	%r9, -104(%rbp)
			## new const Int: 13
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$13, 24(%r8)
			## store
			movq	%r8, -112(%rbp)
			## new const Int: 14
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$14, 24(%r8)
			## store
			movq	%r8, -120(%rbp)
			## new const Int: 15
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$15, 24(%r8)
			## store
			movq	%r8, -128(%rbp)
			## new const Int: 16
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$16, 24(%r8)
			## store
			movq	%r8, -136(%rbp)
			## new const Int: 17
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$17, 24(%r8)
			## store
			movq	%r8, -144(%rbp)
			## new const Int: 18
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$18, 24(%r8)
			## store
			movq	%r8, -152(%rbp)
			## new const Int: 19
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$19, 24(%r8)
			## store
			movq	%r8, -160(%rbp)
			## new const Int: 20
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$20, 24(%r8)
			## store
			movq	%r8, -168(%rbp)
			## new const Int: 21
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$21, 24(%r8)
			## store
			movq	%r8, -176(%rbp)
			## new const Int: 22
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$22, 24(%r8)
			## store
			movq	%r8, -184(%rbp)
			## new const Int: 23
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$23, 24(%r8)
			## store
			movq	%r8, -192(%rbp)
			## new const Int: 24
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$24, 24(%r8)
			## store
			movq	%r8, -200(%rbp)
			## new const Int: 25
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$25, 24(%r8)
			## store
			movq	%r8, -208(%rbp)
			## new const Int: 26
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$26, 24(%r8)
			## store
			movq	%r8, -216(%rbp)
			## new const Int: 27
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$27, 24(%r8)
			## store
			movq	%r8, -224(%rbp)
			## new const Int: 28
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$28, 24(%r9)
			## store
			movq	%r9, -232(%rbp)
			## new const Int: 29
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$29, 24(%r9)
			## store
			movq	%r9, -240(%rbp)
			## new const Int: 30
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$30, 24(%r9)
			## store
			movq	%r9, -248(%rbp)
			## new const Int: 31
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$31, 24(%r9)
			## store
			movq	%r9, -256(%rbp)
			## new const Int: 32
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$32, 24(%r9)
			## store
			movq	%r9, -264(%rbp)
			## new const Int: 33
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$33, 24(%r9)
			## store
			movq	%r9, -272(%rbp)
			## new const Int: 34
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$34, 24(%r8)
			## store
			movq	%r8, -280(%rbp)
			## new const Int: 35
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$35, 24(%r9)
			## store
			movq	%r9, -288(%rbp)
			## new const Int: 36
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$36, 24(%r8)
			## store
			movq	%r8, -296(%rbp)
			## new const Int: 37
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$37, 24(%r8)
			## store
			movq	%r8, -304(%rbp)
			## new const Int: 38
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$38, 24(%r10)
			## store
			movq	%r10, -312(%rbp)
			## new const Int: 39
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$39, 24(%r9)
			## store
			movq	%r9, -320(%rbp)
			## new const Int: 40
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$40, 24(%r8)
			## store
			movq	%r8, -328(%rbp)
			## new const Int: 41
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$41, 24(%r9)
			## store
			movq	%r9, -336(%rbp)
			## new const Int: 42
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$42, 24(%r8)
			## store
			movq	%r8, -344(%rbp)
			## new const Int: 43
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$43, 24(%r9)
			## store
			movq	%r9, -352(%rbp)
			## new const Int: 44
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$44, 24(%r8)
			## store
			movq	%r8, -360(%rbp)
			## new const Int: 45
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$45, 24(%r8)
			## store
			movq	%r8, -368(%rbp)
			## new const Int: 46
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$46, 24(%r9)
			## store
			movq	%r9, -376(%rbp)
			## new const Int: 47
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$47, 24(%r9)
			## store
			movq	%r9, -384(%rbp)
			## new const Int: 48
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$48, 24(%r9)
			## store
			movq	%r9, -392(%rbp)
			## new const Int: 49
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$49, 24(%r9)
			## store
			movq	%r9, -400(%rbp)
			## new const Int: 50
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$50, 24(%r9)
			## store
			movq	%r9, -408(%rbp)
			## new const Int: 51
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$51, 24(%r8)
			## store
			movq	%r8, -416(%rbp)
			## new const Int: 52
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$52, 24(%r8)
			## store
			movq	%r8, -424(%rbp)
			## new const Int: 53
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$53, 24(%r8)
			## store
			movq	%r8, -432(%rbp)
			## new const Int: 54
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$54, 24(%r8)
			## store
			movq	%r8, -440(%rbp)
			## new const Int: 55
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$55, 24(%r8)
			## store
			movq	%r8, -448(%rbp)
			## new const Int: 56
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$56, 24(%r9)
			## store
			movq	%r9, -456(%rbp)
			## new const Int: 57
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$57, 24(%r10)
			## store
			movq	%r10, -464(%rbp)
			## new const Int: 58
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$58, 24(%r8)
			## store
			movq	%r8, -472(%rbp)
			## new const Int: 59
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$59, 24(%r8)
			## store
			movq	%r8, -480(%rbp)
			## new const Int: 60
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$60, 24(%r8)
			## store
			movq	%r8, -488(%rbp)
			## new const Int: 61
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$61, 24(%r8)
			## store
			movq	%r8, -496(%rbp)
			## new const Int: 62
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$62, 24(%r8)
			## store
			movq	%r8, -504(%rbp)
			## new const Int: 63
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$63, 24(%r10)
			## store
			movq	%r10, -512(%rbp)
			## new const Int: 64
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$64, 24(%r9)
			## store
			movq	%r9, -520(%rbp)
			## new const Int: 65
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$65, 24(%r8)
			## store
			movq	%r8, -528(%rbp)
			## new const Int: 66
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$66, 24(%r9)
			## store
			movq	%r9, -536(%rbp)
			## new const Int: 67
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$67, 24(%r9)
			## store
			movq	%r9, -544(%rbp)
			## new const Int: 68
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$68, 24(%r9)
			## store
			movq	%r9, -552(%rbp)
			## new const Int: 69
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$69, 24(%r10)
			## store
			movq	%r10, -560(%rbp)
			## new const Int: 70
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$70, 24(%r8)
			## store
			movq	%r8, -568(%rbp)
			## new const Int: 71
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$71, 24(%r8)
			## store
			movq	%r8, -576(%rbp)
			## new const Int: 72
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$72, 24(%r8)
			## store
			movq	%r8, -584(%rbp)
			## new const Int: 73
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$73, 24(%r8)
			## store
			movq	%r8, -592(%rbp)
			## new const Int: 74
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$74, 24(%r8)
			## store
			movq	%r8, -600(%rbp)
			## new const Int: 75
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$75, 24(%r8)
			## store
			movq	%r8, -608(%rbp)
			## new const Int: 76
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$76, 24(%r8)
			## store
			movq	%r8, -616(%rbp)
			## new const Int: 77
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$77, 24(%r8)
			## store
			movq	%r8, -624(%rbp)
			## new const Int: 78
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$78, 24(%r9)
			## store
			movq	%r9, -632(%rbp)
			## new const Int: 79
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$79, 24(%r8)
			## store
			movq	%r8, -640(%rbp)
			## new const Int: 80
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$80, 24(%r9)
			## store
			movq	%r9, -648(%rbp)
			## new const Int: 81
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$81, 24(%r10)
			## store
			movq	%r10, -656(%rbp)
			## new const Int: 82
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$82, 24(%r8)
			## store
			movq	%r8, -664(%rbp)
			## new const Int: 83
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$83, 24(%r10)
			## store
			movq	%r10, -672(%rbp)
			## new const Int: 84
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$84, 24(%r9)
			## store
			movq	%r9, -680(%rbp)
			## new const Int: 85
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$85, 24(%r9)
			## store
			movq	%r9, -688(%rbp)
			## new const Int: 86
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$86, 24(%r9)
			## store
			movq	%r9, -696(%rbp)
			## new const Int: 87
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$87, 24(%r8)
			## store
			movq	%r8, -704(%rbp)
			## new const Int: 88
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$88, 24(%r9)
			## store
			movq	%r9, -712(%rbp)
			## new const Int: 89
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$89, 24(%r8)
			## store
			movq	%r8, -720(%rbp)
			## new const Int: 90
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$90, 24(%r8)
			## store
			movq	%r8, -728(%rbp)
			## new const Int: 91
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$91, 24(%r8)
			## store
			movq	%r8, -736(%rbp)
			## new const Int: 92
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$92, 24(%r8)
			## store
			movq	%r8, -744(%rbp)
			## new const Int: 93
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$93, 24(%r8)
			## store
			movq	%r8, -752(%rbp)
			## new const Int: 94
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$94, 24(%r8)
			## store
			movq	%r8, -760(%rbp)
			## new const Int: 95
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$95, 24(%r9)
			## store
			movq	%r9, -768(%rbp)
			## new const Int: 96
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$96, 24(%r9)
			## store
			movq	%r9, -776(%rbp)
			## new const Int: 97
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$97, 24(%r10)
			## store
			movq	%r10, -784(%rbp)
			## new const Int: 98
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$98, 24(%r8)
			## store
			movq	%r8, -792(%rbp)
			## new const Int: 99
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$99, 24(%r9)
			## store
			movq	%r9, -800(%rbp)
			## new const Int: 100
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$100, 24(%r8)
			## store
			movq	%r8, -808(%rbp)
			## new const Int: 101
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$101, 24(%r10)
			## store
			movq	%r10, -816(%rbp)
			## new const Int: 102
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$102, 24(%r8)
			## store
			movq	%r8, -824(%rbp)
			## new const Int: 103
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$103, 24(%r8)
			## store
			movq	%r8, -832(%rbp)
			## new const Int: 104
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$104, 24(%r8)
			## store
			movq	%r8, -840(%rbp)
			## new const Int: 105
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$105, 24(%r8)
			## store
			movq	%r8, -848(%rbp)
			## new const Int: 106
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$106, 24(%r8)
			## store
			movq	%r8, -856(%rbp)
			## new const Int: 107
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$107, 24(%r9)
			## store
			movq	%r9, -864(%rbp)
			## new const Int: 108
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$108, 24(%r9)
			## store
			movq	%r9, -872(%rbp)
			## new const Int: 109
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$109, 24(%r9)
			## store
			movq	%r9, -880(%rbp)
			## new const Int: 110
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$110, 24(%r8)
			## store
			movq	%r8, -888(%rbp)
			## new const Int: 111
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$111, 24(%r8)
			## store
			movq	%r8, -896(%rbp)
			## new const Int: 112
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$112, 24(%r10)
			## store
			movq	%r10, -904(%rbp)
			## new const Int: 113
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$113, 24(%r10)
			## store
			movq	%r10, -912(%rbp)
			## new const Int: 114
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$114, 24(%r9)
			## store
			movq	%r9, -920(%rbp)
			## new const Int: 115
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$115, 24(%r8)
			## store
			movq	%r8, -928(%rbp)
			## new const Int: 116
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$116, 24(%r10)
			## store
			movq	%r10, -936(%rbp)
			## new const Int: 117
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$117, 24(%r8)
			## store
			movq	%r8, -944(%rbp)
			## new const Int: 118
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$118, 24(%r9)
			## store
			movq	%r9, -952(%rbp)
			## new const Int: 119
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$119, 24(%r9)
			## store
			movq	%r9, -960(%rbp)
			## new const Int: 120
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$120, 24(%r9)
			## store
			movq	%r9, -968(%rbp)
			## new const Int: 121
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$121, 24(%r8)
			## store
			movq	%r8, -976(%rbp)
			## new const Int: 122
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$122, 24(%r8)
			## store
			movq	%r8, -984(%rbp)
			## new const Int: 123
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$123, 24(%r8)
			## store
			movq	%r8, -992(%rbp)
			## new const Int: 124
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$124, 24(%r8)
			## store
			movq	%r8, -1000(%rbp)
			## new const Int: 125
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$125, 24(%r8)
			## store
			movq	%r8, -1008(%rbp)
			## new const Int: 126
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$126, 24(%r8)
			## store
			movq	%r8, -1016(%rbp)
			## new const Int: 127
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$127, 24(%r8)
			## store
			movq	%r8, -1024(%rbp)
			## new const Int: 128
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$128, 24(%r8)
			## store
			movq	%r8, -1032(%rbp)
			## new const Int: 129
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$129, 24(%r9)
			## store
			movq	%r9, -1040(%rbp)
			## new const Int: 130
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$130, 24(%r9)
			## store
			movq	%r9, -1048(%rbp)
			## new const Int: 131
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$131, 24(%r8)
			## store
			movq	%r8, -1056(%rbp)
			## new const Int: 132
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$132, 24(%r8)
			## store
			movq	%r8, -1064(%rbp)
			## new const Int: 133
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$133, 24(%r8)
			## store
			movq	%r8, -1072(%rbp)
			## new const Int: 134
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$134, 24(%r8)
			## store
			movq	%r8, -1080(%rbp)
			## new const Int: 135
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$135, 24(%r8)
			## store
			movq	%r8, -1088(%rbp)
			## new const Int: 136
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$136, 24(%r8)
			## store
			movq	%r8, -1096(%rbp)
			## new const Int: 137
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$137, 24(%r8)
			## store
			movq	%r8, -1104(%rbp)
			## new const Int: 138
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$138, 24(%r9)
			## store
			movq	%r9, -1112(%rbp)
			## new const Int: 139
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$139, 24(%r9)
			## store
			movq	%r9, -1120(%rbp)
			## new const Int: 140
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$140, 24(%r8)
			## store
			movq	%r8, -1128(%rbp)
			## new const Int: 141
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$141, 24(%r9)
			## store
			movq	%r9, -1136(%rbp)
			## new const Int: 142
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$142, 24(%r8)
			## store
			movq	%r8, -1144(%rbp)
			## new const Int: 143
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$143, 24(%r8)
			## store
			movq	%r8, -1152(%rbp)
			## new const Int: 144
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$144, 24(%r8)
			## store
			movq	%r8, -1160(%rbp)
			## new const Int: 145
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$145, 24(%r8)
			## store
			movq	%r8, -1168(%rbp)
			## new const Int: 146
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$146, 24(%r9)
			## store
			movq	%r9, -1176(%rbp)
			## new const Int: 147
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$147, 24(%r8)
			## store
			movq	%r8, -1184(%rbp)
			## new const Int: 148
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$148, 24(%r10)
			## store
			movq	%r10, -1192(%rbp)
			## new const Int: 149
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$149, 24(%r8)
			## store
			movq	%r8, -1200(%rbp)
			## new const Int: 150
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$150, 24(%r9)
			## store
			movq	%r9, -1208(%rbp)
			## new const Int: 151
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$151, 24(%r9)
			## store
			movq	%r9, -1216(%rbp)
			## new const Int: 152
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$152, 24(%r8)
			## store
			movq	%r8, -1224(%rbp)
			## new const Int: 153
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$153, 24(%r10)
			## store
			movq	%r10, -1232(%rbp)
			## new const Int: 154
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$154, 24(%r9)
			## store
			movq	%r9, -1240(%rbp)
			## new const Int: 155
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$155, 24(%r9)
			## store
			movq	%r9, -1248(%rbp)
			## new const Int: 156
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$156, 24(%r8)
			## store
			movq	%r8, -1256(%rbp)
			## new const Int: 157
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$157, 24(%r8)
			## store
			movq	%r8, -1264(%rbp)
			## new const Int: 158
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$158, 24(%r8)
			## store
			movq	%r8, -1272(%rbp)
			## new const Int: 159
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$159, 24(%r9)
			## store
			movq	%r9, -1280(%rbp)
			## new const Int: 160
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$160, 24(%r8)
			## store
			movq	%r8, -1288(%rbp)
			## new const Int: 161
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$161, 24(%r8)
			## store
			movq	%r8, -1296(%rbp)
			## new const Int: 162
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$162, 24(%r8)
			## store
			movq	%r8, -1304(%rbp)
			## new const Int: 163
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$163, 24(%r9)
			## store
			movq	%r9, -1312(%rbp)
			## new const Int: 164
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$164, 24(%r8)
			## store
			movq	%r8, -1320(%rbp)
			## new const Int: 165
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$165, 24(%r9)
			## store
			movq	%r9, -1328(%rbp)
			## new const Int: 166
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$166, 24(%r10)
			## store
			movq	%r10, -1336(%rbp)
			## new const Int: 167
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$167, 24(%r9)
			## store
			movq	%r9, -1344(%rbp)
			## new const Int: 168
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$168, 24(%r8)
			## store
			movq	%r8, -1352(%rbp)
			## new const Int: 169
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$169, 24(%r8)
			## store
			movq	%r8, -1360(%rbp)
			## new const Int: 170
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$170, 24(%r8)
			## store
			movq	%r8, -1368(%rbp)
			## new const Int: 171
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$171, 24(%r8)
			## store
			movq	%r8, -1376(%rbp)
			## new const Int: 172
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$172, 24(%r8)
			## store
			movq	%r8, -1384(%rbp)
			## new const Int: 173
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$173, 24(%r9)
			## store
			movq	%r9, -1392(%rbp)
			## new const Int: 174
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$174, 24(%r9)
			## store
			movq	%r9, -1400(%rbp)
			## new const Int: 175
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$175, 24(%r8)
			## store
			movq	%r8, -1408(%rbp)
			## new const Int: 176
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$176, 24(%r9)
			## store
			movq	%r9, -1416(%rbp)
			## new const Int: 177
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$177, 24(%r8)
			## store
			movq	%r8, -1424(%rbp)
			## new const Int: 178
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$178, 24(%r8)
			## store
			movq	%r8, -1432(%rbp)
			## new const Int: 179
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$179, 24(%r8)
			## store
			movq	%r8, -1440(%rbp)
			## new const Int: 180
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$180, 24(%r8)
			## store
			movq	%r8, -1448(%rbp)
			## new const Int: 181
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$181, 24(%r8)
			## store
			movq	%r8, -1456(%rbp)
			## new const Int: 182
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$182, 24(%r8)
			## store
			movq	%r8, -1464(%rbp)
			## new const Int: 183
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$183, 24(%r8)
			## store
			movq	%r8, -1472(%rbp)
			## new const Int: 184
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$184, 24(%r10)
			## store
			movq	%r10, -1480(%rbp)
			## new const Int: 185
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$185, 24(%r9)
			## store
			movq	%r9, -1488(%rbp)
			## new const Int: 186
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$186, 24(%r8)
			## store
			movq	%r8, -1496(%rbp)
			## new const Int: 187
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$187, 24(%r8)
			## store
			movq	%r8, -1504(%rbp)
			## new const Int: 188
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$188, 24(%r8)
			## store
			movq	%r8, -1512(%rbp)
			## new const Int: 189
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$189, 24(%r9)
			## store
			movq	%r9, -1520(%rbp)
			## new const Int: 190
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$190, 24(%r8)
			## store
			movq	%r8, -1528(%rbp)
			## new const Int: 191
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$191, 24(%r8)
			## store
			movq	%r8, -1536(%rbp)
			## new const Int: 192
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$192, 24(%r8)
			## store
			movq	%r8, -1544(%rbp)
			## new const Int: 193
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$193, 24(%r8)
			## store
			movq	%r8, -1552(%rbp)
			## new const Int: 194
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$194, 24(%r9)
			## store
			movq	%r9, -1560(%rbp)
			## new const Int: 195
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$195, 24(%r8)
			## store
			movq	%r8, -1568(%rbp)
			## new const Int: 196
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$196, 24(%r8)
			## store
			movq	%r8, -1576(%rbp)
			## new const Int: 197
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$197, 24(%r8)
			## store
			movq	%r8, -1584(%rbp)
			## new const Int: 198
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$198, 24(%r9)
			## store
			movq	%r9, -1592(%rbp)
			## new const Int: 199
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$199, 24(%r8)
			## store
			movq	%r8, -1600(%rbp)
			## new const Int: 200
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$200, 24(%r8)
			## store
			movq	%r8, -1608(%rbp)
			## new const Int: 201
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$201, 24(%r8)
			## store
			movq	%r8, -1616(%rbp)
			## new const Int: 202
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$202, 24(%r8)
			## store
			movq	%r8, -1624(%rbp)
			## new const Int: 203
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$203, 24(%r8)
			## store
			movq	%r8, -1632(%rbp)
			## new const Int: 204
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$204, 24(%r8)
			## store
			movq	%r8, -1640(%rbp)
			## new const Int: 205
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$205, 24(%r8)
			## store
			movq	%r8, -1648(%rbp)
			## new const Int: 206
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$206, 24(%r8)
			## store
			movq	%r8, -1656(%rbp)
			## new const Int: 207
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$207, 24(%r8)
			## store
			movq	%r8, -1664(%rbp)
			## new const Int: 208
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$208, 24(%r8)
			## store
			movq	%r8, -1672(%rbp)
			## new const Int: 209
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$209, 24(%r8)
			## store
			movq	%r8, -1680(%rbp)
			## new const Int: 210
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$210, 24(%r8)
			## store
			movq	%r8, -1688(%rbp)
			## new const Int: 211
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$211, 24(%r9)
			## store
			movq	%r9, -1696(%rbp)
			## new const Int: 212
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$212, 24(%r8)
			## store
			movq	%r8, -1704(%rbp)
			## new const Int: 213
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$213, 24(%r8)
			## store
			movq	%r8, -1712(%rbp)
			## new const Int: 214
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$214, 24(%r8)
			## store
			movq	%r8, -1720(%rbp)
			## new const Int: 215
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$215, 24(%r8)
			## store
			movq	%r8, -1728(%rbp)
			## new const Int: 216
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$216, 24(%r9)
			## store
			movq	%r9, -1736(%rbp)
			## new const Int: 217
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$217, 24(%r8)
			## store
			movq	%r8, -1744(%rbp)
			## new const Int: 218
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$218, 24(%r8)
			## store
			movq	%r8, -1752(%rbp)
			## new const Int: 219
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$219, 24(%r8)
			## store
			movq	%r8, -1760(%rbp)
			## new const Int: 220
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$220, 24(%r8)
			## store
			movq	%r8, -1768(%rbp)
			## new const Int: 221
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$221, 24(%r8)
			## store
			movq	%r8, -1776(%rbp)
			## new const Int: 222
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$222, 24(%r8)
			## store
			movq	%r8, -1784(%rbp)
			## new const Int: 223
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$223, 24(%r10)
			## store
			movq	%r10, -1792(%rbp)
			## new const Int: 224
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$224, 24(%r8)
			## store
			movq	%r8, -1800(%rbp)
			## new const Int: 225
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$225, 24(%r8)
			## store
			movq	%r8, -1808(%rbp)
			## new const Int: 226
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$226, 24(%r9)
			## store
			movq	%r9, -1816(%rbp)
			## new const Int: 227
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$227, 24(%r9)
			## store
			movq	%r9, -1824(%rbp)
			## new const Int: 228
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$228, 24(%r8)
			## store
			movq	%r8, -1832(%rbp)
			## new const Int: 229
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$229, 24(%r8)
			## store
			movq	%r8, -1840(%rbp)
			## new const Int: 230
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$230, 24(%r8)
			## store
			movq	%r8, -1848(%rbp)
			## new const Int: 231
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$231, 24(%r9)
			## store
			movq	%r9, -1856(%rbp)
			## new const Int: 232
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$232, 24(%r8)
			## store
			movq	%r8, -1864(%rbp)
			## new const Int: 233
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$233, 24(%r8)
			## store
			movq	%r8, -1872(%rbp)
			## new const Int: 234
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$234, 24(%r10)
			## store
			movq	%r10, -1880(%rbp)
			## new const Int: 235
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$235, 24(%r10)
			## store
			movq	%r10, -1888(%rbp)
			## new const Int: 236
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$236, 24(%r8)
			## store
			movq	%r8, -1896(%rbp)
			## new const Int: 237
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$237, 24(%r9)
			## store
			movq	%r9, -1904(%rbp)
			## new const Int: 238
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$238, 24(%r8)
			## store
			movq	%r8, -1912(%rbp)
			## new const Int: 239
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$239, 24(%r8)
			## store
			movq	%r8, -1920(%rbp)
			## new const Int: 240
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$240, 24(%r8)
			## store
			movq	%r8, -1928(%rbp)
			## new const Int: 241
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$241, 24(%r8)
			## store
			movq	%r8, -1936(%rbp)
			## new const Int: 242
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$242, 24(%r8)
			## store
			movq	%r8, -1944(%rbp)
			## new const Int: 243
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$243, 24(%r8)
			## store
			movq	%r8, -1952(%rbp)
			## new const Int: 244
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$244, 24(%r8)
			## store
			movq	%r8, -1960(%rbp)
			## new const Int: 245
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$245, 24(%r8)
			## store
			movq	%r8, -1968(%rbp)
			## new const Int: 246
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$246, 24(%r8)
			## store
			movq	%r8, -1976(%rbp)
			## new const Int: 247
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$247, 24(%r8)
			## store
			movq	%r8, -1984(%rbp)
			## new const Int: 248
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$248, 24(%r8)
			## store
			movq	%r8, -1992(%rbp)
			## new const Int: 249
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$249, 24(%r8)
			## store
			movq	%r8, -2000(%rbp)
			## new const Int: 250
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$250, 24(%r8)
			## store
			movq	%r8, -2008(%rbp)
			## new const Int: 251
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$251, 24(%r9)
			## store
			movq	%r9, -2016(%rbp)
			## new const Int: 252
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$252, 24(%r8)
			## store
			movq	%r8, -2024(%rbp)
			## new const Int: 253
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$253, 24(%r10)
			## store
			movq	%r10, -2032(%rbp)
			## new const Int: 254
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$254, 24(%r10)
			## store
			movq	%r10, -2040(%rbp)
			## new const Int: 255
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$255, 24(%r8)
			## store
			movq	%r8, -2048(%rbp)
			## new const Int: 256
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$256, 24(%r10)
			## store
			movq	%r10, -2056(%rbp)
			## new const Int: 257
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$257, 24(%r9)
			## store
			movq	%r9, -2064(%rbp)
			## new const Int: 258
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$258, 24(%r9)
			## store
			movq	%r9, -2072(%rbp)
			## new const Int: 259
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$259, 24(%r8)
			## store
			movq	%r8, -2080(%rbp)
			## new const Int: 260
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$260, 24(%r8)
			## store
			movq	%r8, -2088(%rbp)
			## new const Int: 261
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$261, 24(%r10)
			## store
			movq	%r10, -2096(%rbp)
			## new const Int: 262
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$262, 24(%r9)
			## store
			movq	%r9, -2104(%rbp)
			## new const Int: 263
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$263, 24(%r8)
			## store
			movq	%r8, -2112(%rbp)
			## new const Int: 264
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$264, 24(%r8)
			## store
			movq	%r8, -2120(%rbp)
			## new const Int: 265
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$265, 24(%r8)
			## store
			movq	%r8, -2128(%rbp)
			## new const Int: 266
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$266, 24(%r8)
			## store
			movq	%r8, -2136(%rbp)
			## new const Int: 267
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$267, 24(%r8)
			## store
			movq	%r8, -2144(%rbp)
			## new const Int: 268
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$268, 24(%r9)
			## store
			movq	%r9, -2152(%rbp)
			## new const Int: 269
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$269, 24(%r8)
			## store
			movq	%r8, -2160(%rbp)
			## new const Int: 270
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$270, 24(%r10)
			## store
			movq	%r10, -2168(%rbp)
			## new const Int: 271
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$271, 24(%r8)
			## store
			movq	%r8, -2176(%rbp)
			## new const Int: 272
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$272, 24(%r8)
			## store
			movq	%r8, -2184(%rbp)
			## new const Int: 273
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$273, 24(%r10)
			## store
			movq	%r10, -2192(%rbp)
			## new const Int: 274
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$274, 24(%r8)
			## store
			movq	%r8, -2200(%rbp)
			## new const Int: 275
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$275, 24(%r8)
			## store
			movq	%r8, -2208(%rbp)
			## new const Int: 276
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$276, 24(%r8)
			## store
			movq	%r8, -2216(%rbp)
			## new const Int: 277
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$277, 24(%r8)
			## store
			movq	%r8, -2224(%rbp)
			## new const Int: 278
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$278, 24(%r8)
			## store
			movq	%r8, -2232(%rbp)
			## new const Int: 279
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$279, 24(%r8)
			## store
			movq	%r8, -2240(%rbp)
			## new const Int: 280
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$280, 24(%r8)
			## store
			movq	%r8, -2248(%rbp)
			## new const Int: 281
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$281, 24(%r8)
			## store
			movq	%r8, -2256(%rbp)
			## new const Int: 282
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$282, 24(%r8)
			## store
			movq	%r8, -2264(%rbp)
			## new const Int: 283
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$283, 24(%r8)
			## store
			movq	%r8, -2272(%rbp)
			## new const Int: 284
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$284, 24(%r8)
			## store
			movq	%r8, -2280(%rbp)
			## new const Int: 285
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$285, 24(%r8)
			## store
			movq	%r8, -2288(%rbp)
			## new const Int: 286
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$286, 24(%r9)
			## store
			movq	%r9, -2296(%rbp)
			## new const Int: 287
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$287, 24(%r8)
			## store
			movq	%r8, -2304(%rbp)
			## new const Int: 288
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$288, 24(%r8)
			## store
			movq	%r8, -2312(%rbp)
			## new const Int: 289
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$289, 24(%r8)
			## store
			movq	%r8, -2320(%rbp)
			## new const Int: 290
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$290, 24(%r8)
			## store
			movq	%r8, -2328(%rbp)
			## new const Int: 291
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$291, 24(%r8)
			## store
			movq	%r8, -2336(%rbp)
			## new const Int: 292
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$292, 24(%r8)
			## store
			movq	%r8, -2344(%rbp)
			## new const Int: 293
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$293, 24(%r8)
			## store
			movq	%r8, -2352(%rbp)
			## new const Int: 294
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$294, 24(%r8)
			## store
			movq	%r8, -2360(%rbp)
			## new const Int: 295
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$295, 24(%r10)
			## store
			movq	%r10, -2368(%rbp)
			## new const Int: 296
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$296, 24(%r8)
			## store
			movq	%r8, -2376(%rbp)
			## new const Int: 297
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$297, 24(%r8)
			## store
			movq	%r8, -2384(%rbp)
			## new const Int: 298
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$298, 24(%r8)
			## store
			movq	%r8, -2392(%rbp)
			## new const Int: 299
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$299, 24(%r10)
			## store
			movq	%r10, -2400(%rbp)
			## new const Int: 300
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$300, 24(%r10)
			## store
			movq	%r10, -2408(%rbp)
			## new const Int: 301
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$301, 24(%r8)
			## store
			movq	%r8, -2416(%rbp)
			## new const Int: 302
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$302, 24(%r9)
			## store
			movq	%r9, -2424(%rbp)
			## new const Int: 303
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$303, 24(%r8)
			## store
			movq	%r8, -2432(%rbp)
			## new const Int: 304
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$304, 24(%r8)
			## store
			movq	%r8, -2440(%rbp)
			## new const Int: 305
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$305, 24(%r8)
			## store
			movq	%r8, -2448(%rbp)
			## new const Int: 306
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$306, 24(%r10)
			## store
			movq	%r10, -2456(%rbp)
			## new const Int: 307
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$307, 24(%r8)
			## store
			movq	%r8, -2464(%rbp)
			## new const Int: 308
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$308, 24(%r8)
			## store
			movq	%r8, -2472(%rbp)
			## new const Int: 309
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$309, 24(%r8)
			## store
			movq	%r8, -2480(%rbp)
			## new const Int: 310
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$310, 24(%r8)
			## store
			movq	%r8, -2488(%rbp)
			## new const Int: 311
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$311, 24(%r8)
			## store
			movq	%r8, -2496(%rbp)
			## new const Int: 312
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$312, 24(%r9)
			## store
			movq	%r9, -2504(%rbp)
			## new const Int: 313
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$313, 24(%r8)
			## store
			movq	%r8, -2512(%rbp)
			## new const Int: 314
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$314, 24(%r8)
			## store
			movq	%r8, -2520(%rbp)
			## new const Int: 315
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$315, 24(%r8)
			## store
			movq	%r8, -2528(%rbp)
			## new const Int: 316
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$316, 24(%r8)
			## store
			movq	%r8, -2536(%rbp)
			## new const Int: 317
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$317, 24(%r8)
			## store
			movq	%r8, -2544(%rbp)
			## new const Int: 318
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$318, 24(%r8)
			## store
			movq	%r8, -2552(%rbp)
			## new const Int: 319
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$319, 24(%r8)
			## store
			movq	%r8, -2560(%rbp)
			## new const Int: 320
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$320, 24(%r8)
			## store
			movq	%r8, -2568(%rbp)
			## new const Int: 321
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$321, 24(%r9)
			## store
			movq	%r9, -2576(%rbp)
			## new const Int: 322
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$322, 24(%r8)
			## store
			movq	%r8, -2584(%rbp)
			## new const Int: 323
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$323, 24(%r8)
			## store
			movq	%r8, -2592(%rbp)
			## new const Int: 324
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$324, 24(%r9)
			## store
			movq	%r9, -2600(%rbp)
			## new const Int: 325
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$325, 24(%r8)
			## store
			movq	%r8, -2608(%rbp)
			## new const Int: 326
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$326, 24(%r9)
			## store
			movq	%r9, -2616(%rbp)
			## new const Int: 327
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$327, 24(%r9)
			## store
			movq	%r9, -2624(%rbp)
			## new const Int: 328
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$328, 24(%r8)
			## store
			movq	%r8, -2632(%rbp)
			## new const Int: 329
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$329, 24(%r8)
			## store
			movq	%r8, -2640(%rbp)
			## new const Int: 330
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$330, 24(%r9)
			## store
			movq	%r9, -2648(%rbp)
			## new const Int: 331
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$331, 24(%r9)
			## store
			movq	%r9, -2656(%rbp)
			## new const Int: 332
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$332, 24(%r8)
			## store
			movq	%r8, -2664(%rbp)
			## new const Int: 333
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$333, 24(%r8)
			## store
			movq	%r8, -2672(%rbp)
			## new const Int: 334
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$334, 24(%r8)
			## store
			movq	%r8, -2680(%rbp)
			## new const Int: 335
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$335, 24(%r8)
			## store
			movq	%r8, -2688(%rbp)
			## new const Int: 336
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$336, 24(%r8)
			## store
			movq	%r8, -2696(%rbp)
			## new const Int: 337
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$337, 24(%r8)
			## store
			movq	%r8, -2704(%rbp)
			## new const Int: 338
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$338, 24(%r9)
			## store
			movq	%r9, -2712(%rbp)
			## new const Int: 339
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$339, 24(%r9)
			## store
			movq	%r9, -2720(%rbp)
			## new const Int: 340
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$340, 24(%r8)
			## store
			movq	%r8, -2728(%rbp)
			## new const Int: 341
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$341, 24(%r10)
			## store
			movq	%r10, -2736(%rbp)
			## new const Int: 342
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$342, 24(%r9)
			## store
			movq	%r9, -2744(%rbp)
			## new const Int: 343
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$343, 24(%r9)
			## store
			movq	%r9, -2752(%rbp)
			## new const Int: 344
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$344, 24(%r8)
			## store
			movq	%r8, -2760(%rbp)
			## new const Int: 345
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$345, 24(%r8)
			## store
			movq	%r8, -2768(%rbp)
			## new const Int: 346
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$346, 24(%r8)
			## store
			movq	%r8, -2776(%rbp)
			## new const Int: 347
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$347, 24(%r9)
			## store
			movq	%r9, -2784(%rbp)
			## new const Int: 348
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$348, 24(%r8)
			## store
			movq	%r8, -2792(%rbp)
			## new const Int: 349
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$349, 24(%r8)
			## store
			movq	%r8, -2800(%rbp)
			## new const Int: 350
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$350, 24(%r8)
			## store
			movq	%r8, -2808(%rbp)
			## new const Int: 351
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$351, 24(%r8)
			## store
			movq	%r8, -2816(%rbp)
			## new const Int: 352
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$352, 24(%r9)
			## store
			movq	%r9, -2824(%rbp)
			## new const Int: 353
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$353, 24(%r8)
			## store
			movq	%r8, -2832(%rbp)
			## new const Int: 354
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$354, 24(%r9)
			## store
			movq	%r9, -2840(%rbp)
			## new const Int: 355
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$355, 24(%r8)
			## store
			movq	%r8, -2848(%rbp)
			## new const Int: 356
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$356, 24(%r8)
			## store
			movq	%r8, -2856(%rbp)
			## new const Int: 357
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$357, 24(%r8)
			## store
			movq	%r8, -2864(%rbp)
			## new const Int: 358
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$358, 24(%r8)
			## store
			movq	%r8, -2872(%rbp)
			## new const Int: 359
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$359, 24(%r9)
			## store
			movq	%r9, -2880(%rbp)
			## new const Int: 360
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$360, 24(%r8)
			## store
			movq	%r8, -2888(%rbp)
			## new const Int: 361
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$361, 24(%r10)
			## store
			movq	%r10, -2896(%rbp)
			## new const Int: 362
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$362, 24(%r10)
			## store
			movq	%r10, -2904(%rbp)
			## new const Int: 363
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$363, 24(%r8)
			## store
			movq	%r8, -2912(%rbp)
			## new const Int: 364
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$364, 24(%r9)
			## store
			movq	%r9, -2920(%rbp)
			## new const Int: 365
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$365, 24(%r8)
			## store
			movq	%r8, -2928(%rbp)
			## new const Int: 366
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$366, 24(%r8)
			## store
			movq	%r8, -2936(%rbp)
			## new const Int: 367
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$367, 24(%r8)
			## store
			movq	%r8, -2944(%rbp)
			## new const Int: 368
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$368, 24(%r9)
			## store
			movq	%r9, -2952(%rbp)
			## new const Int: 369
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$369, 24(%r8)
			## store
			movq	%r8, -2960(%rbp)
			## new const Int: 370
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$370, 24(%r8)
			## store
			movq	%r8, -2968(%rbp)
			## new const Int: 371
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$371, 24(%r8)
			## store
			movq	%r8, -2976(%rbp)
			## new const Int: 372
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$372, 24(%r8)
			## store
			movq	%r8, -2984(%rbp)
			## new const Int: 373
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$373, 24(%r8)
			## store
			movq	%r8, -2992(%rbp)
			## new const Int: 374
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$374, 24(%r8)
			## store
			movq	%r8, -3000(%rbp)
			## new const Int: 375
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$375, 24(%r8)
			## store
			movq	%r8, -3008(%rbp)
			## new const Int: 376
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$376, 24(%r9)
			## store
			movq	%r9, -3016(%rbp)
			## new const Int: 377
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$377, 24(%r8)
			## store
			movq	%r8, -3024(%rbp)
			## new const Int: 378
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$378, 24(%r8)
			## store
			movq	%r8, -3032(%rbp)
			## new const Int: 379
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$379, 24(%r8)
			## store
			movq	%r8, -3040(%rbp)
			## new const Int: 380
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$380, 24(%r8)
			## store
			movq	%r8, -3048(%rbp)
			## new const Int: 381
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$381, 24(%r9)
			## store
			movq	%r9, -3056(%rbp)
			## new const Int: 382
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$382, 24(%r8)
			## store
			movq	%r8, -3064(%rbp)
			## new const Int: 383
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$383, 24(%r8)
			## store
			movq	%r8, -3072(%rbp)
			## new const Int: 384
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$384, 24(%r9)
			## store
			movq	%r9, -3080(%rbp)
			## new const Int: 385
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$385, 24(%r8)
			## store
			movq	%r8, -3088(%rbp)
			## new const Int: 386
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$386, 24(%r8)
			## store
			movq	%r8, -3096(%rbp)
			## new const Int: 387
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$387, 24(%r8)
			## store
			movq	%r8, -3104(%rbp)
			## new const Int: 388
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$388, 24(%r10)
			## store
			movq	%r10, -3112(%rbp)
			## new const Int: 389
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$389, 24(%r9)
			## store
			movq	%r9, -3120(%rbp)
			## new const Int: 390
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rdx
			movl	$390, 24(%rdx)
			## new const Int: 391
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movl	$391, 24(%r10)
			## new const Int: 392
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r15
			movl	$392, 24(%r15)
			## new const Int: 393
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r14
			movl	$393, 24(%r14)
			## new const Int: 394
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movl	$394, 24(%r11)
			## new const Int: 395
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r13
			movl	$395, 24(%r13)
			## new const Int: 396
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r12
			movl	$396, 24(%r12)
			## new const Int: 397
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$397, 24(%r8)
			## new const Int: 398
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rdi
			movl	$398, 24(%rdi)
			## new const Int: 399
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movl	$399, 24(%r9)
			## new const Int: 400
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rsi
			movl	$400, 24(%rsi)
			## unbox value of %r9 into %rcx
			movq	24(%r9), %rcx
			## unbox value of %rsi into %r9
			movq	24(%rsi), %r9
			## plus
			movl	%ecx, %esi
			addl	%r9d, %esi
			## box value of %rsi into %rcx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rcx
			movq	%rsi, 24(%rcx)
			## unbox value of %rdi into %rsi
			movq	24(%rdi), %rsi
			## unbox value of %rcx into %r9
			movq	24(%rcx), %r9
			## plus
			movl	%esi, %ecx
			addl	%r9d, %ecx
			## box value of %rcx into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rcx, 24(%r9)
			## unbox value of %r8 into %rcx
			movq	24(%r8), %rcx
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%ecx, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## unbox value of %r12 into %rcx
			movq	24(%r12), %rcx
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%ecx, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## unbox value of %r13 into %r12
			movq	24(%r13), %r12
			## unbox value of %r9 into %r13
			movq	24(%r9), %r13
			## plus
			movl	%r12d, %r8d
			addl	%r13d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## unbox value of %r11 into %r12
			movq	24(%r11), %r12
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r12d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## unbox value of %r14 into %r8
			movq	24(%r14), %r8
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r8d, %r9d
			addl	%r11d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## unbox value of %r15 into %r12
			movq	24(%r15), %r12
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## plus
			movl	%r12d, %r9d
			addl	%r11d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r11d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## unbox value of %rdx into %r9
			movq	24(%rdx), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-3120(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-3112(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-3104(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-3096(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-3088(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-3080(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-3072(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-3064(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-3056(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-3048(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-3040(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-3032(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-3024(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-3016(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-3008(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-3000(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2992(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2984(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-2976(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2968(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2960(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2952(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2944(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2936(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2928(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2920(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2912(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2904(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r11d
			addl	%r10d, %r11d
			## box value of %r11 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r8)
			## load
			movq	-2896(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2888(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2880(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2872(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2864(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2856(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-2848(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2840(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2832(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2824(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2816(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2808(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2800(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2792(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2784(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2776(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-2768(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2760(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2752(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r11d
			addl	%r9d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-2744(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2736(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-2728(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2720(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2712(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2704(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2696(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2688(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2680(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2672(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2664(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2656(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2648(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-2640(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2632(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2624(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## box value of %r11 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r8)
			## load
			movq	-2616(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2608(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2600(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r8d, %r9d
			addl	%r11d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-2592(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2584(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2576(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2568(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2560(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2552(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2544(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2536(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2528(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-2520(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2512(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2504(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2496(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2488(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-2480(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2472(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2464(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2456(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2448(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-2440(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2432(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2424(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2416(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2408(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2400(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2392(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2384(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2376(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2368(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2360(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2352(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-2344(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-2336(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2328(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2320(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2312(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2304(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2296(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2288(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2280(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2272(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2264(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-2256(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2248(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2240(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2232(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2224(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2216(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2208(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-2200(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2192(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2184(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2176(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-2168(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r8d, %r10d
			addl	%r11d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-2160(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2152(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2144(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-2136(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2128(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2120(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2112(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2104(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2096(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2088(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-2080(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2072(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-2064(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-2056(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2048(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2040(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-2032(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-2024(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-2016(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-2008(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-2000(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1992(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1984(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1976(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1968(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1960(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1952(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1944(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1936(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1928(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1920(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1912(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1904(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1896(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1888(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1880(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1872(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1864(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1856(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1848(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1840(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1832(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-1824(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1816(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1808(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1800(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1792(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1784(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1776(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1768(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1760(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1752(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1744(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1736(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1728(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1720(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1712(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1704(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1696(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1688(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1680(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1672(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1664(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1656(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1648(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1640(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1632(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1624(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1616(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1608(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-1600(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1592(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1584(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1576(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1568(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1560(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1552(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1544(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1536(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1528(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1520(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r8d, %r9d
			addl	%r11d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1512(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r11d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1504(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1496(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1488(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-1480(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1472(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-1464(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-1456(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1448(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1440(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1432(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r11d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1424(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1416(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1408(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-1400(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## box value of %r11 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r8)
			## load
			movq	-1392(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1384(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1376(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1368(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1360(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1352(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-1344(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1336(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1328(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1320(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1312(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1304(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1296(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1288(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1280(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1272(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1264(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1256(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1248(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1240(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1232(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1224(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1216(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r11d
			addl	%r9d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1208(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1200(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1192(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1184(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-1176(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1168(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1160(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1152(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1144(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-1136(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-1128(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1120(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-1112(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1104(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1096(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1088(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1080(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-1072(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-1064(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1056(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1048(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-1040(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-1032(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-1024(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-1016(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-1008(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-1000(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-992(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-984(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-976(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-968(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-960(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r11d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-952(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-944(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-936(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-928(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-920(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-912(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-904(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-896(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-888(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-880(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-872(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-864(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-856(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r11d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-848(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-840(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-832(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-824(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-816(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-808(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-800(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-792(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-784(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-776(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-768(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-760(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-752(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-744(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-736(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-728(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-720(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-712(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-704(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-696(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-688(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-680(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-672(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-664(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-656(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-648(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-640(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-632(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-624(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-616(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-608(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-600(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-592(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-584(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-576(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-568(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-560(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-552(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-544(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-536(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-528(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-520(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-512(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-504(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-496(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-488(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-480(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-472(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-464(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-456(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-448(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-440(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-432(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-424(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-416(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-408(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## box value of %r11 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r8)
			## load
			movq	-400(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-392(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-384(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-376(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r11d
			addl	%r9d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-368(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-360(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-352(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-344(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-336(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-328(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-320(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-312(%rbp), %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-304(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-296(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-288(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-280(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-272(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-264(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-256(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-248(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-240(%rbp), %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## plus
			movl	%r11d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-232(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-224(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-216(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-208(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-200(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-192(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-184(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-176(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r11, 24(%r9)
			## load
			movq	-168(%rbp), %r8
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r11d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-160(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-152(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-144(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-136(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r9)
			## load
			movq	-128(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-120(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-112(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r9, 24(%r8)
			## load
			movq	-104(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-96(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r10, 24(%r11)
			## load
			movq	-88(%rbp), %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-80(%rbp), %r10
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-72(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## box value of %r9 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r9, 24(%r10)
			## load
			movq	-64(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## box value of %r10 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r10, 24(%r8)
			## load
			movq	-56(%rbp), %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-48(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## plus
			movl	%r10d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## load
			movq	-40(%rbp), %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## box value of %r9 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r9, 24(%r11)
			## load
			movq	-32(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## plus
			movl	%r9d, %r8d
			addl	%r10d, %r8d
			## box value of %r8 into %r11
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r11
			movq	%r8, 24(%r11)
			## load
			movq	-24(%rbp), %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## plus
			movl	%r10d, %r8d
			addl	%r9d, %r8d
			## box value of %r8 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			## load
			movq	-16(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
			## box value of %r11 into %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r10
			movq	%r11, 24(%r10)
			## load
			movq	-8(%rbp), %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## plus
			movl	%r9d, %r8d
			addl	%r11d, %r8d
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
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## storing param [0]
			pushq	%r9
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self ptr (%rbx)
			pushq	%rbx
			## pushing 1 params to the stack
			subq	$8, %rsp
			## moving rsp[80] to rsp[0]
			movq	80(%rsp), %rax
			movq	%rax, 0(%rsp)
			## self: lookup method in vtable
			## get ptr to vtable from self
			movq	16(%rbx), %rax
			## find method out_int in vtable[7]
			movq	56(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 1 params from stack with subq
			addq	$8, %rsp
			## restore self ptr (%rbx)
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## removing 1 stored params from stack (2nd time)
			addq	$8, %rsp
			## storing method result in %r8
			movq	%rax, %r8
			## move ret val %r8 into %rax
			movq	%r8, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 390 spilled regs
			addq	$3120, %rsp
			leave
			ret

.globl Object.abort
Object.abort:
			pushq	%rbp
			movq	%rsp, %rbp
			movq $abort.string, %rdi
			call raw_out_string
			movq $0, %rdi
			call exit

			leave
			ret

.globl Object.copy
Object.copy:
			pushq	%rbp
			movq	%rsp, %rbp
			## call malloc to make space for the new object
			## use leaq to multiply the size by 8
			movq	8(%rbx), %rdi
			leaq	0(,%rdi,8), %rdi
			call	malloc
			## call memcpy to copy %rbx into %rax
			## use leaq to multiply the size by 8
			movq	8(%rbx), %rdx
			leaq	0(,%rdx,8), %rdx
			movq	%rbx, %rsi
			movq	%rax, %rdi
			call	memcpy
			## result of mempy in %rax, so good to return
			leave
			ret

.globl Object.type_name
Object.type_name:
			pushq	%rbp
			movq	%rsp, %rbp
			## make new String to hold the result
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	String..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rax
			## move type_name from vtable[0] into String in %rax
			movq	16(%rbx), %r8
			movq	0(%r8), %r8
			movq	%r8, 24(%rax)
			leave
			ret

.globl String.concat
String.concat:
			pushq	%rbp
			movq	%rsp, %rbp
			## unbox self into rdi
			movq	24(%rbx), %rdi
			## unbox param[0] into rsi
			movq	16(%rbp), %rax
			movq	24(%rax), %rsi
			call	cool_str_concat
			## make new box in rax to store result (moved into r8 temporarily)
			movq	%rax, %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	String..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rax
			movq	%r8, 24(%rax)
			leave
			ret

.globl String.length
String.length:
			pushq	%rbp
			movq	%rsp, %rbp
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## call strlen to compute length
			movq	24(%rbx), %rdi
			call	strlen
			movq	%rax, %r8
			## box final result
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			## move result into rax
			movq	%r9, %rax
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			leave
			ret

.globl String.substr
String.substr:
			pushq	%rbp
			movq	%rsp, %rbp
			## unbox self into rdi
			movq	24(%rbx), %rdi
			## unbox param[0] into rsi
			movq	16(%rbp), %rax
			movq	24(%rax), %rsi
			## unbox param[1] into rdx
			movq	24(%rbp), %rax
			movq	24(%rax), %rdx
			call	cool_str_substr
			## make new box to store result (moved into r8 temporarily)
			movq	%rax, %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	String..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %rax
			movq	%r8, 24(%rax)
			leave
			ret

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
			.string "Bool"

.globl type_name_IO 
type_name_IO:			## type_name string for IO
			.string "IO"

.globl type_name_Int 
type_name_Int:			## type_name string for Int
			.string "Int"

.globl type_name_Main 
type_name_Main:			## type_name string for Main
			.string "Main"

.globl type_name_Object 
type_name_Object:			## type_name string for Object
			.string "Object"

.globl type_name_String 
type_name_String:			## type_name string for String
			.string "String"

.globl empty.string
empty.string:			## empty string for default Strings
			.string ""

.globl abort.string
abort.string:			## abort string for Object.abort
			.string "abort\n"

.globl error.substr_range
error.substr_range:		## error string for String.substr
			.string "ERROR: 0: Exception: String.substr out of range\n"

.globl in_int_format_str
in_int_format_str:
			.string "%ld"

.globl out_int_format_str
out_int_format_str:
			.string "%d"

	.globl	raw_out_string
	.type	raw_out_string, @function
raw_out_string:
.raw_out_LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.raw_out_string_L2
.raw_out_string_L5:
	cmpb	$92, -6(%rbp)
	jne	.raw_out_string_L3
	movl	-4(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -5(%rbp)
	cmpb	$110, -5(%rbp)
	jne	.raw_out_string_L4
	movb	$10, -6(%rbp)
	addl	$1, -4(%rbp)
	jmp	.raw_out_string_L3
.raw_out_string_L4:
	cmpb	$116, -5(%rbp)
	jne	.raw_out_string_L3
	movb	$9, -6(%rbp)
	addl	$1, -4(%rbp)
.raw_out_string_L3:
	movsbl	-6(%rbp), %eax
	movl	%eax, %edi
	call	putchar
	addl	$1, -4(%rbp)
.raw_out_string_L2:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -6(%rbp)
	cmpb	$0, -6(%rbp)
	jne	.raw_out_string_L5
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
raw_in_string:
			pushq	%rbp
			movq	%rsp, %rbp
			subq	$32, %rsp
			movl	$20, -16(%rbp)
			movl	$0, -12(%rbp)
			movl	-16(%rbp), %eax
			cltq
			movq	%rax, %rdi
			call	malloc
			movq	%rax, -8(%rbp)
.in_str_L8:
			call	getchar
			movb	%al, -17(%rbp)
			cmpb	$10, -17(%rbp)
			je	.in_str_L2
			cmpb	$-1, -17(%rbp)
			je	.in_str_L2
			movl	-12(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			addq	%rax, %rdx
			movzbl	-17(%rbp), %eax
			movb	%al, (%rdx)
			addl	$1, -12(%rbp)
			cmpb	$0, -17(%rbp)
			jne	.in_str_L3
			movl	$0, -12(%rbp)
			jmp	.in_str_L4
.in_str_L6:
			call	getchar
			movb	%al, -17(%rbp)
.in_str_L4:
			cmpb	$10, -17(%rbp)
			je	.L5
			cmpb	$-1, -17(%rbp)
			jne	.in_str_L6
.L5:
			jmp	.in_str_L2
.in_str_L3:
			movl	-12(%rbp), %eax
			cmpl	-16(%rbp), %eax
			jne	.in_str_L7
			addl	$20, -16(%rbp)
			movl	-16(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	realloc
			movq	%rax, -8(%rbp)
			jmp	.in_str_L8
.in_str_L7:
			jmp	.in_str_L8
.in_str_L2:
			movl	-12(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	strndup
			leave
			ret
cool_str_concat:
			pushq	%rbp
			movq	%rsp, %rbp
			subq	$32, %rsp
			movq	%rdi, -24(%rbp)
			movq	%rsi, -32(%rbp)
			movq	-24(%rbp), %rax
			movq	%rax, %rdi
			call	strlen
			movl	%eax, -16(%rbp)
			movq	-32(%rbp), %rax
			movq	%rax, %rdi
			call	strlen
			movl	%eax, -12(%rbp)
			movl	-12(%rbp), %eax
			movl	-16(%rbp), %edx
			addl	%edx, %eax
			addl	$1, %eax
			cltq
			movq	%rax, %rdi
			call	malloc
			movq	%rax, -8(%rbp)
			movq	-24(%rbp), %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	strcpy
			movq	-32(%rbp), %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	strcat
			movq	-8(%rbp), %rax
			leave
			ret
cool_str_substr:
			pushq	%rbp
			movq	%rsp, %rbp
			pushq	%rbx
			subq	$24, %rsp
			movq	%rdi, -24(%rbp)
			movl	%esi, -28(%rbp)
			movl	%edx, -32(%rbp)
			cmpl	$0, -28(%rbp)
			js	.substr_L4
			movl	-32(%rbp), %eax
			movl	-28(%rbp), %edx
			addl	%edx, %eax
			movslq	%eax, %rbx
			movq	-24(%rbp), %rax
			movq	%rax, %rdi
			call	strlen
			cmpq	%rax, %rbx
			jbe	.substr_L5
.substr_L4:
			movq	$error.substr_range, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.substr_L5:
			movl	-32(%rbp), %eax
			cltq
			movl	-28(%rbp), %edx
			movslq	%edx, %rcx
			movq	-24(%rbp), %rdx
			addq	%rcx, %rdx
			movq	%rax, %rsi
			movq	%rdx, %rdi
			call	strndup
			addq	$24, %rsp
			popq	%rbx
			popq	%rbp
			ret
			## ::::::::::::::::::::::::::::::::::::::::
			##  COMPARISONS
			## ::::::::::::::::::::::::::::::::::::::::

lt_helper:
			pushq	%rbp
			movq	%rsp, %rbp
			## get lhs and rhs pointers from stack
			## move lhs into %r8
			movq	16(%rbp), %r8
			## move rhs into %r9
			movq	24(%rbp), %r9
			## check for void pointers
			cmpq	$0, %r8
			je		cmp_lt_false
			cmpq	$0, %r9
			je		cmp_lt_false
			## move type tags into %r8 and %r9
			movq	(%r8), %r8
			movq	(%r9), %r9
			## check for different types
			cmpq	%r9, %r8
			jne		cmp_lt_false
			## check if lhs and rhs are Ints
			cmpq	$1, %r8
			je		cmp_lt_int
			## check if lhs and rhs are Bools
			cmpq	$0, %r8
			je		cmp_lt_bool
			## check if lhs and rhs are Strings
			cmpq	$4, %r8
			je		cmp_lt_string
			jmp		cmp_lt_false

			## compare Ints and Bools
cmp_lt_bool:
cmp_lt_int:
			movq	16(%rbp), %r8
			movq	24(%rbp), %r9
			movl	24(%r8), %r8d
			movl	24(%r9), %r9d
			cmpl	%r9d, %r8d
			jl		cmp_lt_true
			jmp		cmp_lt_false

			## compare Strings
cmp_lt_string:
			movq	16(%rbp), %r8
			movq	24(%rbp), %r9
			movq	24(%r8), %rdi
			movq	24(%r9), %rsi
			call	strcmp
			cmpl	$0, %eax
			jl		cmp_lt_true
			jmp		cmp_lt_false

			## make new true object in %rax
cmp_lt_true:
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self reg
			pushq	%rbx
			call	Bool..new
			## restore self reg
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	$1, 24(%rax)
			jmp		cmp_lt_end

			## make new false object in %rax
cmp_lt_false:
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self reg
			pushq	%rbx
			call	Bool..new
			## restore self reg
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			jmp		cmp_lt_end

cmp_lt_end:
			leave
			ret

le_helper:
			pushq	%rbp
			movq	%rsp, %rbp
			## get lhs and rhs pointers from stack
			## move lhs into %r8
			movq	16(%rbp), %r8
			## move rhs into %r9
			movq	24(%rbp), %r9
			## check for same pointer
			cmpq	%r9, %r8
			je		cmp_le_true
			## check for void pointers
			cmpq	$0, %r8
			je		cmp_le_false
			cmpq	$0, %r9
			je		cmp_le_false
			## move type tags into %r8 and %r9
			movq	(%r8), %r8
			movq	(%r9), %r9
			## check for different types
			cmpq	%r9, %r8
			jne		cmp_le_false
			## check if lhs and rhs are Ints
			cmpq	$1, %r8
			je		cmp_le_int
			## check if lhs and rhs are Bools
			cmpq	$0, %r8
			je		cmp_le_bool
			## check if lhs and rhs are Strings
			cmpq	$4, %r8
			je		cmp_le_string
			jmp		cmp_le_false

			## compare Ints and Bools
cmp_le_bool:
cmp_le_int:
			movq	16(%rbp), %r8
			movq	24(%rbp), %r9
			movl	24(%r8), %r8d
			movl	24(%r9), %r9d
			cmpl	%r9d, %r8d
			jle		cmp_le_true
			jmp		cmp_le_false

			## compare Strings
cmp_le_string:
			movq	16(%rbp), %r8
			movq	24(%rbp), %r9
			movq	24(%r8), %rdi
			movq	24(%r9), %rsi
			call	strcmp
			cmpl	$0, %eax
			jle		cmp_le_true
			jmp		cmp_le_false

			## make new true object in %rax
cmp_le_true:
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self reg
			pushq	%rbx
			call	Bool..new
			## restore self reg
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	$1, 24(%rax)
			jmp		cmp_le_end

			## make new false object in %rax
cmp_le_false:
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self reg
			pushq	%rbx
			call	Bool..new
			## restore self reg
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			jmp		cmp_le_end

cmp_le_end:
			leave
			ret

eq_helper:
			pushq	%rbp
			movq	%rsp, %rbp
			## get lhs and rhs pointers from stack
			## move lhs into %r8
			movq	16(%rbp), %r8
			## move rhs into %r9
			movq	24(%rbp), %r9
			## check for same pointer
			cmpq	%r9, %r8
			je		cmp_eq_true
			## check for void pointers
			cmpq	$0, %r8
			je		cmp_eq_false
			cmpq	$0, %r9
			je		cmp_eq_false
			## move type tags into %r8 and %r9
			movq	(%r8), %r8
			movq	(%r9), %r9
			## check for different types
			cmpq	%r9, %r8
			jne		cmp_eq_false
			## check if lhs and rhs are Ints
			cmpq	$1, %r8
			je		cmp_eq_int
			## check if lhs and rhs are Bools
			cmpq	$0, %r8
			je		cmp_eq_bool
			## check if lhs and rhs are Strings
			cmpq	$4, %r8
			je		cmp_eq_string
			jmp		cmp_eq_false

			## compare Ints and Bools
cmp_eq_bool:
cmp_eq_int:
			movq	16(%rbp), %r8
			movq	24(%rbp), %r9
			movl	24(%r8), %r8d
			movl	24(%r9), %r9d
			cmpl	%r9d, %r8d
			je		cmp_eq_true
			jmp		cmp_eq_false

			## compare Strings
cmp_eq_string:
			movq	16(%rbp), %r8
			movq	24(%rbp), %r9
			movq	24(%r8), %rdi
			movq	24(%r9), %rsi
			call	strcmp
			cmpl	$0, %eax
			je		cmp_eq_true
			jmp		cmp_eq_false

			## make new true object in %rax
cmp_eq_true:
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self reg
			pushq	%rbx
			call	Bool..new
			## restore self reg
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	$1, 24(%rax)
			jmp		cmp_eq_end

			## make new false object in %rax
cmp_eq_false:
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## save self reg
			pushq	%rbx
			call	Bool..new
			## restore self reg
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			jmp		cmp_eq_end

cmp_eq_end:
			leave
			ret

