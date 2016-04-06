			## ========================================
.globl Bool..vtable
Bool..vtable:		## vtable for Bool
			.quad type_name_Bool
			.quad Bool..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			## ========================================
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
			## ========================================
.globl Int..vtable
Int..vtable:		## vtable for Int
			.quad type_name_Int
			.quad Int..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			## ========================================
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
			## ========================================
.globl Object..vtable
Object..vtable:		## vtable for Object
			.quad type_name_Object
			.quad Object..new
			.quad Object.abort
			.quad Object.copy
			.quad Object.type_name
			## ========================================
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
			## Create default attrs
			## self[3] holds some_attr (Int)
			pushq	%rbx
			call	Int..new
			popq	%rbx
			movq	%rax, 24(%rbx)
			## self[4] holds another_attr (Int)
			pushq	%rbx
			call	Int..new
			popq	%rbx
			movq	%rax, 32(%rbx)
			## Initialize attrs
			## self[3] some_attr <- init exp
			## ---- TODO: Generate asm for init exp
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

			## ========================================
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

