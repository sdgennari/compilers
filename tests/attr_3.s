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
			## allocate space for Main (size: 17)
			movq	$8, %rsi
			movq	$17, %rdi
			call	calloc
			movq	%rax, %rbx
			## store type_tag, obj_size, vtable in %rbx
			movq	$5, %rax
			movq	%rax, 0(%rbx)
			movq	$17, %rax
			movq	%rax, 8(%rbx)
			movq	$Main..vtable, %rax
			movq	%rax, 16(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[3] (a)
			movq	%r8, 24(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[4] (b)
			movq	%r8, 32(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[5] (c)
			movq	%r8, 40(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[6] (d)
			movq	%r8, 48(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[7] (e)
			movq	%r8, 56(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[8] (f)
			movq	%r8, 64(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[9] (g)
			movq	%r8, 72(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[10] (h)
			movq	%r8, 80(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[11] (i)
			movq	%r8, 88(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[12] (j)
			movq	%r8, 96(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[13] (k)
			movq	%r8, 104(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[14] (x)
			movq	%r8, 112(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[15] (y)
			movq	%r8, 120(%rbx)
			## default Int
			movq	$0, %r8
			## store %r8 in self[16] (z)
			movq	%r8, 128(%rbx)
			## new const Int: 111
			movq	$111, %r8
			## store %r8 in self[4] (b)
			movq	%r8, 32(%rbx)
			## new const Int: 2222
			movq	$2222, %r8
			## store %r8 in self[5] (c)
			movq	%r8, 40(%rbx)
			## new const Int: 44
			movq	$44, %r8
			## store %r8 in self[6] (d)
			movq	%r8, 48(%rbx)
			## new const Int: 2
			movq	$2, %r8
			## store %r8 in self[7] (e)
			movq	%r8, 56(%rbx)
			## new const Int: 0
			movq	$0, %r8
			## store %r8 in self[8] (f)
			movq	%r8, 64(%rbx)
			## new const Int: 0
			movq	$0, %r8
			## store %r8 in self[9] (g)
			movq	%r8, 72(%rbx)
			## new const Int: 33
			movq	$33, %r8
			## store %r8 in self[10] (h)
			movq	%r8, 80(%rbx)
			## new const Int: 3095
			movq	$3095, %r8
			## store %r8 in self[12] (j)
			movq	%r8, 96(%rbx)
			## new const Int: 2
			movq	$2, %r8
			## store %r8 in self[13] (k)
			movq	%r8, 104(%rbx)
			## new const Int: 10928310
			movq	$10928310, %r8
			## store %r8 in self[15] (y)
			movq	%r8, 120(%rbx)
			## new const Int: 88
			movq	$88, %r8
			## store %r8 in self[16] (z)
			movq	%r8, 128(%rbx)
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
			movq	-16(%rbp), %rax


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
			movl	%eax, %esi
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
.Main_main_1:
			## default Int
			movq	$0, %r13
			## default Int
			movq	$0, %r10
			## default Int
			movq	$0, %r12
			## default Int
			movq	$0, %r11
			## new const Int: 2
			movq	$2, %r9
			## new const Int: 3
			movq	$3, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## new const Int: 4
			movq	$4, %r9
			## new const Int: 2
			movq	$2, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
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
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r13d
			addq	$8, %rsp
			## new const Int: 123
			movq	$123, %r8
			## mult
			movl	%r13d, %r9d
			imull	%r8d, %r9d
			## new const Int: 8
			movq	$8, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
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
			movl	%r8d, 24(%rsp)
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r13d
			addq	$8, %rsp
			## plus
			movl	%r14d, %r9d
			addl	%r13d, %r9d
			## new const Int: 4
			movq	$4, %r8
			## plus
			movl	%r9d, %r14d
			addl	%r8d, %r14d
			## new const Int: 234
			movq	$234, %r9
			## new const Int: 2
			movq	$2, %r8
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
			movl	%r9d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r13d
			addq	$8, %rsp
			## minus
			movl	%r14d, %r9d
			subl	%r13d, %r9d
			## new const Int: 1
			movq	$1, %r8
			## plus
			movl	%r9d, %r13d
			addl	%r8d, %r13d
			## negate
			movl	%r13d, %r8d
			negl	%r8d
			## assign
			movq	%r8, %r13
			## assign
			movq	%r8, %r9
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## minus
			movl	%r9d, %r14d
			subl	%r8d, %r14d
			## assign
			movq	%r12, %r9
			## assign
			movq	%r11, %r8
			## mult
			movl	%r9d, %r10d
			imull	%r8d, %r10d
			## plus
			movl	%r14d, %r8d
			addl	%r10d, %r8d
			## assign
			movq	%r8, %r10
			## assign
			movq	%r8, %r9
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## assign
			movq	%r10, %r13
			## assign
			movq	%r10, %r8
			## new const Int: 8888
			movq	$8888, %r9
			## new const Int: 8
			movq	$8, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_4
			movq	$string_2, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_4:
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
			## new const Int: 333
			movq	$333, %r8
			## plus
			movl	%r10d, %r11d
			addl	%r8d, %r11d
			## new const Int: 111
			movq	$111, %r9
			## new const Int: 2
			movq	$2, %r8
			## mult
			movl	%r9d, %r10d
			imull	%r8d, %r10d
			## new const Int: 2
			movq	$2, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_5
			movq	$string_2, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_5:
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
			## minus
			movl	%r11d, %r8d
			subl	%r9d, %r8d
			## assign
			movq	%r8, %r10
			## assign
			movq	%r8, %r9
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_6
			movq	$string_3, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_6:
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
			movl	4(%rsp), %r14d
			addq	$8, %rsp
			## assign
			movq	%r12, %r9
			## new const Int: 4
			movq	$4, %r8
			## mult
			movl	%r9d, %r11d
			imull	%r8d, %r11d
			## plus
			movl	%r14d, %r9d
			addl	%r11d, %r9d
			## new const Int: 11111
			movq	$11111, %r8
			## minus
			movl	%r9d, %r11d
			subl	%r8d, %r11d
			## assign
			movq	%r11, %r12
			## assign
			movq	%r11, %r8
			## new const Int: 22334235
			movq	$22334235, %r9
			## new const Int: 1111
			movq	$1111, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_7
			movq	$string_4, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_7:
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
			## new const Int: 8
			movq	$8, %r8
			## plus
			movl	%r11d, %r9d
			addl	%r8d, %r9d
			## assign
			movq	%r12, %r8
			## minus
			movl	%r9d, %r11d
			subl	%r8d, %r11d
			## assign
			movq	%r13, %r8
			## plus
			movl	%r11d, %r9d
			addl	%r8d, %r9d
			## assign
			movq	%r10, %r8
			## plus
			movl	%r9d, %r14d
			addl	%r8d, %r14d
			## assign
			movq	%r14, %r11
			## assign
			movq	%r14, %r8
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## plus
			movl	%r9d, %r14d
			addl	%r8d, %r14d
			## assign
			movq	%r12, %r8
			## plus
			movl	%r14d, %r9d
			addl	%r8d, %r9d
			## assign
			movq	%r11, %r8
			## plus
			movl	%r9d, %r14d
			addl	%r8d, %r14d
			## load self[7] (e) into %r8
			movq	56(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r14d, %r15d
			addl	%r9d, %r15d
			## load self[8] (f) into %r8
			movq	64(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r15d, %r14d
			addl	%r9d, %r14d
			## load self[9] (g) into %r8
			movq	72(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r14d, %r15d
			addl	%r9d, %r15d
			## load self[10] (h) into %r8
			movq	80(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r15d, %r14d
			addl	%r9d, %r14d
			## load self[14] (x) into %r8
			movq	112(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r14d, %r15d
			addl	%r9d, %r15d
			## load self[15] (y) into %r8
			movq	120(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r15d, %r14d
			addl	%r9d, %r14d
			## load self[16] (z) into %r8
			movq	128(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r14d, %r8d
			addl	%r9d, %r8d
			## store %r8 in self[7] (e)
			movq	%r8, 56(%rbx)
			## assign
			movq	%r8, %r9
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## assign
			movq	%r12, %r8
			## minus
			movl	%r14d, %ecx
			subl	%r8d, %ecx
			## assign
			movq	%r11, %r14
			## load self[15] (y) into %r8
			movq	120(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r14d, %r15d
			imull	%r9d, %r15d
			## new const Int: 3
			movq	$3, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_8
			movq	$string_5, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_8:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r8d, 24(%rsp)
			movl	%r15d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r9d
			addq	$8, %rsp
			## plus
			movl	%ecx, %r15d
			addl	%r9d, %r15d
			## new const Int: 2
			movq	$2, %r14
			## load self[13] (k) into %r8
			movq	104(%rbx), %r8
			## assign
			movq	%r8, %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_9
			movq	$string_5, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_9:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
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
			## plus
			movl	%r15d, %r9d
			addl	%r8d, %r9d
			## new const Int: 128371283
			movq	$128371283, %r8
			## minus
			movl	%r9d, %r14d
			subl	%r8d, %r14d
			## store %r14 in self[8] (f)
			movq	%r14, 64(%rbx)
			## assign
			movq	%r14, %r8
			## new const Int: 123
			movq	$123, %r9
			## new const Int: 111
			movq	$111, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_10
			movq	$string_6, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_10:
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
			movl	4(%rsp), %r14d
			addq	$8, %rsp
			## new const Int: 222
			movq	$222, %r8
			## mult
			movl	%r14d, %r9d
			imull	%r8d, %r9d
			## store %r9 in self[9] (g)
			movq	%r9, 72(%rbx)
			## assign
			movq	%r9, %r8
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## assign
			movq	%r12, %r8
			## mult
			movl	%r14d, %r9d
			imull	%r8d, %r9d
			## assign
			movq	%r11, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## load self[7] (e) into %r8
			movq	56(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r14d, %r15d
			imull	%r9d, %r15d
			## load self[8] (f) into %r8
			movq	64(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r15d, %r14d
			imull	%r9d, %r14d
			## new const Int: 222
			movq	$222, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_11
			movq	$string_7, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_11:
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
			movl	4(%rsp), %r9d
			addq	$8, %rsp
			## new const Int: 111111
			movq	$111111, %r8
			## plus
			movl	%r9d, %r14d
			addl	%r8d, %r14d
			## store %r14 in self[10] (h)
			movq	%r14, 80(%rbx)
			## assign
			movq	%r14, %r8
			## load self[16] (z) into %r8
			movq	128(%rbx), %r8
			## assign
			movq	%r8, %r15
			## assign
			movq	%r10, %r9
			## new const Int: 3918203
			movq	$3918203, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## minus
			movl	%r15d, %ecx
			subl	%r14d, %ecx
			## assign
			movq	%r12, %r14
			## load self[10] (h) into %r8
			movq	80(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r14d, %r8d
			imull	%r9d, %r8d
			## plus
			movl	%ecx, %r14d
			addl	%r8d, %r14d
			## load self[11] (i) into %r8
			movq	88(%rbx), %r8
			## assign
			movq	%r8, %r9
			## minus
			movl	%r14d, %r15d
			subl	%r9d, %r15d
			## load self[12] (j) into %r8
			movq	96(%rbx), %r8
			## assign
			movq	%r8, %r9
			## new const Int: 111
			movq	$111, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_12
			movq	$string_8, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_12:
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
			movl	4(%rsp), %r14d
			addq	$8, %rsp
			## plus
			movl	%r15d, %r8d
			addl	%r14d, %r8d
			## store %r8 in self[11] (i)
			movq	%r8, 88(%rbx)
			## assign
			movq	%r8, %r9
			## load self[16] (z) into %r8
			movq	128(%rbx), %r8
			## assign
			movq	%r8, %r14
			## load self[14] (x) into %r8
			movq	112(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r14d, %r15d
			imull	%r9d, %r15d
			## load self[15] (y) into %r8
			movq	120(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r15d, %r14d
			addl	%r9d, %r14d
			## assign
			movq	%r10, %r8
			## minus
			movl	%r14d, %r15d
			subl	%r8d, %r15d
			## load self[7] (e) into %r8
			movq	56(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r15d, %ecx
			addl	%r9d, %ecx
			## load self[8] (f) into %r8
			movq	64(%rbx), %r8
			## assign
			movq	%r8, %r14
			## load self[9] (g) into %r8
			movq	72(%rbx), %r8
			## assign
			movq	%r8, %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_13
			movq	$string_9, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_13:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
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
			## plus
			movl	%ecx, %r14d
			addl	%r8d, %r14d
			## load self[13] (k) into %r8
			movq	104(%rbx), %r8
			## assign
			movq	%r8, %r9
			## minus
			movl	%r14d, %r15d
			subl	%r9d, %r15d
			## load self[11] (i) into %r8
			movq	88(%rbx), %r8
			## assign
			movq	%r8, %r9
			## new const Int: 222222
			movq	$222222, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## plus
			movl	%r15d, %r8d
			addl	%r14d, %r8d
			## store %r8 in self[12] (j)
			movq	%r8, 96(%rbx)
			## assign
			movq	%r8, %r9
			## new const Int: 102193
			movq	$102193, %r9
			## new const Int: 123123
			movq	$123123, %r8
			## mult
			movl	%r9d, %r14d
			imull	%r8d, %r14d
			## new const Int: 6359
			movq	$6359, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_14
			movq	$string_10, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_14:
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
			movl	4(%rsp), %r9d
			addq	$8, %rsp
			## new const Int: 49594
			movq	$49594, %r8
			## minus
			movl	%r9d, %r14d
			subl	%r8d, %r14d
			## new const Int: 3
			movq	$3, %r8
			## plus
			movl	%r14d, %r9d
			addl	%r8d, %r9d
			## store %r9 in self[13] (k)
			movq	%r9, 104(%rbx)
			## assign
			movq	%r9, %r8
			## new const Int: 388338
			movq	$388338, %r9
			## new const Int: 333
			movq	$333, %r8
			## divide
			## if %r8d not zero, jmp over error
			cmpl	$0, %r8d
			jnz		.asm_label_15
			movq	$string_11, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_15:
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
			movl	4(%rsp), %r14d
			addq	$8, %rsp
			## assign
			movq	%r11, %r8
			## minus
			movl	%r14d, %r9d
			subl	%r8d, %r9d
			## store %r9 in self[14] (x)
			movq	%r9, 112(%rbx)
			## assign
			movq	%r9, %r8
			## load self[9] (g) into %r8
			movq	72(%rbx), %r8
			## assign
			movq	%r8, %r14
			## load self[10] (h) into %r8
			movq	80(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r14d, %r15d
			imull	%r9d, %r15d
			## load self[11] (i) into %r8
			movq	88(%rbx), %r8
			## assign
			movq	%r8, %r9
			## mult
			movl	%r15d, %ecx
			imull	%r9d, %ecx
			## load self[12] (j) into %r8
			movq	96(%rbx), %r8
			## assign
			movq	%r8, %r14
			## load self[13] (k) into %r8
			movq	104(%rbx), %r8
			## assign
			movq	%r8, %r9
			## divide
			## if %r9d not zero, jmp over error
			cmpl	$0, %r9d
			jnz		.asm_label_16
			movq	$string_12, %rdi
			call	raw_out_string
			movq	$0, %rax
			call	exit
.asm_label_16:
			subq	$8, %rsp
			pushq	%rdx
			pushq	%rax
			pushq	%rcx
			movl	%r9d, 24(%rsp)
			movl	%r14d, %eax
			cltd
			movl	24(%rsp), %ecx
			idivl	%ecx
			movl	%eax, 28(%rsp)
			popq	%rcx
			popq	%rax
			popq	%rdx
			movl	4(%rsp), %r15d
			addq	$8, %rsp
			## new const Int: 123
			movq	$123, %r8
			## mult
			movl	%r15d, %r9d
			imull	%r8d, %r9d
			## plus
			movl	%ecx, %r14d
			addl	%r9d, %r14d
			## assign
			movq	%r13, %r8
			## plus
			movl	%r14d, %r9d
			addl	%r8d, %r9d
			## assign
			movq	%r10, %r8
			## plus
			movl	%r9d, %r14d
			addl	%r8d, %r14d
			## assign
			movq	%r12, %r8
			## plus
			movl	%r14d, %r9d
			addl	%r8d, %r9d
			## store %r9 in self[15] (y)
			movq	%r9, 120(%rbx)
			## assign
			movq	%r9, %r8
			## assign
			movq	%r13, %r9
			## assign
			movq	%r10, %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## assign
			movq	%r12, %r8
			## plus
			movl	%r10d, %r9d
			addl	%r8d, %r9d
			## assign
			movq	%r11, %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## load self[7] (e) into %r8
			movq	56(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## load self[8] (f) into %r8
			movq	64(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r11d, %r10d
			addl	%r9d, %r10d
			## load self[9] (g) into %r8
			movq	72(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## load self[10] (h) into %r8
			movq	80(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r11d, %r10d
			addl	%r9d, %r10d
			## load self[11] (i) into %r8
			movq	88(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## load self[14] (x) into %r8
			movq	112(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r11d, %r10d
			addl	%r9d, %r10d
			## load self[15] (y) into %r8
			movq	120(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r10d, %r11d
			addl	%r9d, %r11d
			## load self[16] (z) into %r8
			movq	128(%rbx), %r8
			## assign
			movq	%r8, %r9
			## plus
			movl	%r11d, %r8d
			addl	%r9d, %r8d
			## store %r8 in self[16] (z)
			movq	%r8, 128(%rbx)
			## assign
			movq	%r8, %r9
			## assign
			movq	%r9, %r10
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
			## check type tag
			movq	(%rbx), %rax
			cmpq	$1, %rax
			je		copy_int
copy_object:
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
			jmp		copy_exit
copy_int:
			movq	24(%rbx), %rax
			jmp		copy_exit
copy_exit:
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
			## result from strlen already in rax
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
			## move param[0] into rsi
			movq	16(%rbp), %rsi
			## move param[1] into rdx
			movq	24(%rbp), %rdx
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

.globl string_11
string_11:
			.string "ERROR: 34: Exception: division by zero"

.globl string_5
string_5:
			.string "ERROR: 28: Exception: division by zero"

.globl string_6
string_6:
			.string "ERROR: 29: Exception: division by zero"

.globl string_12
string_12:
			.string "ERROR: 35: Exception: division by zero"

.globl string_10
string_10:
			.string "ERROR: 33: Exception: division by zero"

.globl string_3
string_3:
			.string "ERROR: 25: Exception: division by zero"

.globl string_4
string_4:
			.string "ERROR: 26: Exception: division by zero"

.globl string_8
string_8:
			.string "ERROR: 31: Exception: division by zero"

.globl string_2
string_2:
			.string "ERROR: 24: Exception: division by zero"

.globl string_7
string_7:
			.string "ERROR: 30: Exception: division by zero"

.globl string_9
string_9:
			.string "ERROR: 32: Exception: division by zero"

.globl string_1
string_1:
			.string "ERROR: 21: Exception: division by zero"

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

