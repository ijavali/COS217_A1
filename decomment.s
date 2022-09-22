	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleOutsideState
	.type	handleOutsideState, %function
handleOutsideState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
.L3:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleOutsideState, .-handleOutsideState
	.align	2
	.global	handleOpeningCommentState
	.type	handleOpeningCommentState, %function
handleOpeningCommentState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 44]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	w0, [sp, 44]
	cmp	w0, 42
	bne	.L8
	mov	w0, 3
	str	w0, [sp, 60]
	ldr	x0, [sp, 24]
	ldr	w1, [x0]
	ldr	x0, [sp, 32]
	str	w1, [x0]
	b	.L9
.L8:
	ldr	w0, [sp, 44]
	cmp	w0, 47
	bne	.L10
	mov	w0, 47
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 60]
	b	.L9
.L10:
	ldr	w0, [sp, 44]
	cmp	w0, 34
	bne	.L11
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 60]
	b	.L9
.L11:
	ldr	w0, [sp, 44]
	cmp	w0, 39
	bne	.L12
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 60]
	b	.L9
.L12:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	bl	putchar
	str	wzr, [sp, 60]
.L9:
	ldr	w0, [sp, 60]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleOpeningCommentState, .-handleOpeningCommentState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB2:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]
	str	x1, [sp]
	mov	w0, 3
	str	w0, [sp, 28]
	ldr	w0, [sp, 12]
	cmp	w0, 42
	bne	.L15
	mov	w0, 2
	str	w0, [sp, 28]
	b	.L16
.L15:
	ldr	w0, [sp, 12]
	cmp	w0, 10
	bne	.L16
	ldr	x0, [sp]
	ldr	w0, [x0]
	add	w1, w0, 1
	ldr	x0, [sp]
	str	w1, [x0]
.L16:
	ldr	w0, [sp, 28]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleClosingCommentState
	.type	handleClosingCommentState, %function
handleClosingCommentState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	str	wzr, [sp, 44]
	mov	w0, 3
	str	w0, [sp, 40]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L19
	str	wzr, [sp, 40]
	mov	w0, 32
	bl	putchar
	b	.L20
.L21:
	mov	w0, 10
	bl	putchar
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L20:
	ldr	x0, [sp, 16]
	ldr	w0, [x0]
	ldr	w1, [sp, 44]
	cmp	w1, w0
	blt	.L21
	ldr	x0, [sp, 16]
	str	wzr, [x0]
	b	.L22
.L19:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L23
	mov	w0, 2
	str	w0, [sp, 40]
	b	.L22
.L23:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L22
	ldr	x0, [sp, 16]
	ldr	w0, [x0]
	add	w1, w0, 1
	ldr	x0, [sp, 16]
	str	w1, [x0]
.L22:
	ldr	w0, [sp, 40]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleClosingCommentState, .-handleClosingCommentState
	.align	2
	.global	handleInStringLiteralState
	.type	handleInStringLiteralState, %function
handleInStringLiteralState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L26
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L27
.L26:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L27
	str	wzr, [sp, 44]
.L27:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleInStringLiteralState, .-handleInStringLiteralState
	.align	2
	.global	handleInCharLiteralState
	.type	handleInCharLiteralState, %function
handleInCharLiteralState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L30
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L31
.L30:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L31
	str	wzr, [sp, 44]
.L31:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleInCharLiteralState, .-handleInCharLiteralState
	.align	2
	.global	handleEscapeInCharState
	.type	handleEscapeInCharState, %function
handleEscapeInCharState:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleEscapeInCharState, .-handleEscapeInCharState
	.align	2
	.global	handleEscapeInStringState
	.type	handleEscapeInStringState, %function
handleEscapeInStringState:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleEscapeInStringState, .-handleEscapeInStringState
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	wzr, [sp, 32]
	str	wzr, [sp, 28]
	str	wzr, [sp, 44]
	mov	w0, 1
	str	w0, [sp, 24]
	str	wzr, [sp, 40]
	b	.L38
.L49:
	ldr	w0, [sp, 36]
	cmp	w0, 10
	bne	.L39
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
.L39:
	ldr	w0, [sp, 40]
	cmp	w0, 3
	beq	.L40
	ldr	w0, [sp, 40]
	cmp	w0, 3
	bhi	.L41
	ldr	w0, [sp, 40]
	cmp	w0, 1
	beq	.L42
	ldr	w0, [sp, 40]
	cmp	w0, 1
	bhi	.L43
	b	.L57
.L41:
	ldr	w0, [sp, 40]
	cmp	w0, 5
	beq	.L45
	ldr	w0, [sp, 40]
	cmp	w0, 5
	bcc	.L46
	ldr	w0, [sp, 40]
	cmp	w0, 6
	beq	.L47
	ldr	w0, [sp, 40]
	cmp	w0, 7
	beq	.L48
	b	.L38
.L57:
	ldr	w0, [sp, 36]
	bl	handleOutsideState
	str	w0, [sp, 40]
	b	.L38
.L42:
	add	x1, sp, 24
	add	x0, sp, 32
	mov	x2, x1
	mov	x1, x0
	ldr	w0, [sp, 36]
	bl	handleOpeningCommentState
	str	w0, [sp, 40]
	b	.L38
.L43:
	add	x0, sp, 28
	mov	x1, x0
	ldr	w0, [sp, 36]
	bl	handleClosingCommentState
	str	w0, [sp, 40]
	b	.L38
.L40:
	add	x0, sp, 28
	mov	x1, x0
	ldr	w0, [sp, 36]
	bl	handleInCommentState
	str	w0, [sp, 40]
	b	.L38
.L46:
	ldr	w0, [sp, 36]
	bl	handleInStringLiteralState
	str	w0, [sp, 40]
	b	.L38
.L45:
	ldr	w0, [sp, 36]
	bl	handleInCharLiteralState
	str	w0, [sp, 40]
	b	.L38
.L47:
	ldr	w0, [sp, 36]
	bl	handleEscapeInCharState
	str	w0, [sp, 40]
	b	.L38
.L48:
	ldr	w0, [sp, 36]
	bl	handleEscapeInStringState
	str	w0, [sp, 40]
	nop
.L38:
	bl	getchar
	str	w0, [sp, 36]
	ldr	w0, [sp, 36]
	cmn	w0, #1
	bne	.L49
	ldr	w0, [sp, 40]
	cmp	w0, 3
	beq	.L50
	ldr	w0, [sp, 40]
	cmp	w0, 2
	bne	.L51
.L50:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w0, [sp, 32]
	mov	w2, w0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 32
	bl	putchar
	b	.L52
.L53:
	mov	w0, 10
	bl	putchar
.L52:
	ldr	w0, [sp, 44]
	add	w1, w0, 1
	str	w1, [sp, 44]
	ldr	w1, [sp, 28]
	cmp	w0, w1
	blt	.L53
	mov	w0, 1
	b	.L56
.L51:
	ldr	w0, [sp, 40]
	cmp	w0, 1
	bne	.L55
	mov	w0, 47
	bl	putchar
.L55:
	mov	w0, 0
.L56:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-10)"
	.section	.note.GNU-stack,"",@progbits
