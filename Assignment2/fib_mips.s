	.file	1 "fib.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.globl	memo_table
	.section	.bss,"aw",@nobits
	.align	3
	.type	memo_table, @object
	.size	memo_table, 800
memo_table:
	.space	800
	.text
	.align	2
	.globl	fib_recursion
	.set	nomips16
	.set	nomicromips
	.ent	fib_recursion
	.type	fib_recursion, @function
fib_recursion:
	.frame	$fp,40,$31		# vars= 0, regs= 2/2, args= 16, gp= 8
	.mask	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,28($sp)
	sw	$fp,24($sp)
	sdc1	$f20,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	lw	$2,40($fp)
	slt	$2,$2,2
	beq	$2,$0,$L2
	nop

	lw	$2,40($fp)
	mtc1	$2,$f0
	cvt.d.w	$f0,$f0
	b	$L3
	nop

$L2:
	lw	$2,40($fp)
	addiu	$2,$2,-2
	move	$4,$2
	lw	$2,%got(fib_recursion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fib_recursion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	mov.d	$f20,$f0
	lw	$2,40($fp)
	addiu	$2,$2,-1
	move	$4,$2
	lw	$2,%got(fib_recursion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fib_recursion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	add.d	$f0,$f20,$f0
$L3:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	ldc1	$f20,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	fib_recursion
	.size	fib_recursion, .-fib_recursion
	.align	2
	.globl	fib_recursion_memo
	.set	nomips16
	.set	nomicromips
	.ent	fib_recursion_memo
	.type	fib_recursion_memo, @function
fib_recursion_memo:
	.frame	$fp,40,$31		# vars= 0, regs= 2/2, args= 16, gp= 8
	.mask	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,28($sp)
	sw	$fp,24($sp)
	sdc1	$f20,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	lw	$3,%got(memo_table)($28)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	mtc1	$0,$f2
	mthc1	$0,$f2
	c.eq.d	$fcc0,$f0,$f2
	bc1t	$fcc0,$L5
	nop

	lw	$3,%got(memo_table)($28)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	b	$L6
	nop

$L5:
	lw	$2,40($fp)
	slt	$2,$2,2
	beq	$2,$0,$L7
	nop

	lw	$2,40($fp)
	mtc1	$2,$f0
	cvt.d.w	$f0,$f0
	lw	$3,%got(memo_table)($28)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	sdc1	$f0,0($2)
	lw	$3,%got(memo_table)($28)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	b	$L6
	nop

$L7:
	lw	$2,40($fp)
	addiu	$2,$2,-1
	move	$4,$2
	lw	$2,%got(fib_recursion_memo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fib_recursion_memo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	mov.d	$f20,$f0
	lw	$2,40($fp)
	addiu	$2,$2,-2
	move	$4,$2
	lw	$2,%got(fib_recursion_memo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fib_recursion_memo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	add.d	$f0,$f20,$f0
	lw	$3,%got(memo_table)($28)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	sdc1	$f0,0($2)
	lw	$3,%got(memo_table)($28)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
$L6:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	ldc1	$f20,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	fib_recursion_memo
	.size	fib_recursion_memo, .-fib_recursion_memo
	.rdata
	.align	2
$LC0:
	.ascii	"fib(%d) = %g \011 Time taken: %ld micro seconds\012\000"
	.align	2
$LC1:
	.ascii	"total time: %ld micro seconds\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,64,$31		# vars= 24, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$0,44($fp)
	sw	$0,40($fp)
	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,48($fp)
	sw	$0,32($fp)
	b	$L9
	nop

$L10:
	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,52($fp)
	lw	$4,32($fp)
	lw	$2,%got(fib_recursion_memo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fib_recursion_memo
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sdc1	$f0,40($fp)
	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,24($fp)
	move	$3,$2
	lw	$2,52($fp)
	subu	$2,$3,$2
	sw	$2,52($fp)
	lw	$2,52($fp)
	sw	$2,16($sp)
	lw	$7,44($fp)
	lw	$6,40($fp)
	lw	$5,32($fp)
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,24($fp)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L9:
	lw	$2,32($fp)
	slt	$2,$2,100
	bne	$2,$0,$L10
	nop

	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,24($fp)
	move	$3,$2
	lw	$2,48($fp)
	subu	$2,$3,$2
	sw	$2,48($fp)
	lw	$5,48($fp)
	lw	$2,%got($LC1)($28)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,24($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	addiu	$sp,$sp,64
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
