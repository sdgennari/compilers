	.file	"hello_c.c"
	.section	.rodata
.LC0:
	.asciz	"hello c\n"

.globl Bool 
Bool:
	.asciz "Bool"
.globl IO 
IO:
	.asciz "IO"
.globl Int 
Int:
	.asciz "Int"
.globl Main 
Main:
	.asciz "Main"
.globl Object 
Object:
	.asciz "Object"
.globl String 
String:
	.asciz "String"


	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp

	## Allocate space for Object
	movq	$8, %rsi
	movq	$3, %rdi
	call	calloc

	## Store type_tag, obj_size, vtable
	movq	$777, 0(%rax)
	movq	$3, 8(%rax)
	movq	$String, 16(%rax)

	leave
	ret
	
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
