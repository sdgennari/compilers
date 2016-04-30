			## ::::::::::::::::::::::::::::::::::::::::
			##  VTABLES
			## ::::::::::::::::::::::::::::::::::::::::

.globl A..vtable
A..vtable:		## vtable for A
			.quad type_name_A
			.quad A..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad A.value
			.quad A.set_var
			.quad A.method1
			.quad A.method2
			.quad A.method3
			.quad A.method4
			.quad A.method5

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

.globl B..vtable
B..vtable:		## vtable for B
			.quad type_name_B
			.quad B..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad A.value
			.quad A.set_var
			.quad A.method1
			.quad A.method2
			.quad A.method3
			.quad A.method4
			.quad B.method5

.globl Bool..vtable
Bool..vtable:		## vtable for Bool
			.quad type_name_Bool
			.quad Bool..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name

.globl C..vtable
C..vtable:		## vtable for C
			.quad type_name_C
			.quad C..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad A.value
			.quad A.set_var
			.quad A.method1
			.quad A.method2
			.quad A.method3
			.quad A.method4
			.quad C.method5
			.quad C.method6

.globl D..vtable
D..vtable:		## vtable for D
			.quad type_name_D
			.quad D..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad A.value
			.quad A.set_var
			.quad A.method1
			.quad A.method2
			.quad A.method3
			.quad A.method4
			.quad B.method5
			.quad D.method7

.globl E..vtable
E..vtable:		## vtable for E
			.quad type_name_E
			.quad E..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			.quad A.value
			.quad A.set_var
			.quad A.method1
			.quad A.method2
			.quad A.method3
			.quad A.method4
			.quad B.method5
			.quad D.method7
			.quad E.method6

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
			.quad Main.menu
			.quad Main.prompt
			.quad Main.get_int
			.quad Main.is_even
			.quad Main.class_type
			.quad Main.print
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

.globl A..new
A..new:		## Constructor for A
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for A (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$6, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$A..vtable, %rax
			movq	%rax, 16(%rbx)
			## default Int
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	$0, 24(%r8)
			## store %r8 in self[3] (var)
			movq	%r8, 24(%rbx)
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
			## store %r8 in self[3] (var)
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
			movq	$7, %rax
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

.globl B..new
B..new:		## Constructor for B
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for B (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$8, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$B..vtable, %rax
			movq	%rax, 16(%rbx)
			## default Int
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	$0, 24(%r8)
			## store %r8 in self[3] (var)
			movq	%r8, 24(%rbx)
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
			## store %r8 in self[3] (var)
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

.globl C..new
C..new:		## Constructor for C
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for C (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$9, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$C..vtable, %rax
			movq	%rax, 16(%rbx)
			## default Int
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	$0, 24(%r8)
			## store %r8 in self[3] (var)
			movq	%r8, 24(%rbx)
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
			## store %r8 in self[3] (var)
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

.globl D..new
D..new:		## Constructor for D
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for D (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$10, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$D..vtable, %rax
			movq	%rax, 16(%rbx)
			## default Int
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	$0, 24(%r8)
			## store %r8 in self[3] (var)
			movq	%r8, 24(%rbx)
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
			## store %r8 in self[3] (var)
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

.globl E..new
E..new:		## Constructor for E
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
			## allocate space for E (size: 4)
			movq	$8, %rsi
			movq	$4, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$11, %rax
			movq	%rax, 0(%rbx)
			movq	$4, %rax
			movq	%rax, 8(%rbx)
			movq	$E..vtable, %rax
			movq	%rax, 16(%rbx)
			## default Int
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	$0, 24(%r8)
			## store %r8 in self[3] (var)
			movq	%r8, 24(%rbx)
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
			## store %r8 in self[3] (var)
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
			## allocate space for Main (size: 7)
			movq	$8, %rsi
			movq	$7, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$5, %rax
			movq	%rax, 0(%rbx)
			movq	$7, %rax
			movq	%rax, 8(%rbx)
			movq	$Main..vtable, %rax
			movq	%rax, 16(%rbx)
			## default String
			## push caller-saved regs
			pushq	%rcx
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
			movq	$empty.string, 24(%r8)
			## store %r8 in self[3] (char)
			movq	%r8, 24(%rbx)
			## default A
			movq	$0, %r8
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			## default A
			movq	$0, %r8
			## store %r8 in self[5] (a_var)
			movq	%r8, 40(%rbx)
			## default Bool
			## push caller-saved regs
			pushq	%rcx
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
			movq	$0, 24(%r8)
			## store %r8 in self[6] (flag)
			movq	%r8, 48(%rbx)
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$1, 24(%r8)
			## store %r8 in self[6] (flag)
			movq	%r8, 48(%rbx)
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

.globl A.value
A.value:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_value_1:
			## load self[3] (var) into %r9
			movq	24(%rbx), %r9
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

.globl A.set_var
A.set_var:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_set_var_2:
			## loading param [0] into %r9
			movq	16(%rbp), %r9
			## assign
			movq	%r9, %r8
			## store %r8 in self[3] (var)
			movq	%r8, 24(%rbx)
			## move self ptr into %r9
			movq	%rbx, %r9
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

.globl A.method1
A.method1:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_method1_3:
			## move self ptr into %r8
			movq	%rbx, %r8
			## assign
			movq	%r8, %r9
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

.globl A.method2
A.method2:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_method2_4:
			## loading param [0] into %r8
			movq	16(%rbp), %r8
			## loading param [1] into %r9
			movq	24(%rbp), %r9
			## assign
			movq	%r8, %r10
			## assign
			movq	%r9, %r8
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
			## assign
			movq	%r10, %r9
			## assign
			movq	%r9, %r8
			## storing param [0]
			pushq	%r8
			## new B
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	B..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_1
			movq	$1, 24(%r8)
.asm_label_1:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_5_void
			test	%r9d, %r9d
			jnz		.dispatch_5_void
			## branch .dispatch_5_not_void
			test	%r8d, %r8d
			jnz		.dispatch_5_not_void
.dispatch_5_void:
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_5_not_void
.dispatch_5_not_void:
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
			## find method set_var in vtable[6]
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

.globl A.method3
A.method3:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_method3_6:
			## loading param [0] into %r8
			movq	16(%rbp), %r8
			## assign
			movq	%r8, %r9
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
			## assign
			movq	%r9, %r8
			## storing param [0]
			pushq	%r8
			## new C
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	C..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_2
			movq	$1, 24(%r10)
.asm_label_2:
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_7_void
			test	%r8d, %r8d
			jnz		.dispatch_7_void
			## branch .dispatch_7_not_void
			test	%r10d, %r10d
			jnz		.dispatch_7_not_void
.dispatch_7_void:
			movq	$string_2, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_7_not_void
.dispatch_7_not_void:
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
			## find method set_var in vtable[6]
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
			## assign
			movq	%r8, %r9
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

.globl A.method4
A.method4:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_method4_8:
			## loading param [0] into %r10
			movq	16(%rbp), %r10
			## loading param [1] into %r11
			movq	24(%rbp), %r11
			## assign
			movq	%r11, %r9
			## assign
			movq	%r10, %r8
			## use lt_helper to compare %r9 < %r8
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
			## move comparison result into %r12
			movq	%rax, %r12
			## unbox value of %r12 into %r9
			movq	24(%r12), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_9
			test	%r9d, %r9d
			jnz		.if_then_9
			## branch .if_else_9
			test	%r8d, %r8d
			jnz		.if_else_9
.if_then_9:
			## assign
			movq	%r10, %r8
			## assign
			movq	%r11, %r9
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## minus
			movl	%r11d, %r8d
			subl	%r10d, %r8d
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
			movq	%r9, %r8
			## assign
			movq	%r8, %r9
			## storing param [0]
			pushq	%r9
			## new D
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	D..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_3
			movq	$1, 24(%r8)
.asm_label_3:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_10_void
			test	%r9d, %r9d
			jnz		.dispatch_10_void
			## branch .dispatch_10_not_void
			test	%r8d, %r8d
			jnz		.dispatch_10_not_void
.dispatch_10_void:
			movq	$string_3, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_10_not_void
.dispatch_10_not_void:
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
			## find method set_var in vtable[6]
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_9
.if_else_9:
			## assign
			movq	%r11, %r8
			## assign
			movq	%r10, %r9
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
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r8
			## storing param [0]
			pushq	%r8
			## new D
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	D..new
			## restore self ptr
			popq	%rbx
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
			movq	%rax, %r9
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_4
			movq	$1, 24(%r9)
.asm_label_4:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_11_void
			test	%r8d, %r8d
			jnz		.dispatch_11_void
			## branch .dispatch_11_not_void
			test	%r9d, %r9d
			jnz		.dispatch_11_not_void
.dispatch_11_void:
			movq	$string_4, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_11_not_void
.dispatch_11_not_void:
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
			## find method set_var in vtable[6]
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_9
.if_exit_9:
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

.globl A.method5
A.method5:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.A_method5_12:
			## loading param [0] into %r13
			movq	16(%rbp), %r13
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
			## assign
			movq	%r8, %r11
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
			## assign
			movq	%r8, %r10
			jmp		.loop_start_13
.loop_start_13:
			## assign
			movq	%r10, %r9
			## assign
			movq	%r13, %r12
			## use le_helper to compare %r9 <= %r12
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
			## push lhs (%r9) and rhs (%r12)
			pushq	%r12
			pushq	%r9
			call	le_helper
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
			## branch .loop_body_13
			test	%r9d, %r9d
			jnz		.loop_body_13
			## branch .loop_exit_13
			test	%r8d, %r8d
			jnz		.loop_exit_13
.loop_body_13:
			## assign
			movq	%r11, %r9
			## assign
			movq	%r10, %r8
			## unbox value of %r9 into %r12
			movq	24(%r9), %r12
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## mult
			movl	%r12d, %r11d
			imull	%r9d, %r11d
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
			## assign
			movq	%r8, %r11
			## assign
			movq	%r10, %r9
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
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r12
			movq	24(%r10), %r12
			## plus
			movl	%r8d, %r9d
			addl	%r12d, %r9d
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
			movq	%r8, %r10
			jmp		.loop_start_13
.loop_exit_13:
			## assign
			movq	%r11, %r8
			## storing param [0]
			pushq	%r8
			## new E
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	E..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_5
			movq	$1, 24(%r8)
.asm_label_5:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_14_void
			test	%r9d, %r9d
			jnz		.dispatch_14_void
			## branch .dispatch_14_not_void
			test	%r8d, %r8d
			jnz		.dispatch_14_not_void
.dispatch_14_void:
			movq	$string_5, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_14_not_void
.dispatch_14_not_void:
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
			## find method set_var in vtable[6]
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
			## assign
			movq	%r8, %r9
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
.A2I_c2i_15:
			## loading param [0] into %r11
			movq	16(%rbp), %r11
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
			movq	$string_6, 24(%r10)
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
			## branch .if_then_16
			test	%r10d, %r10d
			jnz		.if_then_16
			## branch .if_else_16
			test	%r8d, %r8d
			jnz		.if_else_16
.if_then_16:
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
			jmp		.if_exit_16
.if_else_16:
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
			movq	%rax, %r9
			movq	$string_7, 24(%r9)
			## use eq_helper to compare %r10 = %r9
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
			## push lhs (%r10) and rhs (%r9)
			pushq	%r9
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
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_17
			test	%r9d, %r9d
			jnz		.if_then_17
			## branch .if_else_17
			test	%r8d, %r8d
			jnz		.if_else_17
.if_then_17:
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
			jmp		.if_exit_17
.if_else_17:
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
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
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
			jmp		.if_exit_18
.if_else_18:
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
			movq	$string_9, 24(%r8)
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
			## branch .if_then_19
			test	%r8d, %r8d
			jnz		.if_then_19
			## branch .if_else_19
			test	%r9d, %r9d
			jnz		.if_else_19
.if_then_19:
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
			movq	%rax, %r9
			movl	$3, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_19
.if_else_19:
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
			movq	$string_10, 24(%r8)
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
			## branch .if_then_20
			test	%r9d, %r9d
			jnz		.if_then_20
			## branch .if_else_20
			test	%r8d, %r8d
			jnz		.if_else_20
.if_then_20:
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
			jmp		.if_exit_20
.if_else_20:
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
			movq	$string_11, 24(%r8)
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
			## branch .if_then_21
			test	%r9d, %r9d
			jnz		.if_then_21
			## branch .if_else_21
			test	%r8d, %r8d
			jnz		.if_else_21
.if_then_21:
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
			movq	%rax, %r9
			movl	$5, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_21
.if_else_21:
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
			movq	$string_12, 24(%r8)
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
			## branch .if_then_22
			test	%r8d, %r8d
			jnz		.if_then_22
			## branch .if_else_22
			test	%r9d, %r9d
			jnz		.if_else_22
.if_then_22:
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
			movq	%r8, %r9
			jmp		.if_exit_22
.if_else_22:
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
			movq	$string_13, 24(%r10)
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
			## branch .if_then_23
			test	%r8d, %r8d
			jnz		.if_then_23
			## branch .if_else_23
			test	%r9d, %r9d
			jnz		.if_else_23
.if_then_23:
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
			movq	%rax, %r9
			movl	$7, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_23
.if_else_23:
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
			## branch .if_then_24
			test	%r9d, %r9d
			jnz		.if_then_24
			## branch .if_else_24
			test	%r8d, %r8d
			jnz		.if_else_24
.if_then_24:
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
			## assign
			movq	%r8, %r9
			jmp		.if_exit_24
.if_else_24:
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
			movq	$string_15, 24(%r9)
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
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_25
			test	%r9d, %r9d
			jnz		.if_then_25
			## branch .if_else_25
			test	%r8d, %r8d
			jnz		.if_else_25
.if_then_25:
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
			movq	%r8, %r10
			jmp		.if_exit_25
.if_else_25:
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
			movq	%r8, %r10
			jmp		.if_exit_25
.if_exit_25:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_24
.if_exit_24:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_23
.if_exit_23:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_22
.if_exit_22:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_21
.if_exit_21:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_20
.if_exit_20:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_19
.if_exit_19:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_18
.if_exit_18:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_17
.if_exit_17:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_16
.if_exit_16:
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
.A2I_i2c_26:
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
			movq	%rax, %r8
			movl	$0, 24(%r8)
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
			## branch .if_then_27
			test	%r9d, %r9d
			jnz		.if_then_27
			## branch .if_else_27
			test	%r8d, %r8d
			jnz		.if_else_27
.if_then_27:
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
			jmp		.if_exit_27
.if_else_27:
			## assign
			movq	%r11, %r8
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
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_28
			test	%r9d, %r9d
			jnz		.if_then_28
			## branch .if_else_28
			test	%r8d, %r8d
			jnz		.if_else_28
.if_then_28:
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
			movq	%r8, %r10
			jmp		.if_exit_28
.if_else_28:
			## assign
			movq	%r11, %r8
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
			movq	%rax, %r10
			movl	$2, 24(%r10)
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
			## branch .if_then_29
			test	%r10d, %r10d
			jnz		.if_then_29
			## branch .if_else_29
			test	%r8d, %r8d
			jnz		.if_else_29
.if_then_29:
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
			movq	$string_8, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_29
.if_else_29:
			## assign
			movq	%r11, %r8
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
			movq	%rax, %r10
			movl	$3, 24(%r10)
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
			## branch .if_then_30
			test	%r8d, %r8d
			jnz		.if_then_30
			## branch .if_else_30
			test	%r9d, %r9d
			jnz		.if_else_30
.if_then_30:
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
			movq	%r8, %r10
			jmp		.if_exit_30
.if_else_30:
			## assign
			movq	%r11, %r9
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
			## branch .if_then_31
			test	%r9d, %r9d
			jnz		.if_then_31
			## branch .if_else_31
			test	%r8d, %r8d
			jnz		.if_else_31
.if_then_31:
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
			movq	%r8, %r9
			jmp		.if_exit_31
.if_else_31:
			## assign
			movq	%r11, %r9
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
			## branch .if_then_32
			test	%r9d, %r9d
			jnz		.if_then_32
			## branch .if_else_32
			test	%r8d, %r8d
			jnz		.if_else_32
.if_then_32:
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
			jmp		.if_exit_32
.if_else_32:
			## assign
			movq	%r11, %r9
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
			movq	%rax, %r10
			movl	$6, 24(%r10)
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
			## branch .if_then_33
			test	%r9d, %r9d
			jnz		.if_then_33
			## branch .if_else_33
			test	%r8d, %r8d
			jnz		.if_else_33
.if_then_33:
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
			movq	$string_12, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_33
.if_else_33:
			## assign
			movq	%r11, %r9
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
			## branch .if_then_34
			test	%r9d, %r9d
			jnz		.if_then_34
			## branch .if_else_34
			test	%r8d, %r8d
			jnz		.if_else_34
.if_then_34:
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
			movq	$string_13, 24(%r8)
			## assign
			movq	%r8, %r11
			jmp		.if_exit_34
.if_else_34:
			## assign
			movq	%r11, %r8
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
			movq	%rax, %r10
			movl	$8, 24(%r10)
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
			## branch .if_then_35
			test	%r10d, %r10d
			jnz		.if_then_35
			## branch .if_else_35
			test	%r8d, %r8d
			jnz		.if_else_35
.if_then_35:
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
			movq	$string_14, 24(%r8)
			## assign
			movq	%r8, %r10
			jmp		.if_exit_35
.if_else_35:
			## assign
			movq	%r11, %r9
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
			## branch .if_then_36
			test	%r9d, %r9d
			jnz		.if_then_36
			## branch .if_else_36
			test	%r8d, %r8d
			jnz		.if_else_36
.if_then_36:
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
			movq	$string_15, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_36
.if_else_36:
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
			movq	$string_16, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_36
.if_exit_36:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_35
.if_exit_35:
			## assign
			movq	%r10, %r11
			jmp		.if_exit_34
.if_exit_34:
			## assign
			movq	%r11, %r9
			jmp		.if_exit_33
.if_exit_33:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_32
.if_exit_32:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_31
.if_exit_31:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_30
.if_exit_30:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_29
.if_exit_29:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_28
.if_exit_28:
			## assign
			movq	%r10, %r8
			jmp		.if_exit_27
.if_exit_27:
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
.A2I_a2i_37:
			## loading param [0] into %r9
			movq	16(%rbp), %r9
			## assign
			movq	%r9, %r11
			## push caller-saved regs
			pushq	%rcx
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
			## check if %r11 is void and set result accordingly
			cmpq	$0, %r11
			jnz		.asm_label_6
			movq	$1, 24(%r10)
.asm_label_6:
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_39_void
			test	%r8d, %r8d
			jnz		.dispatch_39_void
			## branch .dispatch_39_not_void
			test	%r10d, %r10d
			jnz		.dispatch_39_not_void
.dispatch_39_void:
			movq	$string_17, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_39_not_void
.dispatch_39_not_void:
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
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
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
			movq	%rax, %r11
			movl	$0, 24(%r11)
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
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## not
			movl	%r11d, %r8d
			xorl	$1, %r8d
			## branch .if_then_38
			test	%r11d, %r11d
			jnz		.if_then_38
			## branch .if_else_38
			test	%r8d, %r8d
			jnz		.if_else_38
.if_then_38:
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
			jmp		.if_exit_38
.if_else_38:
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
			movq	%r9, %r11
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_7
			movq	$1, 24(%r8)
.asm_label_7:
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
			movq	$string_18, %rdi
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
			## pushing 2 params to the stack
			subq	$16, %rsp
			## moving rsp[96] to rsp[0]
			movq	96(%rsp), %rax
			movq	%rax, 0(%rsp)
			## moving rsp[88] to rsp[8]
			movq	88(%rsp), %rax
			movq	%rax, 8(%rsp)
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
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
			movq	$string_19, 24(%r10)
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
			## branch .if_then_40
			test	%r8d, %r8d
			jnz		.if_then_40
			## branch .if_else_40
			test	%r10d, %r10d
			jnz		.if_else_40
.if_then_40:
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
			movq	%r9, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_8
			movq	$1, 24(%r8)
.asm_label_8:
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## not
			movl	%r11d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_42_void
			test	%r11d, %r11d
			jnz		.dispatch_42_void
			## branch .dispatch_42_not_void
			test	%r8d, %r8d
			jnz		.dispatch_42_not_void
.dispatch_42_void:
			movq	$string_18, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_42_not_void
.dispatch_42_not_void:
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
			movq	%rax, %r11
			movl	$1, 24(%r11)
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r12
			movq	24(%r11), %r12
			## minus
			movl	%r10d, %r8d
			subl	%r12d, %r8d
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
			## storing param [1]
			pushq	%r10
			## assign
			movq	%r9, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_9
			movq	$1, 24(%r8)
.asm_label_9:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_43_void
			test	%r9d, %r9d
			jnz		.dispatch_43_void
			## branch .dispatch_43_not_void
			test	%r8d, %r8d
			jnz		.dispatch_43_not_void
.dispatch_43_void:
			movq	$string_18, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_43_not_void
.dispatch_43_not_void:
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
			## storing method result in %r8
			movq	%rax, %r8
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## negate
			movl	%r9d, %r8d
			negl	%r8d
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
			movq	%r9, %r8
			jmp		.if_exit_40
.if_else_40:
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
			movq	%r9, %r11
			## push caller-saved regs
			pushq	%rcx
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
			## check if %r11 is void and set result accordingly
			cmpq	$0, %r11
			jnz		.asm_label_10
			movq	$1, 24(%r10)
.asm_label_10:
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_45_void
			test	%r8d, %r8d
			jnz		.dispatch_45_void
			## branch .dispatch_45_not_void
			test	%r10d, %r10d
			jnz		.dispatch_45_not_void
.dispatch_45_void:
			movq	$string_20, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_45_not_void
.dispatch_45_not_void:
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
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
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
			## storing method result in %r10
			movq	%rax, %r10
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
			movq	$string_21, 24(%r8)
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
			## branch .if_then_44
			test	%r10d, %r10d
			jnz		.if_then_44
			## branch .if_else_44
			test	%r8d, %r8d
			jnz		.if_else_44
.if_then_44:
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
			movq	%r9, %r8
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_11
			movq	$1, 24(%r10)
.asm_label_11:
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## not
			movl	%r11d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_46_void
			test	%r11d, %r11d
			jnz		.dispatch_46_void
			## branch .dispatch_46_not_void
			test	%r10d, %r10d
			jnz		.dispatch_46_not_void
.dispatch_46_void:
			movq	$string_20, %rdi
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
			## storing method result in %r10
			movq	%rax, %r10
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
			## unbox value of %r10 into %r12
			movq	24(%r10), %r12
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## minus
			movl	%r12d, %r10d
			subl	%r11d, %r10d
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
			## storing param [1]
			pushq	%r8
			## assign
			movq	%r9, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_12
			movq	$1, 24(%r8)
.asm_label_12:
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
			movq	$string_20, %rdi
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_44
.if_else_44:
			## assign
			movq	%r9, %r8
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_44
.if_exit_44:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_40
.if_exit_40:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_38
.if_exit_38:
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
.A2I_a2i_aux_48:
			## loading param [0] into %r14
			movq	16(%rbp), %r14
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
			## assign
			movq	%r14, %r11
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_13
			movq	$1, 24(%r8)
.asm_label_13:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_49_void
			test	%r9d, %r9d
			jnz		.dispatch_49_void
			## branch .dispatch_49_not_void
			test	%r8d, %r8d
			jnz		.dispatch_49_not_void
.dispatch_49_void:
			movq	$string_22, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_49_not_void
.dispatch_49_not_void:
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
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
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
			movq	%r8, %r13
			jmp		.loop_start_50
.loop_start_50:
			## assign
			movq	%r13, %r8
			## assign
			movq	%r12, %r11
			## use lt_helper to compare %r8 < %r11
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
			## branch .loop_body_50
			test	%r8d, %r8d
			jnz		.loop_body_50
			## branch .loop_exit_50
			test	%r9d, %r9d
			jnz		.loop_exit_50
.loop_body_50:
			## assign
			movq	%r10, %r8
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
			## assign
			movq	%r13, %r8
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
			movq	%r14, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_14
			movq	$1, 24(%r8)
.asm_label_14:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_51_void
			test	%r9d, %r9d
			jnz		.dispatch_51_void
			## branch .dispatch_51_not_void
			test	%r8d, %r8d
			jnz		.dispatch_51_not_void
.dispatch_51_void:
			movq	$string_23, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_51_not_void
.dispatch_51_not_void:
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
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
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
			## assign
			movq	%r9, %r10
			## assign
			movq	%r13, %r8
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
			movq	%rax, %r11
			movl	$1, 24(%r11)
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## plus
			movl	%r9d, %r11d
			addl	%r8d, %r11d
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
			## assign
			movq	%r8, %r13
			jmp		.loop_start_50
.loop_exit_50:
			## assign
			movq	%r10, %r8
			## assign
			movq	%r8, %r9
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
.A2I_i2a_52:
			## loading param [0] into %r9
			movq	16(%rbp), %r9
			## assign
			movq	%r9, %r8
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
			movq	%rax, %r11
			movl	$0, 24(%r11)
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
			## branch .if_then_53
			test	%r8d, %r8d
			jnz		.if_then_53
			## branch .if_else_53
			test	%r10d, %r10d
			jnz		.if_else_53
.if_then_53:
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
			jmp		.if_exit_53
.if_else_53:
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
			movq	%r9, %r8
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
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_54
			test	%r10d, %r10d
			jnz		.if_then_54
			## branch .if_else_54
			test	%r8d, %r8d
			jnz		.if_else_54
.if_then_54:
			## assign
			movq	%r9, %r8
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
			## assign
			movq	%r8, %r10
			jmp		.if_exit_54
.if_else_54:
			## assign
			movq	%r9, %r8
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
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## negate
			movl	%r10d, %r11d
			negl	%r11d
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
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## mult
			movl	%r10d, %r9d
			imull	%r8d, %r9d
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
			movq	%rax, %r8
			movq	$string_19, 24(%r8)
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_15
			movq	$1, 24(%r10)
.asm_label_15:
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r10d
			xorl	$1, %r10d
			## branch .dispatch_55_void
			test	%r9d, %r9d
			jnz		.dispatch_55_void
			## branch .dispatch_55_not_void
			test	%r10d, %r10d
			jnz		.dispatch_55_not_void
.dispatch_55_void:
			movq	$string_24, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_55_not_void
.dispatch_55_not_void:
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r10
			jmp		.if_exit_54
.if_exit_54:
			## assign
			movq	%r10, %r8
			jmp		.if_exit_53
.if_exit_53:
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
.A2I_i2a_aux_56:
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
			movq	%rax, %r8
			movl	$0, 24(%r8)
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
			## branch .if_then_57
			test	%r8d, %r8d
			jnz		.if_then_57
			## branch .if_else_57
			test	%r9d, %r9d
			jnz		.if_else_57
.if_then_57:
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
			movq	$string_16, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_57
.if_else_57:
			## assign
			movq	%r12, %r8
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
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_16
			movq	$string_25, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_16:
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
			movq	%rax, %r10
			movl	$10, 24(%r10)
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## mult
			movl	%r9d, %r10d
			imull	%r8d, %r10d
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
			## unbox value of %r13 into %r10
			movq	24(%r13), %r10
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
			## storing method result in %r10
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
			jnz		.asm_label_17
			movq	$1, 24(%r8)
.asm_label_17:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_58_void
			test	%r9d, %r9d
			jnz		.dispatch_58_void
			## branch .dispatch_58_not_void
			test	%r8d, %r8d
			jnz		.dispatch_58_not_void
.dispatch_58_void:
			movq	$string_26, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_58_not_void
.dispatch_58_not_void:
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
			## storing method result in %r9
			movq	%rax, %r9
			## assign
			movq	%r9, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_57
.if_exit_57:
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

.globl B.method5
B.method5:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.B_method5_59:
			## loading param [0] into %r10
			movq	16(%rbp), %r10
			## assign
			movq	%r10, %r9
			## assign
			movq	%r10, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## mult
			movl	%r10d, %r8d
			imull	%r9d, %r8d
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
			movq	%r9, %r8
			## assign
			movq	%r8, %r9
			## storing param [0]
			pushq	%r9
			## new E
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	E..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_18
			movq	$1, 24(%r8)
.asm_label_18:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_60_void
			test	%r9d, %r9d
			jnz		.dispatch_60_void
			## branch .dispatch_60_not_void
			test	%r8d, %r8d
			jnz		.dispatch_60_not_void
.dispatch_60_void:
			movq	$string_27, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_60_not_void
.dispatch_60_not_void:
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
			## find method set_var in vtable[6]
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

.globl C.method5
C.method5:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.C_method5_61:
			## loading param [0] into %r12
			movq	16(%rbp), %r12
			## assign
			movq	%r12, %r9
			## assign
			movq	%r12, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## mult
			movl	%r10d, %r8d
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
			movq	%r12, %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## mult
			movl	%r9d, %r10d
			imull	%r8d, %r10d
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
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r8
			## storing param [0]
			pushq	%r8
			## new E
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	E..new
			## restore self ptr
			popq	%rbx
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
			movq	%rax, %r9
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_19
			movq	$1, 24(%r9)
.asm_label_19:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_62_void
			test	%r8d, %r8d
			jnz		.dispatch_62_void
			## branch .dispatch_62_not_void
			test	%r9d, %r9d
			jnz		.dispatch_62_not_void
.dispatch_62_void:
			movq	$string_28, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_62_not_void
.dispatch_62_not_void:
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
			## find method set_var in vtable[6]
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
			## assign
			movq	%r8, %r9
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

.globl C.method6
C.method6:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.C_method6_63:
			## loading param [0] into %r8
			movq	16(%rbp), %r8
			## assign
			movq	%r8, %r9
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
			## assign
			movq	%r9, %r8
			## storing param [0]
			pushq	%r8
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_20
			movq	$1, 24(%r8)
.asm_label_20:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_64_void
			test	%r10d, %r10d
			jnz		.dispatch_64_void
			## branch .dispatch_64_not_void
			test	%r8d, %r8d
			jnz		.dispatch_64_not_void
.dispatch_64_void:
			movq	$string_29, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_64_not_void
.dispatch_64_not_void:
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
			## find method set_var in vtable[6]
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
			## storing method result in %r10
			movq	%rax, %r10
			## assign
			movq	%r10, %r8
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

.globl D.method7
D.method7:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.D_method7_65:
			## loading param [0] into %r8
			movq	16(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r10
			## assign
			movq	%r10, %r11
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
			## use lt_helper to compare %r11 < %r8
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
			## branch .if_then_66
			test	%r8d, %r8d
			jnz		.if_then_66
			## branch .if_else_66
			test	%r9d, %r9d
			jnz		.if_else_66
.if_then_66:
			## assign
			movq	%r10, %r9
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
			## find method method7 in vtable[12]
			movq	96(%rax), %rax
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
			movq	%r8, %r9
			jmp		.if_exit_66
.if_else_66:
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
			movq	%rax, %r9
			movl	$0, 24(%r9)
			## assign
			movq	%r10, %r8
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
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_67
			test	%r8d, %r8d
			jnz		.if_then_67
			## branch .if_else_67
			test	%r9d, %r9d
			jnz		.if_else_67
.if_then_67:
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$1, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_67
.if_else_67:
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
			movq	%rax, %r11
			movl	$1, 24(%r11)
			## assign
			movq	%r10, %r8
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
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## not
			movl	%r11d, %r8d
			xorl	$1, %r8d
			## branch .if_then_68
			test	%r11d, %r11d
			jnz		.if_then_68
			## branch .if_else_68
			test	%r8d, %r8d
			jnz		.if_else_68
.if_then_68:
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$0, 24(%r8)
			## assign
			movq	%r8, %r10
			jmp		.if_exit_68
.if_else_68:
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
			movq	%rax, %r9
			movl	$2, 24(%r9)
			## assign
			movq	%r10, %r8
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
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_69
			test	%r9d, %r9d
			jnz		.if_then_69
			## branch .if_else_69
			test	%r8d, %r8d
			jnz		.if_else_69
.if_then_69:
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$0, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_69
.if_else_69:
			## assign
			movq	%r10, %r11
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
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## minus
			movl	%r9d, %r8d
			subl	%r10d, %r8d
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
			## find method method7 in vtable[12]
			movq	96(%rax), %rax
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
			movq	%r8, %r9
			jmp		.if_exit_69
.if_exit_69:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_68
.if_exit_68:
			## assign
			movq	%r10, %r8
			jmp		.if_exit_67
.if_exit_67:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_66
.if_exit_66:
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

.globl E.method6
E.method6:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.E_method6_70:
			## loading param [0] into %r8
			movq	16(%rbp), %r8
			## assign
			movq	%r8, %r9
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
			movq	%rax, %r10
			movl	$8, 24(%r10)
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_21
			movq	$string_30, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_21:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r9d
			addq	$8, %rsp
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
			## assign
			movq	%r10, %r8
			## assign
			movq	%r8, %r9
			## storing param [0]
			pushq	%r9
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_22
			movq	$1, 24(%r8)
.asm_label_22:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_71_void
			test	%r9d, %r9d
			jnz		.dispatch_71_void
			## branch .dispatch_71_not_void
			test	%r8d, %r8d
			jnz		.dispatch_71_not_void
.dispatch_71_void:
			movq	$string_31, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_71_not_void
.dispatch_71_not_void:
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
			## find method set_var in vtable[6]
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

.globl Main.menu
Main.menu:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_menu_72:
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
			movq	$string_32, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_33, 24(%r8)
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
			movq	$string_34, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_35, 24(%r8)
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
			movq	$string_36, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_37, 24(%r8)
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
			movq	$string_38, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_39, 24(%r8)
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
			movq	$string_40, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_41, 24(%r8)
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
			movq	$string_42, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_43, 24(%r8)
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
			movq	$string_44, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_45, 24(%r8)
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
			movq	$string_46, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_47, 24(%r8)
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
			movq	$string_48, 24(%r8)
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
			movq	$string_49, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
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
			## find method in_string in vtable[6]
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

.globl Main.prompt
Main.prompt:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_prompt_73:
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
			movq	$string_50, 24(%r8)
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
			movq	$string_51, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
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
			## find method in_string in vtable[6]
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

.globl Main.get_int
Main.get_int:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_get_int_74:
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
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
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
			## find method prompt in vtable[10]
			movq	80(%rax), %rax
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
			movq	%r8, %r10
			## assign
			movq	%r10, %r8
			## storing param [0]
			pushq	%r8
			## assign
			movq	%r9, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_23
			movq	$1, 24(%r8)
.asm_label_23:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_75_void
			test	%r9d, %r9d
			jnz		.dispatch_75_void
			## branch .dispatch_75_not_void
			test	%r8d, %r8d
			jnz		.dispatch_75_not_void
.dispatch_75_void:
			movq	$string_52, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_75_not_void
.dispatch_75_not_void:
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
			movq	%r8, %r9
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

.globl Main.is_even
Main.is_even:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_is_even_76:
			## loading param [0] into %r9
			movq	16(%rbp), %r9
			## assign
			movq	%r9, %r8
			## assign
			movq	%r8, %r11
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
			movq	%rax, %r8
			movl	$0, 24(%r8)
			## use lt_helper to compare %r9 < %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_77
			test	%r9d, %r9d
			jnz		.if_then_77
			## branch .if_else_77
			test	%r8d, %r8d
			jnz		.if_else_77
.if_then_77:
			## assign
			movq	%r11, %r9
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
			## find method is_even in vtable[12]
			movq	96(%rax), %rax
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
			jmp		.if_exit_77
.if_else_77:
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
			movq	%r11, %r9
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
			## branch .if_then_78
			test	%r8d, %r8d
			jnz		.if_then_78
			## branch .if_else_78
			test	%r9d, %r9d
			jnz		.if_else_78
.if_then_78:
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$1, 24(%r8)
			## assign
			movq	%r8, %r9
			jmp		.if_exit_78
.if_else_78:
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
			movq	%r11, %r10
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
			## branch .if_then_79
			test	%r9d, %r9d
			jnz		.if_then_79
			## branch .if_else_79
			test	%r8d, %r8d
			jnz		.if_else_79
.if_then_79:
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$0, 24(%r9)
			## assign
			movq	%r9, %r8
			jmp		.if_exit_79
.if_else_79:
			## assign
			movq	%r11, %r9
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
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## minus
			movl	%r10d, %r8d
			subl	%r9d, %r8d
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
			## find method is_even in vtable[12]
			movq	96(%rax), %rax
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
			jmp		.if_exit_79
.if_exit_79:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_78
.if_exit_78:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_77
.if_exit_77:
			## assign
			movq	%r10, %r8
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

.globl Main.class_type
Main.class_type:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_class_type_80:
			## loading param [0] into %r8
			movq	16(%rbp), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_24
			movq	$1, 24(%r8)
.asm_label_24:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .case_82_void
			test	%r10d, %r10d
			jnz		.case_82_void
			## branch .case_82_not_void
			test	%r8d, %r8d
			jnz		.case_82_not_void
.case_82_void:
			movq	$string_53, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.case_82_not_void
.case_82_not_void:
			## move type tag of %r9 into %r8
			movq	0(%r9), %r8
			## check for type A
			movq	$6, %rax
			cmpq	%rax, %r8
			je		.case_81_A
			## check for type C
			movq	$9, %rax
			cmpq	%rax, %r8
			je		.case_81_C
			## check for type B
			movq	$8, %rax
			cmpq	%rax, %r8
			je		.case_81_B
			## check for type E
			movq	$11, %rax
			cmpq	%rax, %r8
			je		.case_81_E
			## check for type D
			movq	$10, %rax
			cmpq	%rax, %r8
			je		.case_81_D
			## check for type Int
			movq	$1, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
			## check for type Object
			movq	$3, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
			## check for type Bool
			movq	$0, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
			## check for type IO
			movq	$2, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
			## check for type A2I
			movq	$7, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
			## check for type Main
			movq	$5, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
			## check for type String
			movq	$4, %rax
			cmpq	%rax, %r8
			je		.case_81_Object
.case_81_A:
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
			movq	$string_54, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.case_81_exit
.case_81_B:
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
			movq	$string_55, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.case_81_exit
.case_81_C:
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
			movq	$string_56, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.case_81_exit
.case_81_D:
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
			movq	$string_57, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.case_81_exit
.case_81_E:
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
			movq	$string_58, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.case_81_exit
.case_81_Object:
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
			movq	$string_59, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.case_81_exit
.case_81_error_branch:
			movq	$string_60, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.case_81_exit:
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

.globl Main.print
Main.print:
			pushq	%rbp
			movq	%rsp, %rbp
			## allocate space to store 0 spilled regs
			subq	$0, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_print_83:
			## loading param [0] into %r9
			movq	16(%rbp), %r9
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
			movq	%rax, %r8
			## assign
			movq	%r8, %r10
			## assign
			movq	%r9, %r11
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_25
			movq	$1, 24(%r8)
.asm_label_25:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_84_void
			test	%r9d, %r9d
			jnz		.dispatch_84_void
			## branch .dispatch_84_not_void
			test	%r8d, %r8d
			jnz		.dispatch_84_not_void
.dispatch_84_void:
			movq	$string_61, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_84_not_void
.dispatch_84_not_void:
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
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## assign
			movq	%r10, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_26
			movq	$1, 24(%r8)
.asm_label_26:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_85_void
			test	%r10d, %r10d
			jnz		.dispatch_85_void
			## branch .dispatch_85_not_void
			test	%r8d, %r8d
			jnz		.dispatch_85_not_void
.dispatch_85_void:
			movq	$string_61, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_85_not_void
.dispatch_85_not_void:
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
			movq	$string_62, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
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
.Main_main_86:
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.loop_start_87
.loop_start_87:
			## load self[6] (flag) into %r8
			movq	48(%rbx), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .loop_body_87
			test	%r10d, %r10d
			jnz		.loop_body_87
			## branch .loop_exit_87
			test	%r8d, %r8d
			jnz		.loop_exit_87
.loop_body_87:
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
			movq	$string_63, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_27
			movq	$1, 24(%r9)
.asm_label_27:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_89_void
			test	%r8d, %r8d
			jnz		.dispatch_89_void
			## branch .dispatch_89_not_void
			test	%r9d, %r9d
			jnz		.dispatch_89_not_void
.dispatch_89_void:
			movq	$string_64, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_89_not_void
.dispatch_89_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## find method is_even in vtable[12]
			movq	96(%rax), %rax
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
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_88
			test	%r9d, %r9d
			jnz		.if_then_88
			## branch .if_else_88
			test	%r8d, %r8d
			jnz		.if_else_88
.if_then_88:
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
			movq	$string_65, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			jmp		.if_exit_88
.if_else_88:
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
			movq	$string_66, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			jmp		.if_exit_88
.if_exit_88:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method class_type in vtable[13]
			movq	104(%rax), %rax
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
			## find method menu in vtable[9]
			movq	72(%rax), %rax
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
			## store %r8 in self[3] (char)
			movq	%r8, 24(%rbx)
			## load self[3] (char) into %r9
			movq	24(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			movq	$string_67, 24(%r10)
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
			## branch .if_then_90
			test	%r10d, %r10d
			jnz		.if_then_90
			## branch .if_else_90
			test	%r8d, %r8d
			jnz		.if_else_90
.if_then_90:
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
			## find method get_int in vtable[11]
			movq	88(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_28
			movq	$1, 24(%r8)
.asm_label_28:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_91_void
			test	%r10d, %r10d
			jnz		.dispatch_91_void
			## branch .dispatch_91_not_void
			test	%r8d, %r8d
			jnz		.dispatch_91_not_void
.dispatch_91_void:
			movq	$string_68, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_91_not_void
.dispatch_91_not_void:
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
			## find method set_var in vtable[6]
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
			## store %r8 in self[5] (a_var)
			movq	%r8, 40(%rbx)
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_29
			movq	$1, 24(%r8)
.asm_label_29:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_92_void
			test	%r10d, %r10d
			jnz		.dispatch_92_void
			## branch .dispatch_92_not_void
			test	%r8d, %r8d
			jnz		.dispatch_92_not_void
.dispatch_92_void:
			movq	$string_69, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_92_not_void
.dispatch_92_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## load self[5] (a_var) into %r9
			movq	40(%rbx), %r9
			## assign
			movq	%r9, %r8
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_30
			movq	$1, 24(%r9)
.asm_label_30:
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_93_void
			test	%r10d, %r10d
			jnz		.dispatch_93_void
			## branch .dispatch_93_not_void
			test	%r9d, %r9d
			jnz		.dispatch_93_not_void
.dispatch_93_void:
			movq	$string_69, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_93_not_void
.dispatch_93_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [1]
			pushq	%r9
			## new B
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	B..new
			## restore self ptr
			popq	%rbx
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
			movq	%rax, %r9
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_31
			movq	$1, 24(%r9)
.asm_label_31:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_94_void
			test	%r8d, %r8d
			jnz		.dispatch_94_void
			## branch .dispatch_94_not_void
			test	%r9d, %r9d
			jnz		.dispatch_94_not_void
.dispatch_94_void:
			movq	$string_69, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_94_not_void
.dispatch_94_not_void:
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
			## find method method2 in vtable[8]
			movq	64(%rax), %rax
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.if_exit_90
.if_else_90:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_70, 24(%r8)
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
			## branch .if_then_95
			test	%r8d, %r8d
			jnz		.if_then_95
			## branch .if_else_95
			test	%r9d, %r9d
			jnz		.if_else_95
.if_then_95:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_32
			movq	$1, 24(%r8)
.asm_label_32:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .case_97_void
			test	%r10d, %r10d
			jnz		.case_97_void
			## branch .case_97_not_void
			test	%r8d, %r8d
			jnz		.case_97_not_void
.case_97_void:
			movq	$string_71, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.case_97_not_void
.case_97_not_void:
			## move type tag of %r9 into %r8
			movq	0(%r9), %r8
			## check for type A
			movq	$6, %rax
			cmpq	%rax, %r8
			je		.case_96_A
			## check for type C
			movq	$9, %rax
			cmpq	%rax, %r8
			je		.case_96_C
			## check for type B
			movq	$8, %rax
			cmpq	%rax, %r8
			je		.case_96_A
			## check for type E
			movq	$11, %rax
			cmpq	%rax, %r8
			je		.case_96_A
			## check for type D
			movq	$10, %rax
			cmpq	%rax, %r8
			je		.case_96_A
			## check for type Int
			movq	$1, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
			## check for type Object
			movq	$3, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
			## check for type Bool
			movq	$0, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
			## check for type IO
			movq	$2, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
			## check for type A2I
			movq	$7, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
			## check for type Main
			movq	$5, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
			## check for type String
			movq	$4, %rax
			cmpq	%rax, %r8
			je		.case_96_Object
.case_96_C:
			## assign
			movq	%r9, %r11
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
			jnz		.asm_label_33
			movq	$1, 24(%r8)
.asm_label_33:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_98_void
			test	%r10d, %r10d
			jnz		.dispatch_98_void
			## branch .dispatch_98_not_void
			test	%r8d, %r8d
			jnz		.dispatch_98_not_void
.dispatch_98_void:
			movq	$string_72, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_98_not_void
.dispatch_98_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			jnz		.asm_label_34
			movq	$1, 24(%r8)
.asm_label_34:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_99_void
			test	%r10d, %r10d
			jnz		.dispatch_99_void
			## branch .dispatch_99_not_void
			test	%r8d, %r8d
			jnz		.dispatch_99_not_void
.dispatch_99_void:
			movq	$string_72, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_99_not_void
.dispatch_99_not_void:
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
			## find method method6 in vtable[12]
			movq	96(%rax), %rax
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.case_96_exit
.case_96_A:
			## assign
			movq	%r9, %r8
			## assign
			movq	%r8, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_35
			movq	$1, 24(%r9)
.asm_label_35:
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## not
			movl	%r11d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_100_void
			test	%r11d, %r11d
			jnz		.dispatch_100_void
			## branch .dispatch_100_not_void
			test	%r9d, %r9d
			jnz		.dispatch_100_not_void
.dispatch_100_void:
			movq	$string_73, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_100_not_void
.dispatch_100_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r9
			## assign
			movq	%r8, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_36
			movq	$1, 24(%r8)
.asm_label_36:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_101_void
			test	%r9d, %r9d
			jnz		.dispatch_101_void
			## branch .dispatch_101_not_void
			test	%r8d, %r8d
			jnz		.dispatch_101_not_void
.dispatch_101_void:
			movq	$string_73, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_101_not_void
.dispatch_101_not_void:
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
			## find method method3 in vtable[9]
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
			## storing method result in %r8
			movq	%rax, %r8
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.case_96_exit
.case_96_Object:
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
			movq	$string_59, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
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
			jmp		.case_96_exit
.case_96_error_branch:
			movq	$string_74, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.case_96_exit:
			jmp		.if_exit_95
.if_else_95:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_75, 24(%r10)
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
			## branch .if_then_102
			test	%r9d, %r9d
			jnz		.if_then_102
			## branch .if_else_102
			test	%r8d, %r8d
			jnz		.if_else_102
.if_then_102:
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
			## find method get_int in vtable[11]
			movq	88(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_37
			movq	$1, 24(%r8)
.asm_label_37:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_103_void
			test	%r9d, %r9d
			jnz		.dispatch_103_void
			## branch .dispatch_103_not_void
			test	%r8d, %r8d
			jnz		.dispatch_103_not_void
.dispatch_103_void:
			movq	$string_76, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_103_not_void
.dispatch_103_not_void:
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
			## find method set_var in vtable[6]
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
			## store %r8 in self[5] (a_var)
			movq	%r8, 40(%rbx)
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_38
			movq	$1, 24(%r8)
.asm_label_38:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_104_void
			test	%r10d, %r10d
			jnz		.dispatch_104_void
			## branch .dispatch_104_not_void
			test	%r8d, %r8d
			jnz		.dispatch_104_not_void
.dispatch_104_void:
			movq	$string_77, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_104_not_void
.dispatch_104_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## load self[5] (a_var) into %r8
			movq	40(%rbx), %r8
			## assign
			movq	%r8, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_39
			movq	$1, 24(%r9)
.asm_label_39:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_105_void
			test	%r8d, %r8d
			jnz		.dispatch_105_void
			## branch .dispatch_105_not_void
			test	%r9d, %r9d
			jnz		.dispatch_105_not_void
.dispatch_105_void:
			movq	$string_77, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_105_not_void
.dispatch_105_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [1]
			pushq	%r8
			## new D
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	D..new
			## restore self ptr
			popq	%rbx
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
			movq	%rax, %r9
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_40
			movq	$1, 24(%r9)
.asm_label_40:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_106_void
			test	%r8d, %r8d
			jnz		.dispatch_106_void
			## branch .dispatch_106_not_void
			test	%r9d, %r9d
			jnz		.dispatch_106_not_void
.dispatch_106_void:
			movq	$string_77, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_106_not_void
.dispatch_106_not_void:
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
			## find method method4 in vtable[10]
			movq	80(%rax), %rax
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.if_exit_102
.if_else_102:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_78, 24(%r10)
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
			## branch .if_then_107
			test	%r9d, %r9d
			jnz		.if_then_107
			## branch .if_else_107
			test	%r8d, %r8d
			jnz		.if_else_107
.if_then_107:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_41
			movq	$1, 24(%r8)
.asm_label_41:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_108_void
			test	%r10d, %r10d
			jnz		.dispatch_108_void
			## branch .dispatch_108_not_void
			test	%r8d, %r8d
			jnz		.dispatch_108_not_void
.dispatch_108_void:
			movq	$string_79, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_108_not_void
.dispatch_108_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new C
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	C..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_42
			movq	$1, 24(%r8)
.asm_label_42:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_109_void
			test	%r9d, %r9d
			jnz		.dispatch_109_void
			## branch .dispatch_109_not_void
			test	%r8d, %r8d
			jnz		.dispatch_109_not_void
.dispatch_109_void:
			movq	$string_80, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_109_not_void
.dispatch_109_not_void:
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
			## static: lookup method in <static_type>..vtable
			## get ptr to vtable from static type
			movq	$A..vtable, %rax
			## find method method5in vtable[11]
			movq	88(%rax), %rax
			## call method
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.if_exit_107
.if_else_107:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_81, 24(%r8)
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
			## branch .if_then_110
			test	%r9d, %r9d
			jnz		.if_then_110
			## branch .if_else_110
			test	%r8d, %r8d
			jnz		.if_else_110
.if_then_110:
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_43
			movq	$1, 24(%r9)
.asm_label_43:
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_111_void
			test	%r10d, %r10d
			jnz		.dispatch_111_void
			## branch .dispatch_111_not_void
			test	%r9d, %r9d
			jnz		.dispatch_111_not_void
.dispatch_111_void:
			movq	$string_82, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_111_not_void
.dispatch_111_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r9
			## new C
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	C..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_44
			movq	$1, 24(%r8)
.asm_label_44:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_112_void
			test	%r10d, %r10d
			jnz		.dispatch_112_void
			## branch .dispatch_112_not_void
			test	%r8d, %r8d
			jnz		.dispatch_112_not_void
.dispatch_112_void:
			movq	$string_83, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_112_not_void
.dispatch_112_not_void:
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
			## static: lookup method in <static_type>..vtable
			## get ptr to vtable from static type
			movq	$B..vtable, %rax
			## find method method5in vtable[11]
			movq	88(%rax), %rax
			## call method
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.if_exit_110
.if_else_110:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_84, 24(%r10)
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
			## branch .if_then_113
			test	%r9d, %r9d
			jnz		.if_then_113
			## branch .if_else_113
			test	%r8d, %r8d
			jnz		.if_else_113
.if_then_113:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_45
			movq	$1, 24(%r8)
.asm_label_45:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_114_void
			test	%r10d, %r10d
			jnz		.dispatch_114_void
			## branch .dispatch_114_not_void
			test	%r8d, %r8d
			jnz		.dispatch_114_not_void
.dispatch_114_void:
			movq	$string_85, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_114_not_void
.dispatch_114_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new C
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	C..new
			## restore self ptr
			popq	%rbx
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
			movq	%rax, %r9
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_46
			movq	$1, 24(%r9)
.asm_label_46:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_115_void
			test	%r8d, %r8d
			jnz		.dispatch_115_void
			## branch .dispatch_115_not_void
			test	%r9d, %r9d
			jnz		.dispatch_115_not_void
.dispatch_115_void:
			movq	$string_86, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_115_not_void
.dispatch_115_not_void:
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
			## static: lookup method in <static_type>..vtable
			## get ptr to vtable from static type
			movq	$C..vtable, %rax
			## find method method5in vtable[11]
			movq	88(%rax), %rax
			## call method
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			jmp		.if_exit_113
.if_else_113:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_87, 24(%r10)
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
			## branch .if_then_116
			test	%r9d, %r9d
			jnz		.if_then_116
			## branch .if_else_116
			test	%r8d, %r8d
			jnz		.if_else_116
.if_then_116:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_47
			movq	$1, 24(%r9)
.asm_label_47:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_118_void
			test	%r8d, %r8d
			jnz		.dispatch_118_void
			## branch .dispatch_118_not_void
			test	%r9d, %r9d
			jnz		.dispatch_118_not_void
.dispatch_118_void:
			movq	$string_88, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_118_not_void
.dispatch_118_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new D
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	D..new
			## restore self ptr
			popq	%rbx
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
			movq	%rax, %r9
			## check if %r10 is void and set result accordingly
			cmpq	$0, %r10
			jnz		.asm_label_48
			movq	$1, 24(%r9)
.asm_label_48:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_119_void
			test	%r8d, %r8d
			jnz		.dispatch_119_void
			## branch .dispatch_119_not_void
			test	%r9d, %r9d
			jnz		.dispatch_119_not_void
.dispatch_119_void:
			movq	$string_88, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_119_not_void
.dispatch_119_not_void:
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
			## find method method7 in vtable[12]
			movq	96(%rax), %rax
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
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_117
			test	%r8d, %r8d
			jnz		.if_then_117
			## branch .if_else_117
			test	%r9d, %r9d
			jnz		.if_else_117
.if_then_117:
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
			movq	$string_63, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_89, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_117
.if_else_117:
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
			movq	$string_63, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_90, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r8, %r9
			jmp		.if_exit_117
.if_exit_117:
			jmp		.if_exit_116
.if_else_116:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_91, 24(%r10)
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
			## branch .if_then_120
			test	%r9d, %r9d
			jnz		.if_then_120
			## branch .if_else_120
			test	%r8d, %r8d
			jnz		.if_else_120
.if_then_120:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_49
			movq	$1, 24(%r8)
.asm_label_49:
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_121_void
			test	%r10d, %r10d
			jnz		.dispatch_121_void
			## branch .dispatch_121_not_void
			test	%r8d, %r8d
			jnz		.dispatch_121_not_void
.dispatch_121_void:
			movq	$string_92, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_121_not_void
.dispatch_121_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new E
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	E..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_50
			movq	$1, 24(%r8)
.asm_label_50:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_122_void
			test	%r9d, %r9d
			jnz		.dispatch_122_void
			## branch .dispatch_122_not_void
			test	%r8d, %r8d
			jnz		.dispatch_122_not_void
.dispatch_122_void:
			movq	$string_92, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_122_not_void
.dispatch_122_not_void:
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
			## find method method6 in vtable[13]
			movq	104(%rax), %rax
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
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r11
			## push caller-saved regs
			pushq	%rcx
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
			## check if %r11 is void and set result accordingly
			cmpq	$0, %r11
			jnz		.asm_label_51
			movq	$1, 24(%r9)
.asm_label_51:
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_123_void
			test	%r8d, %r8d
			jnz		.dispatch_123_void
			## branch .dispatch_123_not_void
			test	%r9d, %r9d
			jnz		.dispatch_123_not_void
.dispatch_123_void:
			movq	$string_93, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_123_not_void
.dispatch_123_not_void:
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
			## set receiver_obj (%r11) as self ptr (%rbx)
			movq	%r11, %rbx
			## dynamic: lookup method in vtable
			## get ptr to vtable from receiver obj
			movq	16(%r11), %rax
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing method result in %r13
			movq	%rax, %r13
			## assign
			movq	%r10, %r8
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_52
			movq	$1, 24(%r9)
.asm_label_52:
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## not
			movl	%r11d, %r9d
			xorl	$1, %r9d
			## branch .dispatch_124_void
			test	%r11d, %r11d
			jnz		.dispatch_124_void
			## branch .dispatch_124_not_void
			test	%r9d, %r9d
			jnz		.dispatch_124_not_void
.dispatch_124_void:
			movq	$string_93, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_124_not_void
.dispatch_124_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing method result in %r11
			movq	%rax, %r11
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
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## mult
			movl	%r8d, %r12d
			imull	%r11d, %r12d
			## box value of %r12 into %r9
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r9
			movq	%r12, 24(%r9)
			## unbox value of %r13 into %r8
			movq	24(%r13), %r8
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## minus
			movl	%r8d, %r9d
			subl	%r11d, %r9d
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
			movq	$string_63, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## load self[4] (avar) into %r9
			movq	32(%rbx), %r9
			## assign
			movq	%r9, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_94, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r10, %r8
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
			## find method print in vtable[14]
			movq	112(%rax), %rax
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
			movq	$string_95, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
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
			movq	%rax, %r8
			## assign
			movq	%r8, %r12
			## assign
			movq	%r11, %r8
			## storing param [0]
			pushq	%r8
			## assign
			movq	%r12, %r9
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_53
			movq	$1, 24(%r8)
.asm_label_53:
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## not
			movl	%r11d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_125_void
			test	%r11d, %r11d
			jnz		.dispatch_125_void
			## branch .dispatch_125_not_void
			test	%r8d, %r8d
			jnz		.dispatch_125_not_void
.dispatch_125_void:
			movq	$string_96, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_125_not_void
.dispatch_125_not_void:
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
			movq	$string_50, 24(%r8)
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
			## storing method result in %r8
			movq	%rax, %r8
			## assign
			movq	%r10, %r8
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			## assign
			movq	%r8, %r10
			## assign
			movq	%r10, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_120
.if_else_120:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_97, 24(%r8)
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
			## branch .if_then_126
			test	%r9d, %r9d
			jnz		.if_then_126
			## branch .if_else_126
			test	%r8d, %r8d
			jnz		.if_else_126
.if_then_126:
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r10
			jmp		.if_exit_126
.if_else_126:
			## load self[3] (char) into %r8
			movq	24(%rbx), %r8
			## assign
			movq	%r8, %r9
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
			movq	$string_98, 24(%r10)
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
			## branch .if_then_127
			test	%r9d, %r9d
			jnz		.if_then_127
			## branch .if_else_127
			test	%r8d, %r8d
			jnz		.if_else_127
.if_then_127:
			## const Bool
			## push caller-saved regs
			pushq	%rcx
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
			movl	$0, 24(%r8)
			## store %r8 in self[6] (flag)
			movq	%r8, 48(%rbx)
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_127
.if_else_127:
			## load self[4] (avar) into %r8
			movq	32(%rbx), %r8
			## assign
			movq	%r8, %r10
			## push caller-saved regs
			pushq	%rcx
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
			jnz		.asm_label_54
			movq	$1, 24(%r8)
.asm_label_54:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_128_void
			test	%r9d, %r9d
			jnz		.dispatch_128_void
			## branch .dispatch_128_not_void
			test	%r8d, %r8d
			jnz		.dispatch_128_not_void
.dispatch_128_void:
			movq	$string_99, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_128_not_void
.dispatch_128_not_void:
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
			## find method value in vtable[5]
			movq	40(%rax), %rax
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
			## storing param [0]
			pushq	%r8
			## new A
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	A..new
			## restore self ptr
			popq	%rbx
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
			jnz		.asm_label_55
			movq	$1, 24(%r8)
.asm_label_55:
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .dispatch_129_void
			test	%r9d, %r9d
			jnz		.dispatch_129_void
			## branch .dispatch_129_not_void
			test	%r8d, %r8d
			jnz		.dispatch_129_not_void
.dispatch_129_void:
			movq	$string_99, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
			jmp		.dispatch_129_not_void
.dispatch_129_not_void:
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
			## find method method1 in vtable[7]
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
			## store %r8 in self[4] (avar)
			movq	%r8, 32(%rbx)
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r8
			jmp		.if_exit_127
.if_exit_127:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_126
.if_exit_126:
			## assign
			movq	%r10, %r8
			jmp		.if_exit_120
.if_exit_120:
			jmp		.if_exit_116
.if_exit_116:
			jmp		.if_exit_113
.if_exit_113:
			jmp		.if_exit_110
.if_exit_110:
			jmp		.if_exit_107
.if_exit_107:
			jmp		.if_exit_102
.if_exit_102:
			jmp		.if_exit_95
.if_exit_95:
			jmp		.if_exit_90
.if_exit_90:
			jmp		.loop_start_87
.loop_exit_87:
			## default Object
			movq	$0, %r8
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

.globl type_name_A 
type_name_A:			## type_name string for A
			.string "A"

.globl type_name_A2I 
type_name_A2I:			## type_name string for A2I
			.string "A2I"

.globl type_name_B 
type_name_B:			## type_name string for B
			.string "B"

.globl type_name_Bool 
type_name_Bool:			## type_name string for Bool
			.string "Bool"

.globl type_name_C 
type_name_C:			## type_name string for C
			.string "C"

.globl type_name_D 
type_name_D:			## type_name string for D
			.string "D"

.globl type_name_E 
type_name_E:			## type_name string for E
			.string "E"

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

.globl string_16
string_16:
			.string ""

.globl string_55
string_55:
			.string "Class type is now B\\n"

.globl string_74
string_74:
			.string "ERROR: 361: Exception: case without matching branch: A"

.globl string_58
string_58:
			.string "Class type is now E\\n"

.globl string_83
string_83:
			.string "ERROR: 376: Exception: static dispatch on void"

.globl string_86
string_86:
			.string "ERROR: 378: Exception: static dispatch on void"

.globl string_34
string_34:
			.string "\\tTo negate "

.globl string_77
string_77:
			.string "ERROR: 372: Exception: dispatch on void"

.globl string_62
string_62:
			.string " "

.globl string_72
string_72:
			.string "ERROR: 362: Exception: dispatch on void"

.globl string_43
string_43:
			.string "...enter f:\\n"

.globl string_6
string_6:
			.string "0"

.globl string_18
string_18:
			.string "ERROR: 201: Exception: dispatch on void"

.globl string_10
string_10:
			.string "4"

.globl string_39
string_39:
			.string "...enter d:\\n"

.globl string_1
string_1:
			.string "ERROR: 28: Exception: dispatch on void"

.globl string_89
string_89:
			.string "is divisible by 3.\\n"

.globl string_71
string_71:
			.string "ERROR: 361: Exception: case on void"

.globl string_99
string_99:
			.string "ERROR: 422: Exception: dispatch on void"

.globl string_30
string_30:
			.string "ERROR: 133: Exception: division by zero"

.globl string_3
string_3:
			.string "ERROR: 47: Exception: dispatch on void"

.globl string_26
string_26:
			.string "ERROR: 244: Exception: dispatch on void"

.globl string_78
string_78:
			.string "d"

.globl string_80
string_80:
			.string "ERROR: 374: Exception: static dispatch on void"

.globl string_40
string_40:
			.string "\\tTo square "

.globl string_91
string_91:
			.string "h"

.globl string_65
string_65:
			.string "is even!\\n"

.globl string_25
string_25:
			.string "ERROR: 243: Exception: division by zero"

.globl string_90
string_90:
			.string "is not divisible by 3.\\n"

.globl string_42
string_42:
			.string "\\tTo cube "

.globl string_50
string_50:
			.string "\\n"

.globl string_51
string_51:
			.string "Please enter a number...  "

.globl string_21
string_21:
			.string "+"

.globl string_49
string_49:
			.string "\\tTo quit...enter q:\\n\\n"

.globl string_9
string_9:
			.string "3"

.globl string_60
string_60:
			.string "ERROR: 320: Exception: case without matching branch: A"

.globl string_13
string_13:
			.string "7"

.globl string_22
string_22:
			.string "ERROR: 214: Exception: dispatch on void"

.globl string_64
string_64:
			.string "ERROR: 347: Exception: dispatch on void"

.globl string_73
string_73:
			.string "ERROR: 363: Exception: dispatch on void"

.globl string_75
string_75:
			.string "c"

.globl string_36
string_36:
			.string "\\tTo find the difference between "

.globl string_38
string_38:
			.string "\\tTo find the factorial of "

.globl string_76
string_76:
			.string "ERROR: 371: Exception: dispatch on void"

.globl string_54
string_54:
			.string "Class type is now A\\n"

.globl string_28
string_28:
			.string "ERROR: 106: Exception: dispatch on void"

.globl string_35
string_35:
			.string "...enter b:\\n"

.globl string_88
string_88:
			.string "ERROR: 381: Exception: dispatch on void"

.globl string_53
string_53:
			.string "ERROR: 320: Exception: case on void"

.globl string_93
string_93:
			.string "ERROR: 399: Exception: dispatch on void"

.globl string_27
string_27:
			.string "ERROR: 84: Exception: dispatch on void"

.globl string_56
string_56:
			.string "Class type is now C\\n"

.globl string_5
string_5:
			.string "ERROR: 71: Exception: dispatch on void"

.globl string_57
string_57:
			.string "Class type is now D\\n"

.globl string_31
string_31:
			.string "ERROR: 134: Exception: dispatch on void"

.globl string_32
string_32:
			.string "\\n\\tTo add a number to "

.globl string_8
string_8:
			.string "2"

.globl string_12
string_12:
			.string "6"

.globl string_23
string_23:
			.string "ERROR: 218: Exception: dispatch on void"

.globl string_92
string_92:
			.string "ERROR: 398: Exception: dispatch on void"

.globl string_94
string_94:
			.string "is equal to "

.globl string_20
string_20:
			.string "ERROR: 202: Exception: dispatch on void"

.globl string_45
string_45:
			.string "is a multiple of 3...enter g:\\n"

.globl string_46
string_46:
			.string "\\tTo divide "

.globl string_29
string_29:
			.string "ERROR: 97: Exception: dispatch on void"

.globl string_82
string_82:
			.string "ERROR: 376: Exception: dispatch on void"

.globl string_14
string_14:
			.string "8"

.globl string_52
string_52:
			.string "ERROR: 303: Exception: dispatch on void"

.globl string_70
string_70:
			.string "b"

.globl string_87
string_87:
			.string "g"

.globl string_84
string_84:
			.string "f"

.globl string_47
string_47:
			.string "by 8...enter h:\\n"

.globl string_97
string_97:
			.string "j"

.globl string_59
string_59:
			.string "Oooops\\n"

.globl string_68
string_68:
			.string "ERROR: 357: Exception: dispatch on void"

.globl string_85
string_85:
			.string "ERROR: 378: Exception: dispatch on void"

.globl string_2
string_2:
			.string "ERROR: 37: Exception: dispatch on void"

.globl string_96
string_96:
			.string "ERROR: 408: Exception: dispatch on void"

.globl string_41
string_41:
			.string "...enter e:\\n"

.globl string_66
string_66:
			.string "is odd!\\n"

.globl string_79
string_79:
			.string "ERROR: 374: Exception: dispatch on void"

.globl string_4
string_4:
			.string "ERROR: 54: Exception: dispatch on void"

.globl string_37
string_37:
			.string "and another number...enter c:\\n"

.globl string_19
string_19:
			.string "-"

.globl string_7
string_7:
			.string "1"

.globl string_24
string_24:
			.string "ERROR: 235: Exception: dispatch on void"

.globl string_11
string_11:
			.string "5"

.globl string_15
string_15:
			.string "9"

.globl string_69
string_69:
			.string "ERROR: 358: Exception: dispatch on void"

.globl string_61
string_61:
			.string "ERROR: 333: Exception: dispatch on void"

.globl string_33
string_33:
			.string "...enter a:\\n"

.globl string_63
string_63:
			.string "number "

.globl string_48
string_48:
			.string "\\tTo get a new number...enter j:\\n"

.globl string_67
string_67:
			.string "a"

.globl string_44
string_44:
			.string "\\tTo find out if "

.globl string_81
string_81:
			.string "e"

.globl string_95
string_95:
			.string "times 8 with a remainder of "

.globl string_98
string_98:
			.string "q"

.globl string_17
string_17:
			.string "ERROR: 200: Exception: dispatch on void"

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

