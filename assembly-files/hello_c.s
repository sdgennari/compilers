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
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$String, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
