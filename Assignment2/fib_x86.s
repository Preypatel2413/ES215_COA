	.file	"fib.c"
	.text
	.globl	memo_table
	.bss
	.align 32
	.type	memo_table, @object
	.size	memo_table, 800
memo_table:
	.zero	800
	.text
	.globl	fib_recursion
	.type	fib_recursion, @function
fib_recursion:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jg	.L2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-4(%rbp), %xmm0
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	fib_recursion
	movsd	%xmm0, -16(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fib_recursion
	addsd	-16(%rbp), %xmm0
.L3:
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fib_recursion, .-fib_recursion
	.globl	fib_recursion_memo
	.type	fib_recursion_memo, @function
fib_recursion_memo:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo_table(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L9
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	je	.L5
.L9:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo_table(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	jmp	.L7
.L5:
	cmpl	$1, -4(%rbp)
	jg	.L8
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-4(%rbp), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo_table(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo_table(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fib_recursion_memo
	movsd	%xmm0, -16(%rbp)
	movl	-4(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	fib_recursion_memo
	addsd	-16(%rbp), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo_table(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo_table(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
.L7:
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	fib_recursion_memo, .-fib_recursion_memo
	.section	.rodata
	.align 8
.LC1:
	.string	"fib(%d) = %g \t Time taken: %ld micro seconds\n"
.LC2:
	.string	"total time: %ld micro seconds"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L11
.L12:
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	fib_recursion_memo
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	call	clock@PLT
	subq	-32(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L11:
	cmpl	$99, -4(%rbp)
	jle	.L12
	call	clock@PLT
	subq	-24(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
