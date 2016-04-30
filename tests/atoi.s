			## ::::::::::::::::::::::::::::::::::::::::
			##  VTABLES
			## ::::::::::::::::::::::::::::::::::::::::

.globl A2I..vtable
A2I..vtable:		## vtable for A2I
			.quad type_name_A2I
			.quad A2I..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad A2I.c2i
			.quad A2I.i2c
			.quad A2I.a2i
			.quad A2I.a2i_aux
			.quad A2I.i2a
			.quad A2I.i2a_aux

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

.globl A2I..new
A2I..new:		## Constructor for A2I
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for A2I (size: 3)
			movq	$8, %rsi
			movq	$3, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$6, %rax
			movq	%rax, 0(%rbx)
			movq	$3, %rax
			movq	%rax, 8(%rbx)
			movq	$A2I..vtable, %rax
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

.globl A2I.c2i
A2I.c2i:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A2I_c2i_1:
			## loading param [0] into %r11
			movq	16(%rbp), %r11
			## assign
			movq	%r11, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_1, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_2
			test	%r9d, %r9d
			jnz		.if_then_2
			## branch .if_else_2
			test	%r8d, %r8d
			jnz		.if_else_2
.if_then_2:
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
			## assign
			movq	%r8, %r9
			jmp		.if_exit_2
.if_else_2:
			## assign
			movq	%r11, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_2, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_3
			test	%r9d, %r9d
			jnz		.if_then_3
			## branch .if_else_3
			test	%r8d, %r8d
			jnz		.if_else_3
.if_then_3:
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
			movq	%rax, %r9
			movl	$1, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_3
.if_else_3:
			## assign
			movq	%r11, %r8
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_3, 24(%r10)
			## use eq_helper to compare %r8 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r8) and rhs (%r10)
			pushq	%r10
			pushq	%r8
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_4
			test	%r10d, %r10d
			jnz		.if_then_4
			## branch .if_else_4
			test	%r8d, %r8d
			jnz		.if_else_4
.if_then_4:
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
			## assign
			movq	%r8, %r9
			jmp		.if_exit_4
.if_else_4:
			## assign
			movq	%r11, %r10
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_4, 24(%r8)
			## use eq_helper to compare %r10 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_5
			test	%r8d, %r8d
			jnz		.if_then_5
			## branch .if_else_5
			test	%r9d, %r9d
			jnz		.if_else_5
.if_then_5:
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
			## assign
			movq	%r8, %r10
			jmp		.if_exit_5
.if_else_5:
			## assign
			movq	%r11, %r10
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_5, 24(%r8)
			## use eq_helper to compare %r10 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_6
			test	%r8d, %r8d
			jnz		.if_then_6
			## branch .if_else_6
			test	%r9d, %r9d
			jnz		.if_else_6
.if_then_6:
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
			movq	%rax, %r8
			movl	$4, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_6
.if_else_6:
			## assign
			movq	%r11, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_6, 24(%r8)
			## use eq_helper to compare %r9 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r8)
			pushq	%r8
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_7
			test	%r9d, %r9d
			jnz		.if_then_7
			## branch .if_else_7
			test	%r8d, %r8d
			jnz		.if_else_7
.if_then_7:
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
			## assign
			movq	%r8, %r11
			jmp		.if_exit_7
.if_else_7:
			## assign
			movq	%r11, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_7, 24(%r8)
			## use eq_helper to compare %r9 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r8)
			pushq	%r8
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_8
			test	%r8d, %r8d
			jnz		.if_then_8
			## branch .if_else_8
			test	%r9d, %r9d
			jnz		.if_else_8
.if_then_8:
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
			movq	%rax, %r8
			movl	$6, 24(%r8)
			## assign
			movq	%r8, %r10
			jmp		.if_exit_8
.if_else_8:
			## assign
			movq	%r11, %r8
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_8, 24(%r10)
			## use eq_helper to compare %r8 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r8) and rhs (%r10)
			pushq	%r10
			pushq	%r8
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_9
			test	%r8d, %r8d
			jnz		.if_then_9
			## branch .if_else_9
			test	%r9d, %r9d
			jnz		.if_else_9
.if_then_9:
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
			## assign
			movq	%r8, %r9
			jmp		.if_exit_9
.if_else_9:
			## assign
			movq	%r11, %r8
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_9, 24(%r10)
			## use eq_helper to compare %r8 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r8) and rhs (%r10)
			pushq	%r10
			pushq	%r8
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_10
			test	%r8d, %r8d
			jnz		.if_then_10
			## branch .if_else_10
			test	%r9d, %r9d
			jnz		.if_else_10
.if_then_10:
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
			movq	%rax, %r9
			movl	$8, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_10
.if_else_10:
			## assign
			movq	%r11, %r8
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_10, 24(%r9)
			## use eq_helper to compare %r8 = %r9
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r8) and rhs (%r9)
			pushq	%r9
			pushq	%r8
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_11
			test	%r8d, %r8d
			jnz		.if_then_11
			## branch .if_else_11
			test	%r9d, %r9d
			jnz		.if_else_11
.if_then_11:
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
			movq	%rax, %r8
			movl	$9, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_11
.if_else_11:
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
			## pushing 0 params to the stack
			subq	$0, %rsp
			## self: lookup method in vtable
			## get ptr to vtable from self
			movq	16(%rbx), %rax
			## find method abort in vtable[2]
			movq	16(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 0 params from stack with subq
			addq	$0, %rsp
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
			## removing 0 stored params from stack (2nd time)
			addq	$0, %rsp
			## storing method result in %r8
			movq	%rax, %r8
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
			## assign
			movq	%r8, %r9
			jmp		.if_exit_11
.if_exit_11:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_10
.if_exit_10:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_9
.if_exit_9:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_8
.if_exit_8:
			## assign
			movq	%r10, %r11
			jmp		.if_exit_7
.if_exit_7:
			## assign
			movq	%r11, %r9
			jmp		.if_exit_6
.if_exit_6:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_5
.if_exit_5:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_4
.if_exit_4:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_3
.if_exit_3:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_2
.if_exit_2:
			## move ret val %r9 into %rax
			movq	%r9, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			leave
			ret

.globl A2I.i2c
A2I.i2c:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A2I_i2c_12:
			## loading param [0] into %r9
			movq	16(%rbp), %r9
			## assign
			movq	%r9, %r10
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
			## use eq_helper to compare %r10 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .if_then_13
			test	%r8d, %r8d
			jnz		.if_then_13
			## branch .if_else_13
			test	%r10d, %r10d
			jnz		.if_else_13
.if_then_13:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_1, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_13
.if_else_13:
			## assign
			movq	%r9, %r10
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
			## use eq_helper to compare %r10 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .if_then_14
			test	%r8d, %r8d
			jnz		.if_then_14
			## branch .if_else_14
			test	%r10d, %r10d
			jnz		.if_else_14
.if_then_14:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_2, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_14
.if_else_14:
			## assign
			movq	%r9, %r10
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
			movq	%rax, %r11
			movl	$2, 24(%r11)
			## use eq_helper to compare %r10 = %r11
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r11)
			pushq	%r11
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_15
			test	%r10d, %r10d
			jnz		.if_then_15
			## branch .if_else_15
			test	%r8d, %r8d
			jnz		.if_else_15
.if_then_15:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_3, 24(%r8)
			## assign
			movq	%r8, %r10
			jmp		.if_exit_15
.if_else_15:
			## assign
			movq	%r9, %r10
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
			## use eq_helper to compare %r10 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_16
			test	%r10d, %r10d
			jnz		.if_then_16
			## branch .if_else_16
			test	%r8d, %r8d
			jnz		.if_else_16
.if_then_16:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_4, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_16
.if_else_16:
			## assign
			movq	%r9, %r8
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
			## use eq_helper to compare %r8 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r8) and rhs (%r10)
			pushq	%r10
			pushq	%r8
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .if_then_17
			test	%r8d, %r8d
			jnz		.if_then_17
			## branch .if_else_17
			test	%r10d, %r10d
			jnz		.if_else_17
.if_then_17:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_5, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_17
.if_else_17:
			## assign
			movq	%r9, %r10
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
			movq	%rax, %r11
			movl	$5, 24(%r11)
			## use eq_helper to compare %r10 = %r11
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r11)
			pushq	%r11
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_18
			test	%r10d, %r10d
			jnz		.if_then_18
			## branch .if_else_18
			test	%r8d, %r8d
			jnz		.if_else_18
.if_then_18:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_6, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_18
.if_else_18:
			## assign
			movq	%r9, %r8
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
			movq	%rax, %r11
			movl	$6, 24(%r11)
			## use eq_helper to compare %r8 = %r11
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r8) and rhs (%r11)
			pushq	%r11
			pushq	%r8
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .if_then_19
			test	%r8d, %r8d
			jnz		.if_then_19
			## branch .if_else_19
			test	%r10d, %r10d
			jnz		.if_else_19
.if_then_19:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_7, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_19
.if_else_19:
			## assign
			movq	%r9, %r10
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
			movq	%rax, %r11
			movl	$7, 24(%r11)
			## use eq_helper to compare %r10 = %r11
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r11)
			pushq	%r11
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_20
			test	%r10d, %r10d
			jnz		.if_then_20
			## branch .if_else_20
			test	%r8d, %r8d
			jnz		.if_else_20
.if_then_20:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_8, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_20
.if_else_20:
			## assign
			movq	%r9, %r11
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
			## use eq_helper to compare %r11 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r11) and rhs (%r8)
			pushq	%r8
			pushq	%r11
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .if_then_21
			test	%r8d, %r8d
			jnz		.if_then_21
			## branch .if_else_21
			test	%r10d, %r10d
			jnz		.if_else_21
.if_then_21:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_9, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_21
.if_else_21:
			## assign
			movq	%r9, %r10
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
			movq	%rax, %r8
			movl	$9, 24(%r8)
			## use eq_helper to compare %r10 = %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_22
			test	%r8d, %r8d
			jnz		.if_then_22
			## branch .if_else_22
			test	%r9d, %r9d
			jnz		.if_else_22
.if_then_22:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_10, 24(%r8)
			## assign
			movq	%r8, %r10
			jmp		.if_exit_22
.if_else_22:
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
			## pushing 0 params to the stack
			subq	$0, %rsp
			## self: lookup method in vtable
			## get ptr to vtable from self
			movq	16(%rbx), %rax
			## find method abort in vtable[2]
			movq	16(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 0 params from stack with subq
			addq	$0, %rsp
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
			## removing 0 stored params from stack (2nd time)
			addq	$0, %rsp
			## storing method result in %r8
			movq	%rax, %r8
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_11, 24(%r8)
			## assign
			movq	%r8, %r10
			jmp		.if_exit_22
.if_exit_22:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_21
.if_exit_21:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_20
.if_exit_20:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_19
.if_exit_19:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_18
.if_exit_18:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_17
.if_exit_17:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_16
.if_exit_16:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_15
.if_exit_15:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_14
.if_exit_14:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_13
.if_exit_13:
			## move ret val %r8 into %rax
			movq	%r8, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			leave
			ret

.globl A2I.a2i
A2I.a2i:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A2I_a2i_23:
			## loading param [0] into %r11
			movq	16(%rbp), %r11
			## assign
			movq	%r11, %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r8 is void and set result accordingly
			cmpq	$0, %r8
			jnz		.asm_label_1
			movq	$1, 24(%r10)
.asm_label_1:
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_25_void
			test	%r9d, %r9d
			jnz		.dispatch_25_void
			## branch .dispatch_25_not_void
			test	%r10d, %r10d
			jnz		.dispatch_25_not_void
.dispatch_25_void:
			movq	$string_12, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_25_not_void
.dispatch_25_not_void:
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
			## pushing 0 params to the stack
			subq	$0, %rsp
			## set receiver_obj (%r8) as self ptr (%rbx)
			movq	%r8, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r8), %rax
			## find method length in vtable[6]
			movq	48(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 0 params from stack with subq
			addq	$0, %rsp
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
			## removing 0 stored params from stack (2nd time)
			addq	$0, %rsp
			## storing method result in %r9
			movq	%rax, %r9
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
			movq	%rax, %r10
			movl	$0, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_24
			test	%r9d, %r9d
			jnz		.if_then_24
			## branch .if_else_24
			test	%r8d, %r8d
			jnz		.if_else_24
.if_then_24:
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
			## assign
			movq	%r8, %r10
			jmp		.if_exit_24
.if_else_24:
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
			## storing param [0]
			pushq	%r8
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
			## storing param [1]
			pushq	%r8
			## assign
			movq	%r11, %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r8 is void and set result accordingly
			cmpq	$0, %r8
			jnz		.asm_label_2
			movq	$1, 24(%r9)
.asm_label_2:
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_27_void
			test	%r10d, %r10d
			jnz		.dispatch_27_void
			## branch .dispatch_27_not_void
			test	%r9d, %r9d
			jnz		.dispatch_27_not_void
.dispatch_27_void:
			movq	$string_13, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_27_not_void
.dispatch_27_not_void:
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
			## pushing 2 params to the stack
			subq	$16, %rsp
			## moving rsp[96] to rsp[0]
			movq	96(%rsp), %rax
			movq	%rax, 0(%rsp)
			## moving rsp[88] to rsp[8]
			movq	88(%rsp), %rax
			movq	%rax, 8(%rsp)
			## set receiver_obj (%r8) as self ptr (%rbx)
			movq	%r8, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r8), %rax
			## find method substr in vtable[7]
			movq	56(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 2 params from stack with subq
			addq	$16, %rsp
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
			## removing 2 stored params from stack (2nd time)
			addq	$16, %rsp
			## storing method result in %r9
			movq	%rax, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_14, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_26
			test	%r9d, %r9d
			jnz		.if_then_26
			## branch .if_else_26
			test	%r8d, %r8d
			jnz		.if_else_26
.if_then_26:
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
			## storing param [0]
			pushq	%r8
			## assign
			movq	%r11, %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## check if %r9 is void and set result accordingly
			cmpq	$0, %r9
			jnz		.asm_label_3
			movq	$1, 24(%r8)
.asm_label_3:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_28_void
			test	%r10d, %r10d
			jnz		.dispatch_28_void
			## branch .dispatch_28_not_void
			test	%r8d, %r8d
			jnz		.dispatch_28_not_void
.dispatch_28_void:
			movq	$string_13, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_28_not_void
.dispatch_28_not_void:
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
			## pushing 0 params to the stack
			subq	$0, %rsp
			## set receiver_obj (%r9) as self ptr (%rbx)
			movq	%r9, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r9), %rax
			## find method length in vtable[6]
			movq	48(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 0 params from stack with subq
			addq	$0, %rsp
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
			## removing 0 stored params from stack (2nd time)
			addq	$0, %rsp
			## storing method result in %r8
			movq	%rax, %r8
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
			movq	%rax, %r9
			movl	$1, 24(%r9)
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## minus
			movl	%r10d, %r9d
			subl	%r8d, %r9d
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
			## storing param [1]
			pushq	%r8
			## assign
			movq	%r11, %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## check if %r9 is void and set result accordingly
			cmpq	$0, %r9
			jnz		.asm_label_4
			movq	$1, 24(%r8)
.asm_label_4:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_29_void
			test	%r10d, %r10d
			jnz		.dispatch_29_void
			## branch .dispatch_29_not_void
			test	%r8d, %r8d
			jnz		.dispatch_29_not_void
.dispatch_29_void:
			movq	$string_13, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_29_not_void
.dispatch_29_not_void:
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
			## pushing 2 params to the stack
			subq	$16, %rsp
			## moving rsp[96] to rsp[0]
			movq	96(%rsp), %rax
			movq	%rax, 0(%rsp)
			## moving rsp[88] to rsp[8]
			movq	88(%rsp), %rax
			movq	%rax, 8(%rsp)
			## set receiver_obj (%r9) as self ptr (%rbx)
			movq	%r9, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r9), %rax
			## find method substr in vtable[7]
			movq	56(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 2 params from stack with subq
			addq	$16, %rsp
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
			## removing 2 stored params from stack (2nd time)
			addq	$16, %rsp
			## storing method result in %r8
			movq	%rax, %r8
			## storing param [0]
			pushq	%r8
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
			## find method a2i_aux in vtable[8]
			movq	64(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## negate
			movl	%r8d, %r9d
			negl	%r9d
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
			## assign
			movq	%r8, %r9
			jmp		.if_exit_26
.if_else_26:
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
			## storing param [0]
			pushq	%r8
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
			## storing param [1]
			pushq	%r8
			## assign
			movq	%r11, %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r8 is void and set result accordingly
			cmpq	$0, %r8
			jnz		.asm_label_5
			movq	$1, 24(%r9)
.asm_label_5:
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_31_void
			test	%r10d, %r10d
			jnz		.dispatch_31_void
			## branch .dispatch_31_not_void
			test	%r9d, %r9d
			jnz		.dispatch_31_not_void
.dispatch_31_void:
			movq	$string_15, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_31_not_void
.dispatch_31_not_void:
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
			## pushing 2 params to the stack
			subq	$16, %rsp
			## moving rsp[96] to rsp[0]
			movq	96(%rsp), %rax
			movq	%rax, 0(%rsp)
			## moving rsp[88] to rsp[8]
			movq	88(%rsp), %rax
			movq	%rax, 8(%rsp)
			## set receiver_obj (%r8) as self ptr (%rbx)
			movq	%r8, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r8), %rax
			## find method substr in vtable[7]
			movq	56(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 2 params from stack with subq
			addq	$16, %rsp
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
			## removing 2 stored params from stack (2nd time)
			addq	$16, %rsp
			## storing method result in %r9
			movq	%rax, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r10
			movq	$string_16, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_30
			test	%r9d, %r9d
			jnz		.if_then_30
			## branch .if_else_30
			test	%r8d, %r8d
			jnz		.if_else_30
.if_then_30:
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
			## storing param [0]
			pushq	%r8
			## assign
			movq	%r11, %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r9 is void and set result accordingly
			cmpq	$0, %r9
			jnz		.asm_label_6
			movq	$1, 24(%r10)
.asm_label_6:
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_32_void
			test	%r8d, %r8d
			jnz		.dispatch_32_void
			## branch .dispatch_32_not_void
			test	%r10d, %r10d
			jnz		.dispatch_32_not_void
.dispatch_32_void:
			movq	$string_15, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_32_not_void
.dispatch_32_not_void:
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
			## pushing 0 params to the stack
			subq	$0, %rsp
			## set receiver_obj (%r9) as self ptr (%rbx)
			movq	%r9, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r9), %rax
			## find method length in vtable[6]
			movq	48(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 0 params from stack with subq
			addq	$0, %rsp
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
			## removing 0 stored params from stack (2nd time)
			addq	$0, %rsp
			## storing method result in %r8
			movq	%rax, %r8
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
			movq	%rax, %r9
			movl	$1, 24(%r9)
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r12
			movq	24(%r9), %r12
			## minus
			movl	%r10d, %r8d
			subl	%r12d, %r8d
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
			## storing param [1]
			pushq	%r9
			## assign
			movq	%r11, %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_7
			movq	$1, 24(%r9)
.asm_label_7:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_33_void
			test	%r8d, %r8d
			jnz		.dispatch_33_void
			## branch .dispatch_33_not_void
			test	%r9d, %r9d
			jnz		.dispatch_33_not_void
.dispatch_33_void:
			movq	$string_15, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_33_not_void
.dispatch_33_not_void:
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
			## pushing 2 params to the stack
			subq	$16, %rsp
			## moving rsp[96] to rsp[0]
			movq	96(%rsp), %rax
			movq	%rax, 0(%rsp)
			## moving rsp[88] to rsp[8]
			movq	88(%rsp), %rax
			movq	%rax, 8(%rsp)
			## set receiver_obj (%r10) as self ptr (%rbx)
			movq	%r10, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r10), %rax
			## find method substr in vtable[7]
			movq	56(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 2 params from stack with subq
			addq	$16, %rsp
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
			## removing 2 stored params from stack (2nd time)
			addq	$16, %rsp
			## storing method result in %r8
			movq	%rax, %r8
			## storing param [0]
			pushq	%r8
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
			## find method a2i_aux in vtable[8]
			movq	64(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_30
.if_else_30:
			## assign
			movq	%r11, %r8
			## storing param [0]
			pushq	%r8
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
			## find method a2i_aux in vtable[8]
			movq	64(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_30
.if_exit_30:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_26
.if_exit_26:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_24
.if_exit_24:
			## move ret val %r10 into %rax
			movq	%r10, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			leave
			ret

.globl A2I.a2i_aux
A2I.a2i_aux:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A2I_a2i_aux_34:
			## loading param [0] into %r13
			movq	16(%rbp), %r13
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
			## assign
			movq	%r8, %r14
			## assign
			movq	%r13, %r10
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_8
			movq	$1, 24(%r9)
.asm_label_8:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_35_void
			test	%r8d, %r8d
			jnz		.dispatch_35_void
			## branch .dispatch_35_not_void
			test	%r9d, %r9d
			jnz		.dispatch_35_not_void
.dispatch_35_void:
			movq	$string_17, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_35_not_void
.dispatch_35_not_void:
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
			## pushing 0 params to the stack
			subq	$0, %rsp
			## set receiver_obj (%r10) as self ptr (%rbx)
			movq	%r10, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r10), %rax
			## find method length in vtable[6]
			movq	48(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 0 params from stack with subq
			addq	$0, %rsp
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
			## removing 0 stored params from stack (2nd time)
			addq	$0, %rsp
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r12
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
			## assign
			movq	%r8, %r10
			jmp		.loop_start_36
.loop_start_36:
			## assign
			movq	%r10, %r9
			## assign
			movq	%r12, %r11
			## use lt_helper to compare %r9 < %r11
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r11)
			pushq	%r11
			pushq	%r9
			call	lt_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .loop_body_36
			test	%r9d, %r9d
			jnz		.loop_body_36
			## branch .loop_exit_36
			test	%r8d, %r8d
			jnz		.loop_exit_36
.loop_body_36:
			## assign
			movq	%r14, %r9
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
			movq	%rax, %r8
			movl	$10, 24(%r8)
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## mult
			movl	%r11d, %r8d
			imull	%r9d, %r8d
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
			## assign
			movq	%r10, %r8
			## storing param [0]
			pushq	%r8
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
			## storing param [1]
			pushq	%r8
			## assign
			movq	%r13, %r14
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r14 is void and set result accordingly
			cmpq	$0, %r14
			jnz		.asm_label_9
			movq	$1, 24(%r9)
.asm_label_9:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_37_void
			test	%r8d, %r8d
			jnz		.dispatch_37_void
			## branch .dispatch_37_not_void
			test	%r9d, %r9d
			jnz		.dispatch_37_not_void
.dispatch_37_void:
			movq	$string_18, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_37_not_void
.dispatch_37_not_void:
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
			## pushing 2 params to the stack
			subq	$16, %rsp
			## moving rsp[96] to rsp[0]
			movq	96(%rsp), %rax
			movq	%rax, 0(%rsp)
			## moving rsp[88] to rsp[8]
			movq	88(%rsp), %rax
			movq	%rax, 8(%rsp)
			## set receiver_obj (%r14) as self ptr (%rbx)
			movq	%r14, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r14), %rax
			## find method substr in vtable[7]
			movq	56(%rax), %rax
			## call method dynamically
			call	*%rax
			## removing 2 params from stack with subq
			addq	$16, %rsp
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
			## removing 2 stored params from stack (2nd time)
			addq	$16, %rsp
			## storing method result in %r8
			movq	%rax, %r8
			## storing param [0]
			pushq	%r8
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
			## find method c2i in vtable[5]
			movq	40(%rax), %rax
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
			## unbox value of %r11 into %r14
			movq	24(%r11), %r14
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## plus
			movl	%r14d, %r8d
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
			## assign
			movq	%r9, %r14
			## assign
			movq	%r10, %r8
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
			movq	%rax, %r10
			movl	$1, 24(%r10)
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
			## assign
			movq	%r9, %r10
			jmp		.loop_start_36
.loop_exit_36:
			## assign
			movq	%r14, %r9
			## assign
			movq	%r9, %r8
			## move ret val %r8 into %rax
			movq	%r8, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			leave
			ret

.globl A2I.i2a
A2I.i2a:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A2I_i2a_38:
			## loading param [0] into %r11
			movq	16(%rbp), %r11
			## assign
			movq	%r11, %r9
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
			movq	%rax, %r10
			movl	$0, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_39
			test	%r9d, %r9d
			jnz		.if_then_39
			## branch .if_else_39
			test	%r8d, %r8d
			jnz		.if_else_39
.if_then_39:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_1, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_39
.if_else_39:
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
			movq	%rax, %r10
			movl	$0, 24(%r10)
			## assign
			movq	%r11, %r8
			## use lt_helper to compare %r10 < %r8
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r10) and rhs (%r8)
			pushq	%r8
			pushq	%r10
			call	lt_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_40
			test	%r8d, %r8d
			jnz		.if_then_40
			## branch .if_else_40
			test	%r9d, %r9d
			jnz		.if_else_40
.if_then_40:
			## assign
			movq	%r11, %r8
			## storing param [0]
			pushq	%r8
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
			## find method i2a_aux in vtable[10]
			movq	80(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_40
.if_else_40:
			## assign
			movq	%r11, %r10
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
			movq	%rax, %r9
			movl	$1, 24(%r9)
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## negate
			movl	%r8d, %r9d
			negl	%r9d
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
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## mult
			movl	%r11d, %r9d
			imull	%r10d, %r9d
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
			## storing param [0]
			pushq	%r8
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
			## find method i2a_aux in vtable[10]
			movq	80(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_14, 24(%r9)
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## check if %r9 is void and set result accordingly
			cmpq	$0, %r9
			jnz		.asm_label_10
			movq	$1, 24(%r8)
.asm_label_10:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_41_void
			test	%r10d, %r10d
			jnz		.dispatch_41_void
			## branch .dispatch_41_not_void
			test	%r8d, %r8d
			jnz		.dispatch_41_not_void
.dispatch_41_void:
			movq	$string_19, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_41_not_void
.dispatch_41_not_void:
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
			## set receiver_obj (%r9) as self ptr (%rbx)
			movq	%r9, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r9), %rax
			## find method concat in vtable[5]
			movq	40(%rax), %rax
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
			## storing method result in %r10
			movq	%rax, %r10
			## assign
			movq	%r10, %r8
			jmp		.if_exit_40
.if_exit_40:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_39
.if_exit_39:
			## move ret val %r9 into %rax
			movq	%r9, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			leave
			ret

.globl A2I.i2a_aux
A2I.i2a_aux:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A2I_i2a_aux_42:
			## loading param [0] into %r12
			movq	16(%rbp), %r12
			## assign
			movq	%r12, %r9
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
			movq	%rax, %r10
			movl	$0, 24(%r10)
			## use eq_helper to compare %r9 = %r10
			## push caller-saved regs and self ptr
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			pushq	%rbx
			## push lhs (%r9) and rhs (%r10)
			pushq	%r10
			pushq	%r9
			call	eq_helper
			addq	$16, %rsp
			## pop self ptr and caller-saved regs
			popq	%rbx
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			## move comparison result into %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_43
			test	%r9d, %r9d
			jnz		.if_then_43
			## branch .if_else_43
			test	%r8d, %r8d
			jnz		.if_else_43
.if_then_43:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_11, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_43
.if_else_43:
			## assign
			movq	%r12, %r10
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
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_11
			movq	$string_20, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_11:
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
			## assign
			movq	%r8, %r11
			## assign
			movq	%r12, %r13
			## assign
			movq	%r11, %r8
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
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## mult
			movl	%r10d, %r9d
			imull	%r8d, %r9d
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
			## unbox value of %r13 into %r9
			movq	24(%r13), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## minus
			movl	%r9d, %r10d
			subl	%r8d, %r10d
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
			## storing param [0]
			pushq	%r8
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
			## find method i2c in vtable[6]
			movq	48(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## assign
			movq	%r11, %r8
			## storing param [0]
			pushq	%r8
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
			## find method i2a_aux in vtable[10]
			movq	80(%rax), %rax
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
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
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
			## check if %r8 is void and set result accordingly
			cmpq	$0, %r8
			jnz		.asm_label_12
			movq	$1, 24(%r9)
.asm_label_12:
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_44_void
			test	%r10d, %r10d
			jnz		.dispatch_44_void
			## branch .dispatch_44_not_void
			test	%r9d, %r9d
			jnz		.dispatch_44_not_void
.dispatch_44_void:
			movq	$string_21, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_44_not_void
.dispatch_44_not_void:
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
			## set receiver_obj (%r8) as self ptr (%rbx)
			movq	%r8, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r8), %rax
			## find method concat in vtable[5]
			movq	40(%rax), %rax
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
			## storing method result in %r10
			movq	%rax, %r10
			## assign
			movq	%r10, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_43
.if_exit_43:
			## move ret val %r8 into %rax
			movq	%r8, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
			leave
			ret

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
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_main_45:
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_22, 24(%r8)
			## storing param [0]
			pushq	%r8
			## new A2I
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A2I..new
			## restore self ptr
			popq	%rbx
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
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_13
			movq	$1, 24(%r8)
.asm_label_13:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_46_void
			test	%r9d, %r9d
			jnz		.dispatch_46_void
			## branch .dispatch_46_not_void
			test	%r8d, %r8d
			jnz		.dispatch_46_not_void
.dispatch_46_void:
			movq	$string_23, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_46_not_void
.dispatch_46_not_void:
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
			## set receiver_obj (%r10) as self ptr (%rbx)
			movq	%r10, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r10), %rax
			## find method a2i in vtable[7]
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
			## assign
			movq	%r8, %r10
			## new const Int: 678987
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movl	$678987, 24(%r8)
			## storing param [0]
			pushq	%r8
			## new A2I
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A2I..new
			## restore self ptr
			popq	%rbx
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
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Bool..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## check if %r11 is void and set result accordingly
			cmpq	$0, %r11
			jnz		.asm_label_14
			movq	$1, 24(%r8)
.asm_label_14:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_47_void
			test	%r9d, %r9d
			jnz		.dispatch_47_void
			## branch .dispatch_47_not_void
			test	%r8d, %r8d
			jnz		.dispatch_47_not_void
.dispatch_47_void:
			movq	$string_24, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_47_not_void
.dispatch_47_not_void:
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
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
			## find method i2a in vtable[9]
			movq	72(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			## assign
			movq	%r10, %r9
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
			## storing method result in %r9
			movq	%rax, %r9
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r9
			movq	$string_25, 24(%r9)
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
			## find method out_string in vtable[8]
			movq	64(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r8, %r9
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
			## find method out_string in vtable[8]
			movq	64(%rax), %rax
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
			## const String
			## push caller-saved regs
			pushq	%rcx
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
			movq	%rax, %r8
			movq	$string_26, 24(%r8)
			## storing param [0]
			pushq	%r8
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
			## find method out_string in vtable[8]
			movq	64(%rax), %rax
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			## move ret val %r8 into %rax
			movq	%r8, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 0 spilled regs
			addq	$0, %rsp
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

.globl type_name_A2I 
type_name_A2I:			## type_name string for A2I
			.string "A2I"

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

.globl string_11
string_11:
			.string ""

.globl string_19
string_19:
			.string "ERROR: 93: Exception: dispatch on void"

.globl string_22
string_22:
			.string "678987"

.globl string_18
string_18:
			.string "ERROR: 75: Exception: dispatch on void"

.globl string_24
string_24:
			.string "ERROR: 113: Exception: dispatch on void"

.globl string_15
string_15:
			.string "ERROR: 59: Exception: dispatch on void"

.globl string_17
string_17:
			.string "ERROR: 71: Exception: dispatch on void"

.globl string_25
string_25:
			.string " == "

.globl string_16
string_16:
			.string "+"

.globl string_14
string_14:
			.string "-"

.globl string_2
string_2:
			.string "1"

.globl string_1
string_1:
			.string "0"

.globl string_4
string_4:
			.string "3"

.globl string_3
string_3:
			.string "2"

.globl string_12
string_12:
			.string "ERROR: 57: Exception: dispatch on void"

.globl string_5
string_5:
			.string "4"

.globl string_8
string_8:
			.string "7"

.globl string_7
string_7:
			.string "6"

.globl string_10
string_10:
			.string "9"

.globl string_6
string_6:
			.string "5"

.globl string_21
string_21:
			.string "ERROR: 103: Exception: dispatch on void"

.globl string_9
string_9:
			.string "8"

.globl string_13
string_13:
			.string "ERROR: 58: Exception: dispatch on void"

.globl string_23
string_23:
			.string "ERROR: 112: Exception: dispatch on void"

.globl string_20
string_20:
			.string "ERROR: 102: Exception: division by zero"

.globl string_26
string_26:
			.string "\\n"

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

