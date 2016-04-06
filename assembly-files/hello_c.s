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

			## ========================================
.globl Bool..new
Bool..new:		## Constructor for Bool
			pushq	%rbp
			movq	%rsp, %rbp
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
			## Create default attrs
			## self[3] holds val (raw.Int)
			movl	$0, 24(%rbx)
			## Initialize attrs
			## Assign self register to %rax
			movq	%rbx, %rax
			leave
			ret
			## ========================================
.globl IO..new
IO..new:		## Constructor for IO
			pushq	%rbp
			movq	%rsp, %rbp
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
			## Create default attrs
			## Initialize attrs
			## Assign self register to %rax
			movq	%rbx, %rax
			leave
			ret
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
			## ========================================
.globl Main..new
Main..new:		## Constructor for Main
			pushq	%rbp
			movq	%rsp, %rbp
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
			## Create default attrs
			## Initialize attrs
			## Assign self register to %rax
			movq	%rbx, %rax
			leave
			ret
			## ========================================
.globl Object..new
Object..new:		## Constructor for Object
			pushq	%rbp
			movq	%rsp, %rbp
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
			## Create default attrs
			## Initialize attrs
			## Assign self register to %rax
			movq	%rbx, %rax
			leave
			ret
			## ========================================
.globl String..new
String..new:		## Constructor for String
			pushq	%rbp
			movq	%rsp, %rbp
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
			## Create default attrs
			## self[3] holds val (raw.String)
			movq	$empty.string, 24(%rbx)
			## Initialize attrs
			## Assign self register to %rax
			movq	%rbx, %rax
			leave
			ret
			## ========================================

	.globl	main
	.type	main, @function
main:
.LFB0:
 			pushq	%rbp
 			movq	%rsp, %rbp
 			subq	$0, %rsp
 			## default Int
 			pushq	%rsi
 			pushq	%rdi
 			call	Int..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			movq	$0, 24(%r8)
 			## default Bool
 			pushq	%rsi
 			pushq	%rdi
 			call	Bool..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r9
 			movq	$0, 24(%r9)
 			## default String
 			pushq	%rsi
 			pushq	%rdi
 			call	String..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			movq	$empty.string, 24(%r8)
 			## default IO
 			movq	$0, %r9
 			## default Main
 			movq	$0, %r9
 			## new const Int: 777
 			pushq	%rsi
 			pushq	%rdi
 			call	Int..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r9
 			movl	$777, 24(%r9)
 			## assign
 			movq	%r9, %r8
 			## const Bool
 			pushq	%rsi
 			pushq	%rdi
 			call	Bool..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			movl	$1, 24(%r8)
 			## assign
 			movq	%r8, %r9
 			## const String
 			pushq	%rsi
 			pushq	%rdi
 			call	String..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r9
 			movq	$string_1, 24(%r9)
 			## assign
 			movq	%r9, %r8
 			pushq	%rsi
 			pushq	%rdi
 			call	IO..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			## assign
 			movq	%r8, %r9
 			pushq	%rsi
 			pushq	%rdi
 			call	Main..new
 			popq	%rdi
 			popq	%rsi
 			movq	%rax, %r8
 			## assign
 			movq	%r8, %r9
 			## assign
 			movq	%r9, %r8
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
