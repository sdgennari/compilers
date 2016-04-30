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
			## use generated code to get string
			subq	$32, %rsp
			movl	$20, -16(%rbp)
			movl	$0, -12(%rbp)
			movl	-16(%rbp), %eax
			cltq
			movq	%rax, %rdi
			call	malloc
			movq	%rax, -8(%rbp)
.in_string_L5:
			call	getchar
			movb	%al, -17(%rbp)
			cmpb	$10, -17(%rbp)
			je	.in_string_L2
			cmpb	$-1, -17(%rbp)
			je	.in_string_L2
			movl	-12(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			addq	%rax, %rdx
			movzbl	-17(%rbp), %eax
			movb	%al, (%rdx)
			addl	$1, -12(%rbp)
			cmpb	$0, -17(%rbp)
			jne	.in_string_L3
			movl	$0, -12(%rbp)
			jmp	.in_string_L2
.in_string_L3:
			movl	-12(%rbp), %eax
			cmpl	-16(%rbp), %eax
			jne	.in_string_L4
			addl	$20, -16(%rbp)
			movl	-16(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	realloc
			movq	%rax, -8(%rbp)
			jmp	.in_string_L5
.in_string_L4:
			jmp	.in_string_L5
.in_string_L2:
			movl	-12(%rbp), %eax
			movslq	%eax, %rdx
			movq	-8(%rbp), %rax
			movq	%rdx, %rsi
			movq	%rax, %rdi
			call	strndup
			movq	%rax, -8(%rbp)

			## result is now stored at -8(%rbp)
			## make new box in %rax to hold the str val
			## push caller-saved regs
			pushq	%rcx
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
			## use %r8 to move value of str into box
			pushq	%r8
			movq	-8(%rbp), %r8
			movq	%r8, 24(%rax)
			popq	%r8
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
			## allocate space to store 121 spilled regs
			subq	$968, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_main_1:
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
			## store
			movq	%r8, -8(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -16(%rbp)
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
			## store
			movq	%r8, -24(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -32(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -40(%rbp)
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
			## store
			movq	%r8, -48(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -56(%rbp)
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
			## store
			movq	%r8, -64(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -72(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -80(%rbp)
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
			## store
			movq	%r8, -88(%rbp)
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
			## store
			movq	%r8, -96(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -104(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -112(%rbp)
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
			movq	%rax, %rsi
			movq	$0, 24(%rsi)
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
			movq	%rax, %r14
			movq	$0, 24(%r14)
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
			movq	%rax, %r13
			movq	$0, 24(%r13)
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
			movq	%rax, %rcx
			movq	$0, 24(%rcx)
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
			movq	%rax, %r15
			movq	$0, 24(%r15)
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
			movq	%rax, %r10
			movq	$0, 24(%r10)
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
			movq	%rax, %r9
			movq	$0, 24(%r9)
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
			movq	%rax, %r12
			movq	$0, 24(%r12)
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
			movq	%rax, %r11
			movq	$0, 24(%r11)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -968(%rbp)
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
			## store
			movq	%r8, -960(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -952(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -944(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -936(%rbp)
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
			## store
			movq	%r8, -928(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -920(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -912(%rbp)
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
			## store
			movq	%r8, -904(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -896(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -888(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -880(%rbp)
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
			## store
			movq	%r8, -872(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -864(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -856(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -848(%rbp)
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
			## store
			movq	%r8, -840(%rbp)
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
			## store
			movq	%r8, -832(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -824(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -816(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -808(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -800(%rbp)
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
			## store
			movq	%r8, -792(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -784(%rbp)
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
			## store
			movq	%r8, -776(%rbp)
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
			## store
			movq	%r8, -768(%rbp)
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
			## store
			movq	%r8, -760(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -752(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -744(%rbp)
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
			## store
			movq	%r8, -736(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -728(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -720(%rbp)
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
			## store
			movq	%r8, -712(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -704(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -696(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -688(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -680(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -672(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -664(%rbp)
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
			## store
			movq	%r8, -656(%rbp)
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
			## store
			movq	%r8, -648(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -640(%rbp)
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
			## store
			movq	%r8, -632(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -624(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -616(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -608(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -600(%rbp)
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
			## store
			movq	%r8, -592(%rbp)
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
			## store
			movq	%r8, -584(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -576(%rbp)
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
			## store
			movq	%r8, -568(%rbp)
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
			## store
			movq	%r8, -560(%rbp)
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
			## store
			movq	%r8, -552(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -544(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -536(%rbp)
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
			## store
			movq	%r8, -360(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -384(%rbp)
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
			## store
			movq	%r8, -328(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -344(%rbp)
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
			## store
			movq	%r8, -368(%rbp)
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
			## store
			movq	%r8, -392(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -336(%rbp)
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
			## store
			movq	%r8, -352(%rbp)
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
			## store
			movq	%r8, -376(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -400(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -416(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -424(%rbp)
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
			## store
			movq	%r8, -440(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -464(%rbp)
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
			## store
			movq	%r8, -408(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -432(%rbp)
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
			## store
			movq	%r8, -448(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -456(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -472(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -480(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -488(%rbp)
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
			## store
			movq	%r8, -496(%rbp)
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
			## store
			movq	%r8, -504(%rbp)
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
			## store
			movq	%r8, -512(%rbp)
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
			movq	%rax, %rdi
			movq	$0, 24(%rdi)
			## store
			movq	%rdi, -520(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -528(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -168(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -184(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -120(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -136(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -152(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -192(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -128(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -144(%rbp)
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
			## store
			movq	%r8, -160(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -176(%rbp)
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
			## store
			movq	%r8, -208(%rbp)
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
			## store
			movq	%r8, -224(%rbp)
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
			## store
			movq	%r8, -240(%rbp)
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
			## store
			movq	%r8, -256(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -200(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -216(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -232(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -248(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -264(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -272(%rbp)
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
			## store
			movq	%r8, -280(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
			## store
			movq	%rdx, -288(%rbp)
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
			## store
			movq	%r8, -296(%rbp)
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
			## store
			movq	%r8, -304(%rbp)
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
			## store
			movq	%r8, -312(%rbp)
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
			## store
			movq	%r8, -320(%rbp)
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
			movq	%rax, %rdx
			movq	$0, 24(%rdx)
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
			## store
			movq	%r8, -8(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -16(%rbp)
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
			## store
			movq	%r8, -24(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -32(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -40(%rbp)
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
			## assign
			movq	%r9, %r8
			## store
			movq	%r8, -48(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -56(%rbp)
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
			## store
			movq	%r8, -64(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -72(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -80(%rbp)
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
			movq	%rax, %r9
			movl	$11, 24(%r9)
			## assign
			movq	%r9, %r8
			## store
			movq	%r8, -88(%rbp)
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
			## assign
			movq	%r9, %r8
			## store
			movq	%r8, -96(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -104(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -112(%rbp)
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
			## assign
			movq	%r8, %rsi
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
			## assign
			movq	%r8, %r14
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
			## assign
			movq	%r8, %r13
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
			## assign
			movq	%r8, %rcx
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
			## assign
			movq	%r8, %r15
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
			## assign
			movq	%r8, %r10
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
			## assign
			movq	%r8, %r9
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
			## assign
			movq	%r8, %r12
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
			## assign
			movq	%r8, %r11
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -968(%rbp)
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
			movq	%rax, %rdx
			movl	$25, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -960(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -952(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -944(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -936(%rbp)
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
			movq	%rax, %rdx
			movl	$3, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -928(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -920(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -912(%rbp)
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
			movq	%rax, %rdx
			movl	$6, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -904(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -896(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -888(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -880(%rbp)
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
			movq	%rax, %rdx
			movl	$10, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -872(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -864(%rbp)
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
			movq	%rax, %r8
			movl	$12, 24(%r8)
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -856(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -848(%rbp)
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
			movq	%rax, %rdx
			movl	$14, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -840(%rbp)
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
			movq	%rax, %rdx
			movl	$15, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -832(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -824(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -816(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -808(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -800(%rbp)
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
			movq	%rax, %rdx
			movl	$20, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -792(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -784(%rbp)
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
			movq	%rax, %rdx
			movl	$22, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -776(%rbp)
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
			movq	%rax, %rdx
			movl	$23, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -768(%rbp)
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
			movq	%rax, %rdx
			movl	$24, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -760(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -752(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -744(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -736(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -728(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -720(%rbp)
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
			movq	%rax, %rdx
			movl	$4, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -712(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -704(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -696(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -688(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -680(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -672(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -664(%rbp)
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
			movq	%rax, %rdx
			movl	$11, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -656(%rbp)
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
			movq	%rax, %rdx
			movl	$12, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -648(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -640(%rbp)
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
			movq	%rax, %rdx
			movl	$14, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -632(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -624(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -616(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -608(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -600(%rbp)
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
			movq	%rax, %rdx
			movl	$19, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -592(%rbp)
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
			movq	%rax, %rdx
			movl	$20, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -584(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -576(%rbp)
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
			movq	%rax, %rdx
			movl	$22, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -568(%rbp)
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
			movq	%rax, %rdx
			movl	$23, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -560(%rbp)
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
			movq	%rax, %rdx
			movl	$24, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -552(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -544(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -536(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -360(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -384(%rbp)
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
			movq	%rax, %rdx
			movl	$3, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -328(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -344(%rbp)
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
			movq	%rax, %rdx
			movl	$5, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -368(%rbp)
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
			movq	%rax, %rdx
			movl	$6, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -392(%rbp)
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
			movq	%r8, %rdi
			## store
			movq	%rdi, -336(%rbp)
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
			movq	%rax, %rdx
			movl	$8, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -352(%rbp)
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
			movq	%rax, %rdx
			movl	$9, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -376(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -400(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -416(%rbp)
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
			movq	%rax, %r8
			movl	$12, 24(%r8)
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -424(%rbp)
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
			movq	%rax, %rdx
			movl	$13, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -440(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -464(%rbp)
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
			movq	%rax, %rdx
			movl	$15, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -408(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -432(%rbp)
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
			movq	%rax, %rdx
			movl	$17, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -448(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -456(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -472(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -480(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -488(%rbp)
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
			movq	%rax, %rdx
			movl	$22, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -496(%rbp)
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
			movq	%rax, %rdx
			movl	$23, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -504(%rbp)
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
			movq	%rax, %rdx
			movl	$24, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -512(%rbp)
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
			## assign
			movq	%r8, %rdi
			## store
			movq	%rdi, -520(%rbp)
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
			## assign
			movq	%r8, %rdx
			## store
			movq	%rdx, -528(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -168(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -184(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -120(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -136(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -152(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -192(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -128(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -144(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -160(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -176(%rbp)
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
			movq	%rax, %rdx
			movl	$0, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -208(%rbp)
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
			movq	%rax, %rdx
			movl	$0, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -224(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -240(%rbp)
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
			movq	%rax, %rdx
			movl	$0, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -256(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -200(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -216(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -232(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -248(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -264(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -272(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -280(%rbp)
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
			movq	%r8, %rdx
			## store
			movq	%rdx, -288(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -296(%rbp)
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
			movq	%rax, %rdx
			movl	$1, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -304(%rbp)
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
			movq	%rax, %rdx
			movl	$0, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -312(%rbp)
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
			movq	%rax, %rdx
			movl	$0, 24(%rdx)
			## assign
			movq	%rdx, %r8
			## store
			movq	%r8, -320(%rbp)
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## plus
			movl	%edx, %r8d
			addl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## plus
			movl	%edx, %r8d
			addl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## plus
			movl	%edx, %r8d
			addl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## plus
			movl	%edi, %r8d
			addl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## plus
			movl	%edi, %r8d
			addl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%rsi, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r14, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## assign
			movq	%r13, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## plus
			movl	%edx, %r8d
			addl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%rcx, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r15, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r10, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%r9, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## assign
			movq	%r12, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%r11, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-968(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## plus
			movl	%edx, %r8d
			addl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-960(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-952(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-944(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-936(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## plus
			movl	%edx, %r8d
			addl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-928(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-920(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-912(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-904(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-896(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-888(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-880(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-872(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-864(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-856(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-848(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-840(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-832(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-824(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-816(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-808(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-800(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-792(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-784(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-776(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-768(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-760(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-752(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-744(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-736(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-728(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-720(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-712(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-704(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-696(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-688(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-680(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-672(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-664(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-656(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-648(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-640(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-632(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-624(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-616(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-608(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-600(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-592(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-584(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-576(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-568(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-560(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-552(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-544(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-536(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## plus
			movl	%r8d, %edi
			addl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## plus
			movl	%r8d, %edx
			addl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## plus
			movl	%edi, %edx
			addl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## plus
			movl	%edx, %edi
			addl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## minus
			movl	%edx, %r8d
			subl	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## assign
			movq	%rsi, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%r14, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%r13, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%rcx, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%r15, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## assign
			movq	%r10, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%r9, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## assign
			movq	%r12, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r11, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-968(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-960(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-952(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-944(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-936(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-928(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-920(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-912(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-904(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-896(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-888(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-880(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-872(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-864(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-856(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-848(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-840(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-832(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-824(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-816(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-808(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-800(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-792(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-784(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-776(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-768(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-760(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-752(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-744(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-736(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-728(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-720(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-712(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-704(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-696(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-688(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-680(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-672(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-664(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-656(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-648(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-640(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-632(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-624(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-616(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-608(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-600(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-592(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-584(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-576(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## minus
			movl	%edi, %r8d
			subl	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-568(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-560(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-552(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-544(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-536(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## minus
			movl	%r8d, %edi
			subl	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## minus
			movl	%r8d, %edx
			subl	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## minus
			movl	%edi, %edx
			subl	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## minus
			movl	%edx, %edi
			subl	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## mult
			movl	%edx, %r8d
			imull	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## assign
			movq	%rsi, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## assign
			movq	%r14, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## mult
			movl	%edx, %r8d
			imull	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%r13, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%rcx, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## assign
			movq	%r15, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## assign
			movq	%r10, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%r9, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%r12, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## assign
			movq	%r11, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-968(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-960(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-952(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-944(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-936(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-928(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-920(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-912(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-904(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-896(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-888(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-880(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-872(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-864(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-856(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-848(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-840(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-832(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-824(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-816(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-808(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-800(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-792(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-784(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-776(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-768(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-760(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-752(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-744(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-736(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-728(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-720(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-712(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-704(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-696(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-688(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-680(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-672(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-664(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-656(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-648(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-640(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-632(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-624(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-616(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-608(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-600(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-592(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-584(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-576(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-568(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-560(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-552(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-544(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-536(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## mult
			movl	%edx, %r8d
			imull	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## mult
			movl	%edi, %edx
			imull	%r8d, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## mult
			movl	%r8d, %edx
			imull	%edi, %edx
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## mult
			movl	%edx, %r8d
			imull	%edi, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## mult
			movl	%edx, %edi
			imull	%r8d, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## mult
			movl	%r8d, %edi
			imull	%edx, %edi
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## mult
			movl	%edi, %r8d
			imull	%edx, %r8d
			## box value of %r8 into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdi)
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## mult
			movl	%edx, %r8d
			imull	%edi, %r8d
			## box value of %r8 into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdi)
			## assign
			movq	%rdi, %rdx
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## divide
			## if %edi not zero, jmp over error
			cmpl	$0, %edi
			jnz		.asm_label_1
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_1:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%edi, 24(%rsp)
			movl	%edx, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## divide
			## if %edx not zero, jmp over error
			cmpl	$0, %edx
			jnz		.asm_label_2
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_2:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%edx, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edi
			addq	$8, %rsp
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_3
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_3:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edi, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_4
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_4:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edx, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edi
			addq	$8, %rsp
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## divide
			## if %edx not zero, jmp over error
			cmpl	$0, %edx
			jnz		.asm_label_5
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_5:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%edx, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edi
			addq	$8, %rsp
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_6
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_6:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edi, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %rdi
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdx, 24(%rdi)
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## unbox value of %rdx into %rdi
			movq	24(%rdx), %rdi
			## divide
			## if %edi not zero, jmp over error
			cmpl	$0, %edi
			jnz		.asm_label_7
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_7:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%edi, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_8
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_8:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edi, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %rdi
			## unbox value of %r8 into %rdx
			movq	24(%r8), %rdx
			## unbox value of %rdi into %r8
			movq	24(%rdi), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_9
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_9:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edx, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edi
			addq	$8, %rsp
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## divide
			## if %edx not zero, jmp over error
			cmpl	$0, %edx
			jnz		.asm_label_10
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_10:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%edx, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edi
			addq	$8, %rsp
			## box value of %rdi into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%rdi, 24(%rdx)
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## unbox value of %rdi into %rdx
			movq	24(%rdi), %rdx
			## divide
			## if %edx not zero, jmp over error
			cmpl	$0, %edx
			jnz		.asm_label_11
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_11:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%edx, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edi
			addq	$8, %rsp
			## box value of %rdi into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdi, 24(%r8)
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_12
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_12:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edi, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %rdx
			## unbox value of %r8 into %rdi
			movq	24(%r8), %rdi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_13
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_13:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%edi, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%rsi, %rdx
			## unbox value of %r8 into %rsi
			movq	24(%r8), %rsi
			## unbox value of %rdx into %r8
			movq	24(%rdx), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_14
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_14:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%esi, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %edx
			addq	$8, %rsp
			## box value of %rdx into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%rdx, 24(%r8)
			## assign
			movq	%r14, %rdx
			## unbox value of %r8 into %r14
			movq	24(%r8), %r14
			## unbox value of %rdx into %rsi
			movq	24(%rdx), %rsi
			## divide
			## if %esi not zero, jmp over error
			cmpl	$0, %esi
			jnz		.asm_label_15
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_15:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%esi, 24(%rsp)
			movl	%r14d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
			## box value of %r8 into %rdx
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%rdx)
			## assign
			movq	%r13, %r8
			## unbox value of %rdx into %r14
			movq	24(%rdx), %r14
			## unbox value of %r8 into %r13
			movq	24(%r8), %r13
			## divide
			## if %r13d not zero, jmp over error
			cmpl	$0, %r13d
			jnz		.asm_label_16
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_16:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r13d, 24(%rsp)
			movl	%r14d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
			## box value of %r8 into %r13
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
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
			movq	%r8, 24(%r13)
			## assign
			movq	%rcx, %r14
			## unbox value of %r13 into %r8
			movq	24(%r13), %r8
			## unbox value of %r14 into %r13
			movq	24(%r14), %r13
			## divide
			## if %r13d not zero, jmp over error
			cmpl	$0, %r13d
			jnz		.asm_label_17
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_17:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r13d, 24(%rsp)
			movl	%r8d, %eax
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
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
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
			movq	%r15, %r13
			## unbox value of %r8 into %r14
			movq	24(%r8), %r14
			## unbox value of %r13 into %r8
			movq	24(%r13), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_18
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_18:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r14d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r13d
			addq	$8, %rsp
			## box value of %r13 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%r13, 24(%r8)
			## assign
			movq	%r10, %r13
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r13 into %r8
			movq	24(%r13), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_19
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_19:
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
			movl	4(%rsp), %r13d
			addq	$8, %rsp
			## box value of %r13 into %r8
			## push caller-saved regs
			pushq	%rcx
			pushq	%rdx
			pushq	%rsi
			pushq	%rdi
			pushq	%r8
			pushq	%r9
			pushq	%r10
			pushq	%r11
			## push self ptr
			pushq	%rbx
			call	Int..new
			## restore self ptr
			popq	%rbx
			## pop caller-saved regs
			popq	%r11
			popq	%r10
			popq	%r9
			popq	%r8
			popq	%rdi
			popq	%rsi
			popq	%rdx
			popq	%rcx
			movq	%rax, %r8
			movq	%r13, 24(%r8)
			## assign
			movq	%r9, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r13
			movq	24(%r10), %r13
			## divide
			## if %r13d not zero, jmp over error
			cmpl	$0, %r13d
			jnz		.asm_label_20
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_20:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r13d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	%r12, %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_21
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_21:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	%r11, %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_22
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_22:
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
			movq	-968(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_23
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_23:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-960(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_24
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_24:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-952(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_25
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_25:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-944(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_26
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_26:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r11d
			addq	$8, %rsp
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
			movq	-936(%rbp), %rdx
			## assign
			movq	%rdx, %r11
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_27
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_27:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-928(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_28
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_28:
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
			movq	-920(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_29
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_29:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
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
			movq	-912(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## divide
			## if %r11d not zero, jmp over error
			cmpl	$0, %r11d
			jnz		.asm_label_30
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_30:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r11d, 24(%rsp)
			movl	%r10d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-904(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_31
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_31:
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
			## load
			movq	-896(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_32
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_32:
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
			## load
			movq	-888(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_33
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_33:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-880(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_34
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_34:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-872(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_35
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_35:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-864(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_36
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_36:
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
			## load
			movq	-856(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_37
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_37:
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
			## load
			movq	-848(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_38
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_38:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-840(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_39
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_39:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_40
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_40:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-824(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_41
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_41:
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
			## load
			movq	-816(%rbp), %rdi
			## assign
			movq	%rdi, %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_42
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_42:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-808(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_43
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_43:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-800(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_44
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_44:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-792(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_45
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_45:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-784(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_46
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_46:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-776(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_47
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_47:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-768(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## divide
			## if %r11d not zero, jmp over error
			cmpl	$0, %r11d
			jnz		.asm_label_48
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_48:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r11d, 24(%rsp)
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
			movq	-760(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_49
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_49:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-752(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_50
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_50:
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
			movq	-744(%rbp), %rdi
			## assign
			movq	%rdi, %r11
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_51
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_51:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-736(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_52
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_52:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-728(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_53
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_53:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-720(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_54
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_54:
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
			movl	4(%rsp), %r11d
			addq	$8, %rsp
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
			movq	-712(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_55
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_55:
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
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-704(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_56
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_56:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-696(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_57
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_57:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-688(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## divide
			## if %r11d not zero, jmp over error
			cmpl	$0, %r11d
			jnz		.asm_label_58
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_58:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r11d, 24(%rsp)
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
			## load
			movq	-680(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_59
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_59:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-672(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_60
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_60:
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
			movq	-664(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_61
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_61:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-656(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_62
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_62:
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
			movq	-648(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_63
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_63:
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
			movq	-640(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## divide
			## if %r11d not zero, jmp over error
			cmpl	$0, %r11d
			jnz		.asm_label_64
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_64:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r11d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-632(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_65
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_65:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-624(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_66
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_66:
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
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-616(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_67
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_67:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-608(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_68
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_68:
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
			## load
			movq	-600(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r11
			movq	24(%r8), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_69
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_69:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			## assign
			movq	%r8, %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_70
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_70:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-584(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_71
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_71:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-576(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_72
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_72:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_73
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_73:
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
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-560(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_74
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_74:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-552(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_75
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_75:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-544(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_76
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_76:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-536(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_77
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_77:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_78
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_78:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_79
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_79:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_80
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_80:
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
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_81
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_81:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r11d
			addq	$8, %rsp
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
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_82
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_82:
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
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_83
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_83:
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
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_84
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_84:
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
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r11
			movq	24(%r10), %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_85
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_85:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r11d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r11 into %r9
			movq	24(%r11), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_86
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_86:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_87
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_87:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_88
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_88:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_89
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_89:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_90
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_90:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_91
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_91:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_92
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_92:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r8d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_93
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_93:
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
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_94
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_94:
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
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_95
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_95:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_96
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_96:
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
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_97
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_97:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r11d
			addq	$8, %rsp
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
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r8 into %r10
			movq	24(%r8), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_98
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_98:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %r10
			## unbox value of %r9 into %r11
			movq	24(%r9), %r11
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_99
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_99:
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
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_100
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_100:
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
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %r11
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## divide
			## if %r10d not zero, jmp over error
			cmpl	$0, %r10d
			jnz		.asm_label_101
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_101:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r10d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r8d
			addq	$8, %rsp
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
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## unbox value of %r11 into %r10
			movq	24(%r11), %r10
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_102
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_102:
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
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## unbox value of %r8 into %r9
			movq	24(%r8), %r9
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_103
			movq	$string_1, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_103:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r10d
			addq	$8, %rsp
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
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_2
			test	%r8d, %r8d
			jnz		.if_then_2
			## branch .if_else_2
			test	%r9d, %r9d
			jnz		.if_else_2
.if_then_2:
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_3
			test	%r9d, %r9d
			jnz		.if_then_3
			## branch .if_else_3
			test	%r8d, %r8d
			jnz		.if_else_3
.if_then_3:
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_4
			test	%r8d, %r8d
			jnz		.if_then_4
			## branch .if_else_4
			test	%r9d, %r9d
			jnz		.if_else_4
.if_then_4:
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## branch .if_then_5
			test	%r8d, %r8d
			jnz		.if_then_5
			## branch .if_else_5
			test	%r9d, %r9d
			jnz		.if_else_5
.if_then_5:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_5
.if_else_5:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_5
.if_exit_5:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_4
.if_else_4:
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## branch .if_then_6
			test	%r8d, %r8d
			jnz		.if_then_6
			## branch .if_else_6
			test	%r9d, %r9d
			jnz		.if_else_6
.if_then_6:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_6
.if_else_6:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_6
.if_exit_6:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_4
.if_exit_4:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_3
.if_else_3:
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_7
			test	%r9d, %r9d
			jnz		.if_then_7
			## branch .if_else_7
			test	%r8d, %r8d
			jnz		.if_else_7
.if_then_7:
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## use lt_helper to compare %r8 < %r9
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
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_8
.if_else_8:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_8
.if_exit_8:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_7
.if_else_7:
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_9
			test	%r9d, %r9d
			jnz		.if_then_9
			## branch .if_else_9
			test	%r8d, %r8d
			jnz		.if_else_9
.if_then_9:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_9
.if_else_9:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_9
.if_exit_9:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_7
.if_exit_7:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_3
.if_exit_3:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_2
.if_else_2:
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_10
			test	%r9d, %r9d
			jnz		.if_then_10
			## branch .if_else_10
			test	%r8d, %r8d
			jnz		.if_else_10
.if_then_10:
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## branch .if_then_11
			test	%r9d, %r9d
			jnz		.if_then_11
			## branch .if_else_11
			test	%r8d, %r8d
			jnz		.if_else_11
.if_then_11:
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_12
			test	%r8d, %r8d
			jnz		.if_then_12
			## branch .if_else_12
			test	%r9d, %r9d
			jnz		.if_else_12
.if_then_12:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_12
.if_else_12:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_12
.if_exit_12:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_11
.if_else_11:
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_13
			test	%r8d, %r8d
			jnz		.if_then_13
			## branch .if_else_13
			test	%r9d, %r9d
			jnz		.if_else_13
.if_then_13:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_13
.if_else_13:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_13
.if_exit_13:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_11
.if_exit_11:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_10
.if_else_10:
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_14
			test	%r9d, %r9d
			jnz		.if_then_14
			## branch .if_else_14
			test	%r8d, %r8d
			jnz		.if_else_14
.if_then_14:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_14
.if_else_14:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_14
.if_exit_14:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_10
.if_exit_10:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_2
.if_exit_2:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## use le_helper to compare %r9 <= %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_15
			test	%r8d, %r8d
			jnz		.if_then_15
			## branch .if_else_15
			test	%r9d, %r9d
			jnz		.if_else_15
.if_then_15:
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_16
			test	%r9d, %r9d
			jnz		.if_then_16
			## branch .if_else_16
			test	%r8d, %r8d
			jnz		.if_else_16
.if_then_16:
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_17
			test	%r9d, %r9d
			jnz		.if_then_17
			## branch .if_else_17
			test	%r8d, %r8d
			jnz		.if_else_17
.if_then_17:
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## use le_helper to compare %r9 <= %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_18
			test	%r9d, %r9d
			jnz		.if_then_18
			## branch .if_else_18
			test	%r8d, %r8d
			jnz		.if_else_18
.if_then_18:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_18
.if_else_18:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_18
.if_exit_18:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_17
.if_else_17:
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## use le_helper to compare %r10 <= %r8
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
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_19
			test	%r10d, %r10d
			jnz		.if_then_19
			## branch .if_else_19
			test	%r8d, %r8d
			jnz		.if_else_19
.if_then_19:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_19
.if_else_19:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_19
.if_exit_19:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_17
.if_exit_17:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_16
.if_else_16:
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_20
			test	%r9d, %r9d
			jnz		.if_then_20
			## branch .if_else_20
			test	%r8d, %r8d
			jnz		.if_else_20
.if_then_20:
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_21
			test	%r9d, %r9d
			jnz		.if_then_21
			## branch .if_else_21
			test	%r8d, %r8d
			jnz		.if_else_21
.if_then_21:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_21
.if_else_21:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_21
.if_exit_21:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_20
.if_else_20:
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_22
			test	%r9d, %r9d
			jnz		.if_then_22
			## branch .if_else_22
			test	%r8d, %r8d
			jnz		.if_else_22
.if_then_22:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_22
.if_else_22:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_22
.if_exit_22:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_20
.if_exit_20:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_16
.if_exit_16:
			## assign
			movq	%r10, %r8
			jmp		.if_exit_15
.if_else_15:
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_23
			test	%r9d, %r9d
			jnz		.if_then_23
			## branch .if_else_23
			test	%r8d, %r8d
			jnz		.if_else_23
.if_then_23:
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## use le_helper to compare %r9 <= %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
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
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use le_helper to compare %r9 <= %r10
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
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_25
			test	%r8d, %r8d
			jnz		.if_then_25
			## branch .if_else_25
			test	%r9d, %r9d
			jnz		.if_else_25
.if_then_25:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_25
.if_else_25:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_25
.if_exit_25:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_24
.if_else_24:
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## use le_helper to compare %r9 <= %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_26
			test	%r8d, %r8d
			jnz		.if_then_26
			## branch .if_else_26
			test	%r9d, %r9d
			jnz		.if_else_26
.if_then_26:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_26
.if_else_26:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_26
.if_exit_26:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_24
.if_exit_24:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_23
.if_else_23:
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_27
			test	%r9d, %r9d
			jnz		.if_then_27
			## branch .if_else_27
			test	%r8d, %r8d
			jnz		.if_else_27
.if_then_27:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_27
.if_else_27:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_27
.if_exit_27:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_23
.if_exit_23:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_15
.if_exit_15:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_28
			test	%r8d, %r8d
			jnz		.if_then_28
			## branch .if_else_28
			test	%r9d, %r9d
			jnz		.if_else_28
.if_then_28:
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %r10
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
			## branch .if_then_29
			test	%r9d, %r9d
			jnz		.if_then_29
			## branch .if_else_29
			test	%r8d, %r8d
			jnz		.if_else_29
.if_then_29:
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %r11
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use eq_helper to compare %r11 = %r9
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
			## push lhs (%r11) and rhs (%r9)
			pushq	%r9
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
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_30
			test	%r8d, %r8d
			jnz		.if_then_30
			## branch .if_else_30
			test	%r9d, %r9d
			jnz		.if_else_30
.if_then_30:
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_31
.if_else_31:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_31
.if_exit_31:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_30
.if_else_30:
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %r10
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
			## branch .if_then_32
			test	%r9d, %r9d
			jnz		.if_then_32
			## branch .if_else_32
			test	%r8d, %r8d
			jnz		.if_else_32
.if_then_32:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_32
.if_else_32:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_32
.if_exit_32:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_30
.if_exit_30:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_29
.if_else_29:
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %r10
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
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## unbox value of %r9 into %r10
			movq	24(%r9), %r10
			## not
			movl	%r10d, %r8d
			xorl	$1, %r8d
			## branch .if_then_34
			test	%r10d, %r10d
			jnz		.if_then_34
			## branch .if_else_34
			test	%r8d, %r8d
			jnz		.if_else_34
.if_then_34:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_34
.if_else_34:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_34
.if_exit_34:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_33
.if_else_33:
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %r10
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
			## branch .if_then_35
			test	%r9d, %r9d
			jnz		.if_then_35
			## branch .if_else_35
			test	%r8d, %r8d
			jnz		.if_else_35
.if_then_35:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_35
.if_else_35:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_35
.if_exit_35:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_33
.if_exit_33:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_29
.if_exit_29:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_28
.if_else_28:
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %r9
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
			## branch .if_then_36
			test	%r9d, %r9d
			jnz		.if_then_36
			## branch .if_else_36
			test	%r8d, %r8d
			jnz		.if_else_36
.if_then_36:
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## branch .if_then_37
			test	%r9d, %r9d
			jnz		.if_then_37
			## branch .if_else_37
			test	%r8d, %r8d
			jnz		.if_else_37
.if_then_37:
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %r10
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
			## branch .if_then_38
			test	%r9d, %r9d
			jnz		.if_then_38
			## branch .if_else_38
			test	%r8d, %r8d
			jnz		.if_else_38
.if_then_38:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_38
.if_else_38:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_38
.if_exit_38:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_37
.if_else_37:
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %r10
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
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_39
.if_else_39:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_39
.if_exit_39:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_37
.if_exit_37:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_36
.if_else_36:
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_40
			test	%r9d, %r9d
			jnz		.if_then_40
			## branch .if_else_40
			test	%r8d, %r8d
			jnz		.if_else_40
.if_then_40:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_40
.if_else_40:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_40
.if_exit_40:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_36
.if_exit_36:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_28
.if_exit_28:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-360(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-384(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_41
			test	%r9d, %r9d
			jnz		.if_then_41
			## branch .if_else_41
			test	%r8d, %r8d
			jnz		.if_else_41
.if_then_41:
			## load
			movq	-328(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-344(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_42
			test	%r8d, %r8d
			jnz		.if_then_42
			## branch .if_else_42
			test	%r9d, %r9d
			jnz		.if_else_42
.if_then_42:
			## load
			movq	-336(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## load
			movq	-352(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_43
			test	%r9d, %r9d
			jnz		.if_then_43
			## branch .if_else_43
			test	%r8d, %r8d
			jnz		.if_else_43
.if_then_43:
			## load
			movq	-408(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-432(%rbp), %rdi
			## assign
			movq	%rdi, %r10
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
			## branch .if_then_44
			test	%r9d, %r9d
			jnz		.if_then_44
			## branch .if_else_44
			test	%r8d, %r8d
			jnz		.if_else_44
.if_then_44:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_44
.if_else_44:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_44
.if_exit_44:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_43
.if_else_43:
			## load
			movq	-448(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-456(%rbp), %rdi
			## assign
			movq	%rdi, %r8
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
			## branch .if_then_45
			test	%r9d, %r9d
			jnz		.if_then_45
			## branch .if_else_45
			test	%r8d, %r8d
			jnz		.if_else_45
.if_then_45:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_45
.if_else_45:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_45
.if_exit_45:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_43
.if_exit_43:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_42
.if_else_42:
			## load
			movq	-376(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-400(%rbp), %rdx
			## assign
			movq	%rdx, %r10
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
			## branch .if_then_46
			test	%r9d, %r9d
			jnz		.if_then_46
			## branch .if_else_46
			test	%r8d, %r8d
			jnz		.if_else_46
.if_then_46:
			## load
			movq	-472(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## load
			movq	-480(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## use le_helper to compare %r8 <= %r9
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r9
			movq	24(%r10), %r9
			## not
			movl	%r9d, %r8d
			xorl	$1, %r8d
			## branch .if_then_47
			test	%r9d, %r9d
			jnz		.if_then_47
			## branch .if_else_47
			test	%r8d, %r8d
			jnz		.if_else_47
.if_then_47:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_47
.if_else_47:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_47
.if_exit_47:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_46
.if_else_46:
			## load
			movq	-488(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-496(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_48
			test	%r9d, %r9d
			jnz		.if_then_48
			## branch .if_else_48
			test	%r8d, %r8d
			jnz		.if_else_48
.if_then_48:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_48
.if_else_48:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_48
.if_exit_48:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_46
.if_exit_46:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_42
.if_exit_42:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_41
.if_else_41:
			## load
			movq	-368(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-392(%rbp), %r8
			## assign
			movq	%r8, %r10
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
			## move comparison result into %r11
			movq	%rax, %r11
			## unbox value of %r11 into %r8
			movq	24(%r11), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_49
			test	%r8d, %r8d
			jnz		.if_then_49
			## branch .if_else_49
			test	%r9d, %r9d
			jnz		.if_else_49
.if_then_49:
			## load
			movq	-416(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## load
			movq	-424(%rbp), %rdi
			## assign
			movq	%rdi, %r10
			## use le_helper to compare %r8 <= %r10
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
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_50
			test	%r8d, %r8d
			jnz		.if_then_50
			## branch .if_else_50
			test	%r9d, %r9d
			jnz		.if_else_50
.if_then_50:
			## load
			movq	-504(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-512(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_51
			test	%r9d, %r9d
			jnz		.if_then_51
			## branch .if_else_51
			test	%r8d, %r8d
			jnz		.if_else_51
.if_then_51:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_51
.if_else_51:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_51
.if_exit_51:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_50
.if_else_50:
			## load
			movq	-520(%rbp), %rdi
			## assign
			movq	%rdi, %r9
			## load
			movq	-528(%rbp), %rdx
			## assign
			movq	%rdx, %r10
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
			## branch .if_then_52
			test	%r9d, %r9d
			jnz		.if_then_52
			## branch .if_else_52
			test	%r8d, %r8d
			jnz		.if_else_52
.if_then_52:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_52
.if_else_52:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_52
.if_exit_52:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_50
.if_exit_50:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_49
.if_else_49:
			## load
			movq	-440(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-464(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_53
			test	%r9d, %r9d
			jnz		.if_then_53
			## branch .if_else_53
			test	%r8d, %r8d
			jnz		.if_else_53
.if_then_53:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_53
.if_else_53:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_53
.if_exit_53:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_49
.if_exit_49:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_41
.if_exit_41:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-168(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-184(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use lt_helper to compare %r8 < %r9
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
			## branch .if_then_54
			test	%r9d, %r9d
			jnz		.if_then_54
			## branch .if_else_54
			test	%r8d, %r8d
			jnz		.if_else_54
.if_then_54:
			## load
			movq	-120(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-136(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use lt_helper to compare %r8 < %r10
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
			## branch .if_then_55
			test	%r8d, %r8d
			jnz		.if_then_55
			## branch .if_else_55
			test	%r9d, %r9d
			jnz		.if_else_55
.if_then_55:
			## load
			movq	-128(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-144(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_56
			test	%r8d, %r8d
			jnz		.if_then_56
			## branch .if_else_56
			test	%r9d, %r9d
			jnz		.if_else_56
.if_then_56:
			## load
			movq	-200(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-216(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_57
			test	%r9d, %r9d
			jnz		.if_then_57
			## branch .if_else_57
			test	%r8d, %r8d
			jnz		.if_else_57
.if_then_57:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_57
.if_else_57:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_57
.if_exit_57:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_56
.if_else_56:
			## load
			movq	-232(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-248(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_58
			test	%r9d, %r9d
			jnz		.if_then_58
			## branch .if_else_58
			test	%r8d, %r8d
			jnz		.if_else_58
.if_then_58:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_58
.if_else_58:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_58
.if_exit_58:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_56
.if_exit_56:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_55
.if_else_55:
			## load
			movq	-160(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-176(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_59
			test	%r9d, %r9d
			jnz		.if_then_59
			## branch .if_else_59
			test	%r8d, %r8d
			jnz		.if_else_59
.if_then_59:
			## load
			movq	-264(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-272(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_60
			test	%r9d, %r9d
			jnz		.if_then_60
			## branch .if_else_60
			test	%r8d, %r8d
			jnz		.if_else_60
.if_then_60:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_60
.if_else_60:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_60
.if_exit_60:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_59
.if_else_59:
			## load
			movq	-280(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-288(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_61
			test	%r8d, %r8d
			jnz		.if_then_61
			## branch .if_else_61
			test	%r9d, %r9d
			jnz		.if_else_61
.if_then_61:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_61
.if_else_61:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_61
.if_exit_61:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_59
.if_exit_59:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_55
.if_exit_55:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_54
.if_else_54:
			## load
			movq	-152(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-192(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_62
			test	%r9d, %r9d
			jnz		.if_then_62
			## branch .if_else_62
			test	%r8d, %r8d
			jnz		.if_else_62
.if_then_62:
			## load
			movq	-208(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-224(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_63
			test	%r9d, %r9d
			jnz		.if_then_63
			## branch .if_else_63
			test	%r8d, %r8d
			jnz		.if_else_63
.if_then_63:
			## load
			movq	-296(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-304(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_64
			test	%r9d, %r9d
			jnz		.if_then_64
			## branch .if_else_64
			test	%r8d, %r8d
			jnz		.if_else_64
.if_then_64:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_64
.if_else_64:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_64
.if_exit_64:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_63
.if_else_63:
			## load
			movq	-312(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-320(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use lt_helper to compare %r9 < %r10
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
			## branch .if_then_65
			test	%r9d, %r9d
			jnz		.if_then_65
			## branch .if_else_65
			test	%r8d, %r8d
			jnz		.if_else_65
.if_then_65:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_65
.if_else_65:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_65
.if_exit_65:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_63
.if_exit_63:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_62
.if_else_62:
			## load
			movq	-240(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-256(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_66
			test	%r9d, %r9d
			jnz		.if_then_66
			## branch .if_else_66
			test	%r8d, %r8d
			jnz		.if_else_66
.if_then_66:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_66
.if_else_66:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_66
.if_exit_66:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_62
.if_exit_62:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_54
.if_exit_54:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-168(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-184(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_67
			test	%r9d, %r9d
			jnz		.if_then_67
			## branch .if_else_67
			test	%r8d, %r8d
			jnz		.if_else_67
.if_then_67:
			## load
			movq	-120(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-136(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## use le_helper to compare %r9 <= %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_68
			test	%r8d, %r8d
			jnz		.if_then_68
			## branch .if_else_68
			test	%r9d, %r9d
			jnz		.if_else_68
.if_then_68:
			## load
			movq	-128(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-144(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_69
			test	%r9d, %r9d
			jnz		.if_then_69
			## branch .if_else_69
			test	%r8d, %r8d
			jnz		.if_else_69
.if_then_69:
			## load
			movq	-200(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-216(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## use le_helper to compare %r10 <= %r8
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
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_70
			test	%r8d, %r8d
			jnz		.if_then_70
			## branch .if_else_70
			test	%r9d, %r9d
			jnz		.if_else_70
.if_then_70:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_70
.if_else_70:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_70
.if_exit_70:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_69
.if_else_69:
			## load
			movq	-232(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-248(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use le_helper to compare %r8 <= %r9
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_71
			test	%r8d, %r8d
			jnz		.if_then_71
			## branch .if_else_71
			test	%r9d, %r9d
			jnz		.if_else_71
.if_then_71:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_71
.if_else_71:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_71
.if_exit_71:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_69
.if_exit_69:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_68
.if_else_68:
			## load
			movq	-160(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-176(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## use le_helper to compare %r10 <= %r8
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
			## move comparison result into %r9
			movq	%rax, %r9
			## unbox value of %r9 into %r8
			movq	24(%r9), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_72
			test	%r8d, %r8d
			jnz		.if_then_72
			## branch .if_else_72
			test	%r9d, %r9d
			jnz		.if_else_72
.if_then_72:
			## load
			movq	-264(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-272(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_73
			test	%r9d, %r9d
			jnz		.if_then_73
			## branch .if_else_73
			test	%r8d, %r8d
			jnz		.if_else_73
.if_then_73:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_73
.if_else_73:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_73
.if_exit_73:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_72
.if_else_72:
			## load
			movq	-280(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-288(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_74
			test	%r9d, %r9d
			jnz		.if_then_74
			## branch .if_else_74
			test	%r8d, %r8d
			jnz		.if_else_74
.if_then_74:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_74
.if_else_74:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_74
.if_exit_74:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_72
.if_exit_72:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_68
.if_exit_68:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_67
.if_else_67:
			## load
			movq	-152(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-192(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## use le_helper to compare %r9 <= %r8
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_75
			test	%r8d, %r8d
			jnz		.if_then_75
			## branch .if_else_75
			test	%r9d, %r9d
			jnz		.if_else_75
.if_then_75:
			## load
			movq	-208(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-224(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_76
			test	%r9d, %r9d
			jnz		.if_then_76
			## branch .if_else_76
			test	%r8d, %r8d
			jnz		.if_else_76
.if_then_76:
			## load
			movq	-296(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-304(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_77
			test	%r9d, %r9d
			jnz		.if_then_77
			## branch .if_else_77
			test	%r8d, %r8d
			jnz		.if_else_77
.if_then_77:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_77
.if_else_77:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_77
.if_exit_77:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_76
.if_else_76:
			## load
			movq	-312(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-320(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_78
			test	%r9d, %r9d
			jnz		.if_then_78
			## branch .if_else_78
			test	%r8d, %r8d
			jnz		.if_else_78
.if_then_78:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_78
.if_else_78:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_78
.if_exit_78:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_76
.if_exit_76:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_75
.if_else_75:
			## load
			movq	-240(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-256(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use le_helper to compare %r10 <= %r9
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
			## branch .if_then_79
			test	%r9d, %r9d
			jnz		.if_then_79
			## branch .if_else_79
			test	%r8d, %r8d
			jnz		.if_else_79
.if_then_79:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_79
.if_else_79:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_79
.if_exit_79:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_75
.if_exit_75:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_67
.if_exit_67:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-168(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-184(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_80
			test	%r9d, %r9d
			jnz		.if_then_80
			## branch .if_else_80
			test	%r8d, %r8d
			jnz		.if_else_80
.if_then_80:
			## load
			movq	-120(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-136(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_81
			test	%r9d, %r9d
			jnz		.if_then_81
			## branch .if_else_81
			test	%r8d, %r8d
			jnz		.if_else_81
.if_then_81:
			## load
			movq	-128(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-144(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_82
			test	%r9d, %r9d
			jnz		.if_then_82
			## branch .if_else_82
			test	%r8d, %r8d
			jnz		.if_else_82
.if_then_82:
			## load
			movq	-200(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-216(%rbp), %rdx
			## assign
			movq	%rdx, %r10
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
			## branch .if_then_83
			test	%r9d, %r9d
			jnz		.if_then_83
			## branch .if_else_83
			test	%r8d, %r8d
			jnz		.if_else_83
.if_then_83:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_83
.if_else_83:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_83
.if_exit_83:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_82
.if_else_82:
			## load
			movq	-232(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-248(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_84
			test	%r9d, %r9d
			jnz		.if_then_84
			## branch .if_else_84
			test	%r8d, %r8d
			jnz		.if_else_84
.if_then_84:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_84
.if_else_84:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_84
.if_exit_84:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_82
.if_exit_82:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_81
.if_else_81:
			## load
			movq	-160(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-176(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_85
			test	%r9d, %r9d
			jnz		.if_then_85
			## branch .if_else_85
			test	%r8d, %r8d
			jnz		.if_else_85
.if_then_85:
			## load
			movq	-264(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## load
			movq	-272(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_86
			test	%r9d, %r9d
			jnz		.if_then_86
			## branch .if_else_86
			test	%r8d, %r8d
			jnz		.if_else_86
.if_then_86:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_86
.if_else_86:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_86
.if_exit_86:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_85
.if_else_85:
			## load
			movq	-280(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-288(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_87
			test	%r8d, %r8d
			jnz		.if_then_87
			## branch .if_else_87
			test	%r9d, %r9d
			jnz		.if_else_87
.if_then_87:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_87
.if_else_87:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_87
.if_exit_87:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_85
.if_exit_85:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_81
.if_exit_81:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_80
.if_else_80:
			## load
			movq	-152(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-192(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_88
			test	%r8d, %r8d
			jnz		.if_then_88
			## branch .if_else_88
			test	%r9d, %r9d
			jnz		.if_else_88
.if_then_88:
			## load
			movq	-208(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-224(%rbp), %r8
			## assign
			movq	%r8, %r10
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
			## branch .if_then_89
			test	%r9d, %r9d
			jnz		.if_then_89
			## branch .if_else_89
			test	%r8d, %r8d
			jnz		.if_else_89
.if_then_89:
			## load
			movq	-296(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-304(%rbp), %r8
			## assign
			movq	%r8, %r9
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
			## branch .if_then_90
			test	%r9d, %r9d
			jnz		.if_then_90
			## branch .if_else_90
			test	%r8d, %r8d
			jnz		.if_else_90
.if_then_90:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_90
.if_else_90:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_90
.if_exit_90:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_89
.if_else_89:
			## load
			movq	-312(%rbp), %r8
			## assign
			movq	%r8, %r11
			## load
			movq	-320(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use eq_helper to compare %r11 = %r9
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
			## push lhs (%r11) and rhs (%r9)
			pushq	%r9
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
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_91
			test	%r8d, %r8d
			jnz		.if_then_91
			## branch .if_else_91
			test	%r9d, %r9d
			jnz		.if_else_91
.if_then_91:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_91
.if_else_91:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r9
			jmp		.if_exit_91
.if_exit_91:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_89
.if_exit_89:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_88
.if_else_88:
			## load
			movq	-240(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-256(%rbp), %r8
			## assign
			movq	%r8, %r9
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
			## branch .if_then_92
			test	%r9d, %r9d
			jnz		.if_then_92
			## branch .if_else_92
			test	%r8d, %r8d
			jnz		.if_else_92
.if_then_92:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_92
.if_else_92:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_92
.if_exit_92:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_88
.if_exit_88:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_80
.if_exit_80:
			## assign
			movq	%rdx, %r8
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
			## load
			movq	-168(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-184(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_93
			test	%r8d, %r8d
			jnz		.if_then_93
			## branch .if_else_93
			test	%r9d, %r9d
			jnz		.if_else_93
.if_then_93:
			## load
			movq	-120(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-136(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## use lt_helper to compare %r8 < %r10
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
			## branch .if_then_94
			test	%r8d, %r8d
			jnz		.if_then_94
			## branch .if_else_94
			test	%r9d, %r9d
			jnz		.if_else_94
.if_then_94:
			## load
			movq	-128(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-144(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use le_helper to compare %r8 <= %r9
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
			## load
			movq	-200(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-216(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_96
			test	%r8d, %r8d
			jnz		.if_then_96
			## branch .if_else_96
			test	%r9d, %r9d
			jnz		.if_else_96
.if_then_96:
			## load
			movq	-8(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_96
.if_else_96:
			## load
			movq	-16(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_96
.if_exit_96:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_95
.if_else_95:
			## load
			movq	-232(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-248(%rbp), %rdx
			## assign
			movq	%rdx, %r10
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
			## branch .if_then_97
			test	%r8d, %r8d
			jnz		.if_then_97
			## branch .if_else_97
			test	%r9d, %r9d
			jnz		.if_else_97
.if_then_97:
			## load
			movq	-24(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_97
.if_else_97:
			## load
			movq	-32(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_97
.if_exit_97:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_95
.if_exit_95:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_94
.if_else_94:
			## load
			movq	-160(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-176(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_98
			test	%r8d, %r8d
			jnz		.if_then_98
			## branch .if_else_98
			test	%r9d, %r9d
			jnz		.if_else_98
.if_then_98:
			## load
			movq	-264(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## load
			movq	-272(%rbp), %rdx
			## assign
			movq	%rdx, %r9
			## use le_helper to compare %r8 <= %r9
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
			## move comparison result into %r10
			movq	%rax, %r10
			## unbox value of %r10 into %r8
			movq	24(%r10), %r8
			## not
			movl	%r8d, %r9d
			xorl	$1, %r9d
			## branch .if_then_99
			test	%r8d, %r8d
			jnz		.if_then_99
			## branch .if_else_99
			test	%r9d, %r9d
			jnz		.if_else_99
.if_then_99:
			## load
			movq	-40(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_99
.if_else_99:
			## load
			movq	-48(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_99
.if_exit_99:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_98
.if_else_98:
			## load
			movq	-280(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-288(%rbp), %rdx
			## assign
			movq	%rdx, %r8
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
			## branch .if_then_100
			test	%r9d, %r9d
			jnz		.if_then_100
			## branch .if_else_100
			test	%r8d, %r8d
			jnz		.if_else_100
.if_then_100:
			## load
			movq	-56(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_100
.if_else_100:
			## load
			movq	-64(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_100
.if_exit_100:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_98
.if_exit_98:
			## assign
			movq	%r9, %r10
			jmp		.if_exit_94
.if_exit_94:
			## assign
			movq	%r10, %r8
			jmp		.if_exit_93
.if_else_93:
			## load
			movq	-152(%rbp), %rdx
			## assign
			movq	%rdx, %r10
			## load
			movq	-192(%rbp), %rdx
			## assign
			movq	%rdx, %r9
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
			## branch .if_then_101
			test	%r9d, %r9d
			jnz		.if_then_101
			## branch .if_else_101
			test	%r8d, %r8d
			jnz		.if_else_101
.if_then_101:
			## load
			movq	-208(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-224(%rbp), %r8
			## assign
			movq	%r8, %r10
			## use le_helper to compare %r9 <= %r10
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
			## branch .if_then_102
			test	%r9d, %r9d
			jnz		.if_then_102
			## branch .if_else_102
			test	%r8d, %r8d
			jnz		.if_else_102
.if_then_102:
			## load
			movq	-296(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-304(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_103
			test	%r9d, %r9d
			jnz		.if_then_103
			## branch .if_else_103
			test	%r8d, %r8d
			jnz		.if_else_103
.if_then_103:
			## load
			movq	-72(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_103
.if_else_103:
			## load
			movq	-80(%rbp), %rdx
			## assign
			movq	%rdx, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_103
.if_exit_103:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_102
.if_else_102:
			## load
			movq	-312(%rbp), %r8
			## assign
			movq	%r8, %r9
			## load
			movq	-320(%rbp), %r8
			## assign
			movq	%r8, %r10
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
			## branch .if_then_104
			test	%r9d, %r9d
			jnz		.if_then_104
			## branch .if_else_104
			test	%r8d, %r8d
			jnz		.if_else_104
.if_then_104:
			## load
			movq	-88(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_104
.if_else_104:
			## load
			movq	-96(%rbp), %r8
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_104
.if_exit_104:
			## assign
			movq	%r8, %r10
			jmp		.if_exit_102
.if_exit_102:
			## assign
			movq	%r10, %r9
			jmp		.if_exit_101
.if_else_101:
			## load
			movq	-240(%rbp), %r8
			## assign
			movq	%r8, %r10
			## load
			movq	-256(%rbp), %r8
			## assign
			movq	%r8, %r9
			## use lt_helper to compare %r10 < %r9
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
			## branch .if_then_105
			test	%r9d, %r9d
			jnz		.if_then_105
			## branch .if_else_105
			test	%r8d, %r8d
			jnz		.if_else_105
.if_then_105:
			## load
			movq	-104(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_105
.if_else_105:
			## load
			movq	-112(%rbp), %rdi
			## assign
			movq	%rdi, %r8
			## assign
			movq	%r8, %rdx
			## assign
			movq	%rdx, %r8
			jmp		.if_exit_105
.if_exit_105:
			## assign
			movq	%r8, %r9
			jmp		.if_exit_101
.if_exit_101:
			## assign
			movq	%r9, %r8
			jmp		.if_exit_93
.if_exit_93:
			## assign
			movq	%rdx, %r8
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
			## assign
			movq	%r9, %r8
			## move ret val %r8 into %rax
			movq	%r8, %rax
			## pop callee-saved regs
			popq	%r15
			popq	%r14
			popq	%r13
			popq	%r12
			## remove temporary stack space for 121 spilled regs
			addq	$968, %rsp
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
			## save self reg
			pushq	%rbx
			## make new obj to store result (same as doing SELF_TYPE..new)
			movq	16(%rbx), %rax
			movq	8(%rax), %rax
			call	*%rax
			## restore self reg
			popq	%rbx
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

.globl string_1
string_1:
			.string "ERROR: 212: Exception: division by zero"

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

