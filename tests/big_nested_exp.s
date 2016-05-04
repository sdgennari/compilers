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
			## allocate space to store 390 spilled regs
			subq	$3120, %rsp
			## push callee-saved regs
			pushq	%r12
			pushq	%r13
			pushq	%r14
			pushq	%r15
.Main_main_1:
			## new const Int: 0
			movq	$0, %r8
			## store
			movq	%r8, -8(%rbp)
			## new const Int: 1
			movq	$1, %r8
			## store
			movq	%r8, -16(%rbp)
			## new const Int: 2
			movq	$2, %r8
			## store
			movq	%r8, -24(%rbp)
			## new const Int: 3
			movq	$3, %r8
			## store
			movq	%r8, -32(%rbp)
			## new const Int: 4
			movq	$4, %r8
			## store
			movq	%r8, -40(%rbp)
			## new const Int: 5
			movq	$5, %r8
			## store
			movq	%r8, -48(%rbp)
			## new const Int: 6
			movq	$6, %r8
			## store
			movq	%r8, -56(%rbp)
			## new const Int: 7
			movq	$7, %r8
			## store
			movq	%r8, -64(%rbp)
			## new const Int: 8
			movq	$8, %r8
			## store
			movq	%r8, -72(%rbp)
			## new const Int: 9
			movq	$9, %r8
			## store
			movq	%r8, -80(%rbp)
			## new const Int: 10
			movq	$10, %r8
			## store
			movq	%r8, -88(%rbp)
			## new const Int: 11
			movq	$11, %r8
			## store
			movq	%r8, -96(%rbp)
			## new const Int: 12
			movq	$12, %r8
			## store
			movq	%r8, -104(%rbp)
			## new const Int: 13
			movq	$13, %r8
			## store
			movq	%r8, -112(%rbp)
			## new const Int: 14
			movq	$14, %r8
			## store
			movq	%r8, -120(%rbp)
			## new const Int: 15
			movq	$15, %r8
			## store
			movq	%r8, -128(%rbp)
			## new const Int: 16
			movq	$16, %r8
			## store
			movq	%r8, -136(%rbp)
			## new const Int: 17
			movq	$17, %r8
			## store
			movq	%r8, -144(%rbp)
			## new const Int: 18
			movq	$18, %r8
			## store
			movq	%r8, -152(%rbp)
			## new const Int: 19
			movq	$19, %r8
			## store
			movq	%r8, -160(%rbp)
			## new const Int: 20
			movq	$20, %r8
			## store
			movq	%r8, -168(%rbp)
			## new const Int: 21
			movq	$21, %r8
			## store
			movq	%r8, -176(%rbp)
			## new const Int: 22
			movq	$22, %r8
			## store
			movq	%r8, -184(%rbp)
			## new const Int: 23
			movq	$23, %r8
			## store
			movq	%r8, -192(%rbp)
			## new const Int: 24
			movq	$24, %r8
			## store
			movq	%r8, -200(%rbp)
			## new const Int: 25
			movq	$25, %r8
			## store
			movq	%r8, -208(%rbp)
			## new const Int: 26
			movq	$26, %r8
			## store
			movq	%r8, -216(%rbp)
			## new const Int: 27
			movq	$27, %r8
			## store
			movq	%r8, -224(%rbp)
			## new const Int: 28
			movq	$28, %r8
			## store
			movq	%r8, -232(%rbp)
			## new const Int: 29
			movq	$29, %r8
			## store
			movq	%r8, -240(%rbp)
			## new const Int: 30
			movq	$30, %r8
			## store
			movq	%r8, -248(%rbp)
			## new const Int: 31
			movq	$31, %r8
			## store
			movq	%r8, -256(%rbp)
			## new const Int: 32
			movq	$32, %r8
			## store
			movq	%r8, -264(%rbp)
			## new const Int: 33
			movq	$33, %r8
			## store
			movq	%r8, -272(%rbp)
			## new const Int: 34
			movq	$34, %r8
			## store
			movq	%r8, -280(%rbp)
			## new const Int: 35
			movq	$35, %r8
			## store
			movq	%r8, -288(%rbp)
			## new const Int: 36
			movq	$36, %r8
			## store
			movq	%r8, -296(%rbp)
			## new const Int: 37
			movq	$37, %r8
			## store
			movq	%r8, -304(%rbp)
			## new const Int: 38
			movq	$38, %r8
			## store
			movq	%r8, -312(%rbp)
			## new const Int: 39
			movq	$39, %r8
			## store
			movq	%r8, -320(%rbp)
			## new const Int: 40
			movq	$40, %r8
			## store
			movq	%r8, -328(%rbp)
			## new const Int: 41
			movq	$41, %r8
			## store
			movq	%r8, -336(%rbp)
			## new const Int: 42
			movq	$42, %r8
			## store
			movq	%r8, -344(%rbp)
			## new const Int: 43
			movq	$43, %r8
			## store
			movq	%r8, -352(%rbp)
			## new const Int: 44
			movq	$44, %r8
			## store
			movq	%r8, -360(%rbp)
			## new const Int: 45
			movq	$45, %r8
			## store
			movq	%r8, -368(%rbp)
			## new const Int: 46
			movq	$46, %r8
			## store
			movq	%r8, -376(%rbp)
			## new const Int: 47
			movq	$47, %r8
			## store
			movq	%r8, -384(%rbp)
			## new const Int: 48
			movq	$48, %r8
			## store
			movq	%r8, -392(%rbp)
			## new const Int: 49
			movq	$49, %r8
			## store
			movq	%r8, -400(%rbp)
			## new const Int: 50
			movq	$50, %r8
			## store
			movq	%r8, -408(%rbp)
			## new const Int: 51
			movq	$51, %r8
			## store
			movq	%r8, -416(%rbp)
			## new const Int: 52
			movq	$52, %r8
			## store
			movq	%r8, -424(%rbp)
			## new const Int: 53
			movq	$53, %r8
			## store
			movq	%r8, -432(%rbp)
			## new const Int: 54
			movq	$54, %r8
			## store
			movq	%r8, -440(%rbp)
			## new const Int: 55
			movq	$55, %r8
			## store
			movq	%r8, -448(%rbp)
			## new const Int: 56
			movq	$56, %r8
			## store
			movq	%r8, -456(%rbp)
			## new const Int: 57
			movq	$57, %r8
			## store
			movq	%r8, -464(%rbp)
			## new const Int: 58
			movq	$58, %r8
			## store
			movq	%r8, -472(%rbp)
			## new const Int: 59
			movq	$59, %r8
			## store
			movq	%r8, -480(%rbp)
			## new const Int: 60
			movq	$60, %r8
			## store
			movq	%r8, -488(%rbp)
			## new const Int: 61
			movq	$61, %r8
			## store
			movq	%r8, -496(%rbp)
			## new const Int: 62
			movq	$62, %r8
			## store
			movq	%r8, -504(%rbp)
			## new const Int: 63
			movq	$63, %r8
			## store
			movq	%r8, -512(%rbp)
			## new const Int: 64
			movq	$64, %r8
			## store
			movq	%r8, -520(%rbp)
			## new const Int: 65
			movq	$65, %r8
			## store
			movq	%r8, -528(%rbp)
			## new const Int: 66
			movq	$66, %r8
			## store
			movq	%r8, -536(%rbp)
			## new const Int: 67
			movq	$67, %r8
			## store
			movq	%r8, -544(%rbp)
			## new const Int: 68
			movq	$68, %r8
			## store
			movq	%r8, -552(%rbp)
			## new const Int: 69
			movq	$69, %r8
			## store
			movq	%r8, -560(%rbp)
			## new const Int: 70
			movq	$70, %r8
			## store
			movq	%r8, -568(%rbp)
			## new const Int: 71
			movq	$71, %r8
			## store
			movq	%r8, -576(%rbp)
			## new const Int: 72
			movq	$72, %r8
			## store
			movq	%r8, -584(%rbp)
			## new const Int: 73
			movq	$73, %r8
			## store
			movq	%r8, -592(%rbp)
			## new const Int: 74
			movq	$74, %r8
			## store
			movq	%r8, -600(%rbp)
			## new const Int: 75
			movq	$75, %r8
			## store
			movq	%r8, -608(%rbp)
			## new const Int: 76
			movq	$76, %r8
			## store
			movq	%r8, -616(%rbp)
			## new const Int: 77
			movq	$77, %r8
			## store
			movq	%r8, -624(%rbp)
			## new const Int: 78
			movq	$78, %r8
			## store
			movq	%r8, -632(%rbp)
			## new const Int: 79
			movq	$79, %r8
			## store
			movq	%r8, -640(%rbp)
			## new const Int: 80
			movq	$80, %r8
			## store
			movq	%r8, -648(%rbp)
			## new const Int: 81
			movq	$81, %r8
			## store
			movq	%r8, -656(%rbp)
			## new const Int: 82
			movq	$82, %r8
			## store
			movq	%r8, -664(%rbp)
			## new const Int: 83
			movq	$83, %r8
			## store
			movq	%r8, -672(%rbp)
			## new const Int: 84
			movq	$84, %r8
			## store
			movq	%r8, -680(%rbp)
			## new const Int: 85
			movq	$85, %r8
			## store
			movq	%r8, -688(%rbp)
			## new const Int: 86
			movq	$86, %r8
			## store
			movq	%r8, -696(%rbp)
			## new const Int: 87
			movq	$87, %r8
			## store
			movq	%r8, -704(%rbp)
			## new const Int: 88
			movq	$88, %r8
			## store
			movq	%r8, -712(%rbp)
			## new const Int: 89
			movq	$89, %r8
			## store
			movq	%r8, -720(%rbp)
			## new const Int: 90
			movq	$90, %r8
			## store
			movq	%r8, -728(%rbp)
			## new const Int: 91
			movq	$91, %r8
			## store
			movq	%r8, -736(%rbp)
			## new const Int: 92
			movq	$92, %r8
			## store
			movq	%r8, -744(%rbp)
			## new const Int: 93
			movq	$93, %r8
			## store
			movq	%r8, -752(%rbp)
			## new const Int: 94
			movq	$94, %r8
			## store
			movq	%r8, -760(%rbp)
			## new const Int: 95
			movq	$95, %r8
			## store
			movq	%r8, -768(%rbp)
			## new const Int: 96
			movq	$96, %r8
			## store
			movq	%r8, -776(%rbp)
			## new const Int: 97
			movq	$97, %r8
			## store
			movq	%r8, -784(%rbp)
			## new const Int: 98
			movq	$98, %r8
			## store
			movq	%r8, -792(%rbp)
			## new const Int: 99
			movq	$99, %r8
			## store
			movq	%r8, -800(%rbp)
			## new const Int: 100
			movq	$100, %r8
			## store
			movq	%r8, -808(%rbp)
			## new const Int: 101
			movq	$101, %r8
			## store
			movq	%r8, -816(%rbp)
			## new const Int: 102
			movq	$102, %r8
			## store
			movq	%r8, -824(%rbp)
			## new const Int: 103
			movq	$103, %r8
			## store
			movq	%r8, -832(%rbp)
			## new const Int: 104
			movq	$104, %r8
			## store
			movq	%r8, -840(%rbp)
			## new const Int: 105
			movq	$105, %r8
			## store
			movq	%r8, -848(%rbp)
			## new const Int: 106
			movq	$106, %r8
			## store
			movq	%r8, -856(%rbp)
			## new const Int: 107
			movq	$107, %r8
			## store
			movq	%r8, -864(%rbp)
			## new const Int: 108
			movq	$108, %r8
			## store
			movq	%r8, -872(%rbp)
			## new const Int: 109
			movq	$109, %r8
			## store
			movq	%r8, -880(%rbp)
			## new const Int: 110
			movq	$110, %r8
			## store
			movq	%r8, -888(%rbp)
			## new const Int: 111
			movq	$111, %r8
			## store
			movq	%r8, -896(%rbp)
			## new const Int: 112
			movq	$112, %r8
			## store
			movq	%r8, -904(%rbp)
			## new const Int: 113
			movq	$113, %r8
			## store
			movq	%r8, -912(%rbp)
			## new const Int: 114
			movq	$114, %r8
			## store
			movq	%r8, -920(%rbp)
			## new const Int: 115
			movq	$115, %r8
			## store
			movq	%r8, -928(%rbp)
			## new const Int: 116
			movq	$116, %r8
			## store
			movq	%r8, -936(%rbp)
			## new const Int: 117
			movq	$117, %r8
			## store
			movq	%r8, -944(%rbp)
			## new const Int: 118
			movq	$118, %r8
			## store
			movq	%r8, -952(%rbp)
			## new const Int: 119
			movq	$119, %r8
			## store
			movq	%r8, -960(%rbp)
			## new const Int: 120
			movq	$120, %r8
			## store
			movq	%r8, -968(%rbp)
			## new const Int: 121
			movq	$121, %r8
			## store
			movq	%r8, -976(%rbp)
			## new const Int: 122
			movq	$122, %r8
			## store
			movq	%r8, -984(%rbp)
			## new const Int: 123
			movq	$123, %r8
			## store
			movq	%r8, -992(%rbp)
			## new const Int: 124
			movq	$124, %r8
			## store
			movq	%r8, -1000(%rbp)
			## new const Int: 125
			movq	$125, %r8
			## store
			movq	%r8, -1008(%rbp)
			## new const Int: 126
			movq	$126, %r8
			## store
			movq	%r8, -1016(%rbp)
			## new const Int: 127
			movq	$127, %r8
			## store
			movq	%r8, -1024(%rbp)
			## new const Int: 128
			movq	$128, %r8
			## store
			movq	%r8, -1032(%rbp)
			## new const Int: 129
			movq	$129, %r8
			## store
			movq	%r8, -1040(%rbp)
			## new const Int: 130
			movq	$130, %r8
			## store
			movq	%r8, -1048(%rbp)
			## new const Int: 131
			movq	$131, %r8
			## store
			movq	%r8, -1056(%rbp)
			## new const Int: 132
			movq	$132, %r8
			## store
			movq	%r8, -1064(%rbp)
			## new const Int: 133
			movq	$133, %r8
			## store
			movq	%r8, -1072(%rbp)
			## new const Int: 134
			movq	$134, %r8
			## store
			movq	%r8, -1080(%rbp)
			## new const Int: 135
			movq	$135, %r8
			## store
			movq	%r8, -1088(%rbp)
			## new const Int: 136
			movq	$136, %r8
			## store
			movq	%r8, -1096(%rbp)
			## new const Int: 137
			movq	$137, %r8
			## store
			movq	%r8, -1104(%rbp)
			## new const Int: 138
			movq	$138, %r8
			## store
			movq	%r8, -1112(%rbp)
			## new const Int: 139
			movq	$139, %r8
			## store
			movq	%r8, -1120(%rbp)
			## new const Int: 140
			movq	$140, %r8
			## store
			movq	%r8, -1128(%rbp)
			## new const Int: 141
			movq	$141, %r8
			## store
			movq	%r8, -1136(%rbp)
			## new const Int: 142
			movq	$142, %r8
			## store
			movq	%r8, -1144(%rbp)
			## new const Int: 143
			movq	$143, %r8
			## store
			movq	%r8, -1152(%rbp)
			## new const Int: 144
			movq	$144, %r8
			## store
			movq	%r8, -1160(%rbp)
			## new const Int: 145
			movq	$145, %r8
			## store
			movq	%r8, -1168(%rbp)
			## new const Int: 146
			movq	$146, %r8
			## store
			movq	%r8, -1176(%rbp)
			## new const Int: 147
			movq	$147, %r8
			## store
			movq	%r8, -1184(%rbp)
			## new const Int: 148
			movq	$148, %r8
			## store
			movq	%r8, -1192(%rbp)
			## new const Int: 149
			movq	$149, %r8
			## store
			movq	%r8, -1200(%rbp)
			## new const Int: 150
			movq	$150, %r8
			## store
			movq	%r8, -1208(%rbp)
			## new const Int: 151
			movq	$151, %r8
			## store
			movq	%r8, -1216(%rbp)
			## new const Int: 152
			movq	$152, %r8
			## store
			movq	%r8, -1224(%rbp)
			## new const Int: 153
			movq	$153, %r8
			## store
			movq	%r8, -1232(%rbp)
			## new const Int: 154
			movq	$154, %r8
			## store
			movq	%r8, -1240(%rbp)
			## new const Int: 155
			movq	$155, %r8
			## store
			movq	%r8, -1248(%rbp)
			## new const Int: 156
			movq	$156, %r8
			## store
			movq	%r8, -1256(%rbp)
			## new const Int: 157
			movq	$157, %r8
			## store
			movq	%r8, -1264(%rbp)
			## new const Int: 158
			movq	$158, %r8
			## store
			movq	%r8, -1272(%rbp)
			## new const Int: 159
			movq	$159, %r8
			## store
			movq	%r8, -1280(%rbp)
			## new const Int: 160
			movq	$160, %r8
			## store
			movq	%r8, -1288(%rbp)
			## new const Int: 161
			movq	$161, %r8
			## store
			movq	%r8, -1296(%rbp)
			## new const Int: 162
			movq	$162, %r8
			## store
			movq	%r8, -1304(%rbp)
			## new const Int: 163
			movq	$163, %r8
			## store
			movq	%r8, -1312(%rbp)
			## new const Int: 164
			movq	$164, %r8
			## store
			movq	%r8, -1320(%rbp)
			## new const Int: 165
			movq	$165, %r8
			## store
			movq	%r8, -1328(%rbp)
			## new const Int: 166
			movq	$166, %r8
			## store
			movq	%r8, -1336(%rbp)
			## new const Int: 167
			movq	$167, %r8
			## store
			movq	%r8, -1344(%rbp)
			## new const Int: 168
			movq	$168, %r8
			## store
			movq	%r8, -1352(%rbp)
			## new const Int: 169
			movq	$169, %r8
			## store
			movq	%r8, -1360(%rbp)
			## new const Int: 170
			movq	$170, %r8
			## store
			movq	%r8, -1368(%rbp)
			## new const Int: 171
			movq	$171, %r8
			## store
			movq	%r8, -1376(%rbp)
			## new const Int: 172
			movq	$172, %r8
			## store
			movq	%r8, -1384(%rbp)
			## new const Int: 173
			movq	$173, %r8
			## store
			movq	%r8, -1392(%rbp)
			## new const Int: 174
			movq	$174, %r8
			## store
			movq	%r8, -1400(%rbp)
			## new const Int: 175
			movq	$175, %r8
			## store
			movq	%r8, -1408(%rbp)
			## new const Int: 176
			movq	$176, %r8
			## store
			movq	%r8, -1416(%rbp)
			## new const Int: 177
			movq	$177, %r8
			## store
			movq	%r8, -1424(%rbp)
			## new const Int: 178
			movq	$178, %r8
			## store
			movq	%r8, -1432(%rbp)
			## new const Int: 179
			movq	$179, %r8
			## store
			movq	%r8, -1440(%rbp)
			## new const Int: 180
			movq	$180, %r8
			## store
			movq	%r8, -1448(%rbp)
			## new const Int: 181
			movq	$181, %r8
			## store
			movq	%r8, -1456(%rbp)
			## new const Int: 182
			movq	$182, %r8
			## store
			movq	%r8, -1464(%rbp)
			## new const Int: 183
			movq	$183, %r8
			## store
			movq	%r8, -1472(%rbp)
			## new const Int: 184
			movq	$184, %r8
			## store
			movq	%r8, -1480(%rbp)
			## new const Int: 185
			movq	$185, %r8
			## store
			movq	%r8, -1488(%rbp)
			## new const Int: 186
			movq	$186, %r8
			## store
			movq	%r8, -1496(%rbp)
			## new const Int: 187
			movq	$187, %r8
			## store
			movq	%r8, -1504(%rbp)
			## new const Int: 188
			movq	$188, %r8
			## store
			movq	%r8, -1512(%rbp)
			## new const Int: 189
			movq	$189, %r8
			## store
			movq	%r8, -1520(%rbp)
			## new const Int: 190
			movq	$190, %r8
			## store
			movq	%r8, -1528(%rbp)
			## new const Int: 191
			movq	$191, %r8
			## store
			movq	%r8, -1536(%rbp)
			## new const Int: 192
			movq	$192, %r8
			## store
			movq	%r8, -1544(%rbp)
			## new const Int: 193
			movq	$193, %r8
			## store
			movq	%r8, -1552(%rbp)
			## new const Int: 194
			movq	$194, %r8
			## store
			movq	%r8, -1560(%rbp)
			## new const Int: 195
			movq	$195, %r8
			## store
			movq	%r8, -1568(%rbp)
			## new const Int: 196
			movq	$196, %r8
			## store
			movq	%r8, -1576(%rbp)
			## new const Int: 197
			movq	$197, %r8
			## store
			movq	%r8, -1584(%rbp)
			## new const Int: 198
			movq	$198, %r8
			## store
			movq	%r8, -1592(%rbp)
			## new const Int: 199
			movq	$199, %r8
			## store
			movq	%r8, -1600(%rbp)
			## new const Int: 200
			movq	$200, %r8
			## store
			movq	%r8, -1608(%rbp)
			## new const Int: 201
			movq	$201, %r8
			## store
			movq	%r8, -1616(%rbp)
			## new const Int: 202
			movq	$202, %r8
			## store
			movq	%r8, -1624(%rbp)
			## new const Int: 203
			movq	$203, %r8
			## store
			movq	%r8, -1632(%rbp)
			## new const Int: 204
			movq	$204, %r8
			## store
			movq	%r8, -1640(%rbp)
			## new const Int: 205
			movq	$205, %r8
			## store
			movq	%r8, -1648(%rbp)
			## new const Int: 206
			movq	$206, %r8
			## store
			movq	%r8, -1656(%rbp)
			## new const Int: 207
			movq	$207, %r8
			## store
			movq	%r8, -1664(%rbp)
			## new const Int: 208
			movq	$208, %r8
			## store
			movq	%r8, -1672(%rbp)
			## new const Int: 209
			movq	$209, %r8
			## store
			movq	%r8, -1680(%rbp)
			## new const Int: 210
			movq	$210, %r8
			## store
			movq	%r8, -1688(%rbp)
			## new const Int: 211
			movq	$211, %r8
			## store
			movq	%r8, -1696(%rbp)
			## new const Int: 212
			movq	$212, %r8
			## store
			movq	%r8, -1704(%rbp)
			## new const Int: 213
			movq	$213, %r8
			## store
			movq	%r8, -1712(%rbp)
			## new const Int: 214
			movq	$214, %r8
			## store
			movq	%r8, -1720(%rbp)
			## new const Int: 215
			movq	$215, %r8
			## store
			movq	%r8, -1728(%rbp)
			## new const Int: 216
			movq	$216, %r8
			## store
			movq	%r8, -1736(%rbp)
			## new const Int: 217
			movq	$217, %r8
			## store
			movq	%r8, -1744(%rbp)
			## new const Int: 218
			movq	$218, %r8
			## store
			movq	%r8, -1752(%rbp)
			## new const Int: 219
			movq	$219, %r8
			## store
			movq	%r8, -1760(%rbp)
			## new const Int: 220
			movq	$220, %r8
			## store
			movq	%r8, -1768(%rbp)
			## new const Int: 221
			movq	$221, %r8
			## store
			movq	%r8, -1776(%rbp)
			## new const Int: 222
			movq	$222, %r8
			## store
			movq	%r8, -1784(%rbp)
			## new const Int: 223
			movq	$223, %r8
			## store
			movq	%r8, -1792(%rbp)
			## new const Int: 224
			movq	$224, %r8
			## store
			movq	%r8, -1800(%rbp)
			## new const Int: 225
			movq	$225, %r8
			## store
			movq	%r8, -1808(%rbp)
			## new const Int: 226
			movq	$226, %r8
			## store
			movq	%r8, -1816(%rbp)
			## new const Int: 227
			movq	$227, %r8
			## store
			movq	%r8, -1824(%rbp)
			## new const Int: 228
			movq	$228, %r8
			## store
			movq	%r8, -1832(%rbp)
			## new const Int: 229
			movq	$229, %r8
			## store
			movq	%r8, -1840(%rbp)
			## new const Int: 230
			movq	$230, %r8
			## store
			movq	%r8, -1848(%rbp)
			## new const Int: 231
			movq	$231, %r8
			## store
			movq	%r8, -1856(%rbp)
			## new const Int: 232
			movq	$232, %r8
			## store
			movq	%r8, -1864(%rbp)
			## new const Int: 233
			movq	$233, %r8
			## store
			movq	%r8, -1872(%rbp)
			## new const Int: 234
			movq	$234, %r8
			## store
			movq	%r8, -1880(%rbp)
			## new const Int: 235
			movq	$235, %r8
			## store
			movq	%r8, -1888(%rbp)
			## new const Int: 236
			movq	$236, %r8
			## store
			movq	%r8, -1896(%rbp)
			## new const Int: 237
			movq	$237, %r8
			## store
			movq	%r8, -1904(%rbp)
			## new const Int: 238
			movq	$238, %r8
			## store
			movq	%r8, -1912(%rbp)
			## new const Int: 239
			movq	$239, %r8
			## store
			movq	%r8, -1920(%rbp)
			## new const Int: 240
			movq	$240, %r8
			## store
			movq	%r8, -1928(%rbp)
			## new const Int: 241
			movq	$241, %r8
			## store
			movq	%r8, -1936(%rbp)
			## new const Int: 242
			movq	$242, %r8
			## store
			movq	%r8, -1944(%rbp)
			## new const Int: 243
			movq	$243, %r8
			## store
			movq	%r8, -1952(%rbp)
			## new const Int: 244
			movq	$244, %r8
			## store
			movq	%r8, -1960(%rbp)
			## new const Int: 245
			movq	$245, %r8
			## store
			movq	%r8, -1968(%rbp)
			## new const Int: 246
			movq	$246, %r8
			## store
			movq	%r8, -1976(%rbp)
			## new const Int: 247
			movq	$247, %r8
			## store
			movq	%r8, -1984(%rbp)
			## new const Int: 248
			movq	$248, %r8
			## store
			movq	%r8, -1992(%rbp)
			## new const Int: 249
			movq	$249, %r8
			## store
			movq	%r8, -2000(%rbp)
			## new const Int: 250
			movq	$250, %r8
			## store
			movq	%r8, -2008(%rbp)
			## new const Int: 251
			movq	$251, %r8
			## store
			movq	%r8, -2016(%rbp)
			## new const Int: 252
			movq	$252, %r8
			## store
			movq	%r8, -2024(%rbp)
			## new const Int: 253
			movq	$253, %r8
			## store
			movq	%r8, -2032(%rbp)
			## new const Int: 254
			movq	$254, %r8
			## store
			movq	%r8, -2040(%rbp)
			## new const Int: 255
			movq	$255, %r8
			## store
			movq	%r8, -2048(%rbp)
			## new const Int: 256
			movq	$256, %r8
			## store
			movq	%r8, -2056(%rbp)
			## new const Int: 257
			movq	$257, %r8
			## store
			movq	%r8, -2064(%rbp)
			## new const Int: 258
			movq	$258, %r8
			## store
			movq	%r8, -2072(%rbp)
			## new const Int: 259
			movq	$259, %r8
			## store
			movq	%r8, -2080(%rbp)
			## new const Int: 260
			movq	$260, %r8
			## store
			movq	%r8, -2088(%rbp)
			## new const Int: 261
			movq	$261, %r8
			## store
			movq	%r8, -2096(%rbp)
			## new const Int: 262
			movq	$262, %r8
			## store
			movq	%r8, -2104(%rbp)
			## new const Int: 263
			movq	$263, %r8
			## store
			movq	%r8, -2112(%rbp)
			## new const Int: 264
			movq	$264, %r8
			## store
			movq	%r8, -2120(%rbp)
			## new const Int: 265
			movq	$265, %r8
			## store
			movq	%r8, -2128(%rbp)
			## new const Int: 266
			movq	$266, %r8
			## store
			movq	%r8, -2136(%rbp)
			## new const Int: 267
			movq	$267, %r8
			## store
			movq	%r8, -2144(%rbp)
			## new const Int: 268
			movq	$268, %r8
			## store
			movq	%r8, -2152(%rbp)
			## new const Int: 269
			movq	$269, %r8
			## store
			movq	%r8, -2160(%rbp)
			## new const Int: 270
			movq	$270, %r8
			## store
			movq	%r8, -2168(%rbp)
			## new const Int: 271
			movq	$271, %r8
			## store
			movq	%r8, -2176(%rbp)
			## new const Int: 272
			movq	$272, %r8
			## store
			movq	%r8, -2184(%rbp)
			## new const Int: 273
			movq	$273, %r8
			## store
			movq	%r8, -2192(%rbp)
			## new const Int: 274
			movq	$274, %r8
			## store
			movq	%r8, -2200(%rbp)
			## new const Int: 275
			movq	$275, %r8
			## store
			movq	%r8, -2208(%rbp)
			## new const Int: 276
			movq	$276, %r8
			## store
			movq	%r8, -2216(%rbp)
			## new const Int: 277
			movq	$277, %r8
			## store
			movq	%r8, -2224(%rbp)
			## new const Int: 278
			movq	$278, %r8
			## store
			movq	%r8, -2232(%rbp)
			## new const Int: 279
			movq	$279, %r8
			## store
			movq	%r8, -2240(%rbp)
			## new const Int: 280
			movq	$280, %r8
			## store
			movq	%r8, -2248(%rbp)
			## new const Int: 281
			movq	$281, %r8
			## store
			movq	%r8, -2256(%rbp)
			## new const Int: 282
			movq	$282, %r8
			## store
			movq	%r8, -2264(%rbp)
			## new const Int: 283
			movq	$283, %r8
			## store
			movq	%r8, -2272(%rbp)
			## new const Int: 284
			movq	$284, %r8
			## store
			movq	%r8, -2280(%rbp)
			## new const Int: 285
			movq	$285, %r8
			## store
			movq	%r8, -2288(%rbp)
			## new const Int: 286
			movq	$286, %r8
			## store
			movq	%r8, -2296(%rbp)
			## new const Int: 287
			movq	$287, %r8
			## store
			movq	%r8, -2304(%rbp)
			## new const Int: 288
			movq	$288, %r8
			## store
			movq	%r8, -2312(%rbp)
			## new const Int: 289
			movq	$289, %r8
			## store
			movq	%r8, -2320(%rbp)
			## new const Int: 290
			movq	$290, %r8
			## store
			movq	%r8, -2328(%rbp)
			## new const Int: 291
			movq	$291, %r8
			## store
			movq	%r8, -2336(%rbp)
			## new const Int: 292
			movq	$292, %r8
			## store
			movq	%r8, -2344(%rbp)
			## new const Int: 293
			movq	$293, %r8
			## store
			movq	%r8, -2352(%rbp)
			## new const Int: 294
			movq	$294, %r8
			## store
			movq	%r8, -2360(%rbp)
			## new const Int: 295
			movq	$295, %r8
			## store
			movq	%r8, -2368(%rbp)
			## new const Int: 296
			movq	$296, %r8
			## store
			movq	%r8, -2376(%rbp)
			## new const Int: 297
			movq	$297, %r8
			## store
			movq	%r8, -2384(%rbp)
			## new const Int: 298
			movq	$298, %r8
			## store
			movq	%r8, -2392(%rbp)
			## new const Int: 299
			movq	$299, %r8
			## store
			movq	%r8, -2400(%rbp)
			## new const Int: 300
			movq	$300, %r8
			## store
			movq	%r8, -2408(%rbp)
			## new const Int: 301
			movq	$301, %r8
			## store
			movq	%r8, -2416(%rbp)
			## new const Int: 302
			movq	$302, %r8
			## store
			movq	%r8, -2424(%rbp)
			## new const Int: 303
			movq	$303, %r8
			## store
			movq	%r8, -2432(%rbp)
			## new const Int: 304
			movq	$304, %r8
			## store
			movq	%r8, -2440(%rbp)
			## new const Int: 305
			movq	$305, %r8
			## store
			movq	%r8, -2448(%rbp)
			## new const Int: 306
			movq	$306, %r8
			## store
			movq	%r8, -2456(%rbp)
			## new const Int: 307
			movq	$307, %r8
			## store
			movq	%r8, -2464(%rbp)
			## new const Int: 308
			movq	$308, %r8
			## store
			movq	%r8, -2472(%rbp)
			## new const Int: 309
			movq	$309, %r8
			## store
			movq	%r8, -2480(%rbp)
			## new const Int: 310
			movq	$310, %r8
			## store
			movq	%r8, -2488(%rbp)
			## new const Int: 311
			movq	$311, %r8
			## store
			movq	%r8, -2496(%rbp)
			## new const Int: 312
			movq	$312, %r8
			## store
			movq	%r8, -2504(%rbp)
			## new const Int: 313
			movq	$313, %r8
			## store
			movq	%r8, -2512(%rbp)
			## new const Int: 314
			movq	$314, %r8
			## store
			movq	%r8, -2520(%rbp)
			## new const Int: 315
			movq	$315, %r8
			## store
			movq	%r8, -2528(%rbp)
			## new const Int: 316
			movq	$316, %r8
			## store
			movq	%r8, -2536(%rbp)
			## new const Int: 317
			movq	$317, %r8
			## store
			movq	%r8, -2544(%rbp)
			## new const Int: 318
			movq	$318, %r8
			## store
			movq	%r8, -2552(%rbp)
			## new const Int: 319
			movq	$319, %r8
			## store
			movq	%r8, -2560(%rbp)
			## new const Int: 320
			movq	$320, %r8
			## store
			movq	%r8, -2568(%rbp)
			## new const Int: 321
			movq	$321, %r8
			## store
			movq	%r8, -2576(%rbp)
			## new const Int: 322
			movq	$322, %r8
			## store
			movq	%r8, -2584(%rbp)
			## new const Int: 323
			movq	$323, %r8
			## store
			movq	%r8, -2592(%rbp)
			## new const Int: 324
			movq	$324, %r8
			## store
			movq	%r8, -2600(%rbp)
			## new const Int: 325
			movq	$325, %r8
			## store
			movq	%r8, -2608(%rbp)
			## new const Int: 326
			movq	$326, %r8
			## store
			movq	%r8, -2616(%rbp)
			## new const Int: 327
			movq	$327, %r8
			## store
			movq	%r8, -2624(%rbp)
			## new const Int: 328
			movq	$328, %r8
			## store
			movq	%r8, -2632(%rbp)
			## new const Int: 329
			movq	$329, %r8
			## store
			movq	%r8, -2640(%rbp)
			## new const Int: 330
			movq	$330, %r8
			## store
			movq	%r8, -2648(%rbp)
			## new const Int: 331
			movq	$331, %r8
			## store
			movq	%r8, -2656(%rbp)
			## new const Int: 332
			movq	$332, %r8
			## store
			movq	%r8, -2664(%rbp)
			## new const Int: 333
			movq	$333, %r8
			## store
			movq	%r8, -2672(%rbp)
			## new const Int: 334
			movq	$334, %r8
			## store
			movq	%r8, -2680(%rbp)
			## new const Int: 335
			movq	$335, %r8
			## store
			movq	%r8, -2688(%rbp)
			## new const Int: 336
			movq	$336, %r8
			## store
			movq	%r8, -2696(%rbp)
			## new const Int: 337
			movq	$337, %r8
			## store
			movq	%r8, -2704(%rbp)
			## new const Int: 338
			movq	$338, %r8
			## store
			movq	%r8, -2712(%rbp)
			## new const Int: 339
			movq	$339, %r8
			## store
			movq	%r8, -2720(%rbp)
			## new const Int: 340
			movq	$340, %r8
			## store
			movq	%r8, -2728(%rbp)
			## new const Int: 341
			movq	$341, %r8
			## store
			movq	%r8, -2736(%rbp)
			## new const Int: 342
			movq	$342, %r8
			## store
			movq	%r8, -2744(%rbp)
			## new const Int: 343
			movq	$343, %r8
			## store
			movq	%r8, -2752(%rbp)
			## new const Int: 344
			movq	$344, %r8
			## store
			movq	%r8, -2760(%rbp)
			## new const Int: 345
			movq	$345, %r8
			## store
			movq	%r8, -2768(%rbp)
			## new const Int: 346
			movq	$346, %r8
			## store
			movq	%r8, -2776(%rbp)
			## new const Int: 347
			movq	$347, %r8
			## store
			movq	%r8, -2784(%rbp)
			## new const Int: 348
			movq	$348, %r8
			## store
			movq	%r8, -2792(%rbp)
			## new const Int: 349
			movq	$349, %r8
			## store
			movq	%r8, -2800(%rbp)
			## new const Int: 350
			movq	$350, %r8
			## store
			movq	%r8, -2808(%rbp)
			## new const Int: 351
			movq	$351, %r8
			## store
			movq	%r8, -2816(%rbp)
			## new const Int: 352
			movq	$352, %r8
			## store
			movq	%r8, -2824(%rbp)
			## new const Int: 353
			movq	$353, %r8
			## store
			movq	%r8, -2832(%rbp)
			## new const Int: 354
			movq	$354, %r8
			## store
			movq	%r8, -2840(%rbp)
			## new const Int: 355
			movq	$355, %r8
			## store
			movq	%r8, -2848(%rbp)
			## new const Int: 356
			movq	$356, %r8
			## store
			movq	%r8, -2856(%rbp)
			## new const Int: 357
			movq	$357, %r8
			## store
			movq	%r8, -2864(%rbp)
			## new const Int: 358
			movq	$358, %r8
			## store
			movq	%r8, -2872(%rbp)
			## new const Int: 359
			movq	$359, %r8
			## store
			movq	%r8, -2880(%rbp)
			## new const Int: 360
			movq	$360, %r8
			## store
			movq	%r8, -2888(%rbp)
			## new const Int: 361
			movq	$361, %r8
			## store
			movq	%r8, -2896(%rbp)
			## new const Int: 362
			movq	$362, %r8
			## store
			movq	%r8, -2904(%rbp)
			## new const Int: 363
			movq	$363, %r8
			## store
			movq	%r8, -2912(%rbp)
			## new const Int: 364
			movq	$364, %r8
			## store
			movq	%r8, -2920(%rbp)
			## new const Int: 365
			movq	$365, %r8
			## store
			movq	%r8, -2928(%rbp)
			## new const Int: 366
			movq	$366, %r8
			## store
			movq	%r8, -2936(%rbp)
			## new const Int: 367
			movq	$367, %r8
			## store
			movq	%r8, -2944(%rbp)
			## new const Int: 368
			movq	$368, %r8
			## store
			movq	%r8, -2952(%rbp)
			## new const Int: 369
			movq	$369, %r8
			## store
			movq	%r8, -2960(%rbp)
			## new const Int: 370
			movq	$370, %r8
			## store
			movq	%r8, -2968(%rbp)
			## new const Int: 371
			movq	$371, %r8
			## store
			movq	%r8, -2976(%rbp)
			## new const Int: 372
			movq	$372, %r8
			## store
			movq	%r8, -2984(%rbp)
			## new const Int: 373
			movq	$373, %r8
			## store
			movq	%r8, -2992(%rbp)
			## new const Int: 374
			movq	$374, %r8
			## store
			movq	%r8, -3000(%rbp)
			## new const Int: 375
			movq	$375, %r8
			## store
			movq	%r8, -3008(%rbp)
			## new const Int: 376
			movq	$376, %r8
			## store
			movq	%r8, -3016(%rbp)
			## new const Int: 377
			movq	$377, %r8
			## store
			movq	%r8, -3024(%rbp)
			## new const Int: 378
			movq	$378, %r8
			## store
			movq	%r8, -3032(%rbp)
			## new const Int: 379
			movq	$379, %r8
			## store
			movq	%r8, -3040(%rbp)
			## new const Int: 380
			movq	$380, %r8
			## store
			movq	%r8, -3048(%rbp)
			## new const Int: 381
			movq	$381, %r8
			## store
			movq	%r8, -3056(%rbp)
			## new const Int: 382
			movq	$382, %r8
			## store
			movq	%r8, -3064(%rbp)
			## new const Int: 383
			movq	$383, %r8
			## store
			movq	%r8, -3072(%rbp)
			## new const Int: 384
			movq	$384, %r8
			## store
			movq	%r8, -3080(%rbp)
			## new const Int: 385
			movq	$385, %r8
			## store
			movq	%r8, -3088(%rbp)
			## new const Int: 386
			movq	$386, %r8
			## store
			movq	%r8, -3096(%rbp)
			## new const Int: 387
			movq	$387, %r8
			## store
			movq	%r8, -3104(%rbp)
			## new const Int: 388
			movq	$388, %r8
			## store
			movq	%r8, -3112(%rbp)
			## new const Int: 389
			movq	$389, %r9
			## store
			movq	%r9, -3120(%rbp)
			## new const Int: 390
			movq	$390, %rdi
			## new const Int: 391
			movq	$391, %rsi
			## new const Int: 392
			movq	$392, %rdx
			## new const Int: 393
			movq	$393, %rcx
			## new const Int: 394
			movq	$394, %r15
			## new const Int: 395
			movq	$395, %r14
			## new const Int: 396
			movq	$396, %r13
			## new const Int: 397
			movq	$397, %r12
			## new const Int: 398
			movq	$398, %r11
			## new const Int: 399
			movq	$399, %r9
			## new const Int: 400
			movq	$400, %r8
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## plus
			movl	%r11d, %r8d
			addl	%r10d, %r8d
			## plus
			movl	%r12d, %r9d
			addl	%r8d, %r9d
			## plus
			movl	%r13d, %r8d
			addl	%r9d, %r8d
			## plus
			movl	%r14d, %r9d
			addl	%r8d, %r9d
			## plus
			movl	%r15d, %r8d
			addl	%r9d, %r8d
			## plus
			movl	%ecx, %r9d
			addl	%r8d, %r9d
			## plus
			movl	%edx, %r8d
			addl	%r9d, %r8d
			## plus
			movl	%esi, %r9d
			addl	%r8d, %r9d
			## plus
			movl	%edi, %r8d
			addl	%r9d, %r8d
			## load
			movq	-3120(%rbp), %r9
			## plus
			movl	%r9d, %r10d
			addl	%r8d, %r10d
			## load
			movq	-3112(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3104(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3096(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3088(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3080(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3072(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3064(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3056(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3048(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3040(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3032(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3024(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3016(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-3008(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-3000(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2992(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2984(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2976(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2968(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2960(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2952(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2944(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2936(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2928(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2920(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2912(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2904(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2896(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2888(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2880(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2872(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2864(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2856(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2848(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2840(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2832(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2824(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2816(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2808(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2800(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2792(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2784(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2776(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2768(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2760(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2752(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2744(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2736(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2728(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2720(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2712(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2704(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2696(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2688(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2680(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2672(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2664(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2656(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2648(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2640(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2632(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2624(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2616(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2608(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2600(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2592(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2584(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2576(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2568(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2560(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2552(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2544(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2536(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2528(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2520(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2512(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2504(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2496(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2488(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2480(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2472(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2464(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2456(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2448(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2440(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2432(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2424(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2416(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2408(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2400(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2392(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2384(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2376(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2368(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2360(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2352(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2344(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2336(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2328(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2320(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2312(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2304(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2296(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2288(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2280(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2272(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2264(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2256(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2248(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2240(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2232(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2224(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2216(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2208(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2200(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2192(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2184(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2176(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2168(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2160(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2152(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2144(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2136(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2128(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2120(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2112(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2104(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2096(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2088(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2080(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2072(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2064(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2056(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2048(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2040(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2032(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2024(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2016(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-2008(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-2000(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1992(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1984(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1976(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1968(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1960(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1952(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1944(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1936(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1928(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1920(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1912(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1904(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1896(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1888(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1880(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1872(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1864(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1856(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1848(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1840(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1832(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1824(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1816(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1808(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1800(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1792(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1784(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1776(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1768(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1760(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1752(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1744(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1736(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1728(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1720(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1712(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1704(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1696(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1688(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1680(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1672(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1664(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1656(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1648(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1640(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1632(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1624(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1616(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1608(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1600(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1592(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1584(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1576(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1568(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1560(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1552(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1544(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1536(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1528(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1520(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1512(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1504(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1496(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1488(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1480(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1472(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1464(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1456(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1448(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1440(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1432(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1424(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1416(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1408(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1400(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1392(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1384(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1376(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1368(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1360(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1352(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1344(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1336(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1328(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1320(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1312(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1304(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1296(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1288(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1280(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1272(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1264(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1256(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1248(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1240(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1232(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1224(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1216(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1208(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1200(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1192(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1184(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1176(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1168(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1160(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1152(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1144(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1136(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1128(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1120(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1112(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1104(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1096(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1088(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1080(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1072(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1064(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1056(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1048(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1040(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1032(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1024(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1016(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-1008(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-1000(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-992(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-984(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-976(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-968(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-960(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-952(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-944(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-936(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-928(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-920(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-912(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-904(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-896(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-888(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-880(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-872(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-864(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-856(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-848(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-840(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-832(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-824(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-816(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-808(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-800(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-792(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-784(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-776(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-768(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-760(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-752(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-744(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-736(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-728(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-720(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-712(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-704(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-696(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-688(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-680(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-672(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-664(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-656(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-648(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-640(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-632(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-624(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-616(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-608(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-600(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-592(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-584(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-576(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-568(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-560(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-552(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-544(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-536(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-528(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-520(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-512(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-504(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-496(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-488(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-480(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-472(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-464(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-456(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-448(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-440(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-432(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-424(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-416(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-408(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-400(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-392(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-384(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-376(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-368(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-360(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-352(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-344(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-336(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-328(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-320(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-312(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-304(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-296(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-288(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-280(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-272(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-264(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-256(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-248(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-240(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-232(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-224(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-216(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-208(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-200(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-192(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-184(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-176(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-168(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-160(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-152(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-144(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-136(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-128(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-120(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-112(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-104(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-96(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-88(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-80(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-72(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-64(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-56(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-48(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-40(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-32(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-24(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
			## load
			movq	-16(%rbp), %r8
			## plus
			movl	%r8d, %r10d
			addl	%r9d, %r10d
			## load
			movq	-8(%rbp), %r8
			## plus
			movl	%r8d, %r9d
			addl	%r10d, %r9d
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

