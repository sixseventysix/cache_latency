	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 4
	.globl	_shuffle                        ; -- Begin function shuffle
	.p2align	2
_shuffle:                               ; @shuffle
	.cfi_startproc
; %bb.0:
	cmp	x1, #1
	b.eq	LBB0_4
; %bb.1:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x1
	mov	x20, x0
	sub	x21, x0, #8
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
                                        ; kill: def $w0 killed $w0 def $x0
	sxtw	x8, w0
	udiv	x9, x8, x19
	msub	x8, x9, x19, x8
	ldr	x9, [x21, x19, lsl #3]
	ldr	x10, [x20, x8, lsl #3]
	str	x10, [x21, x19, lsl #3]
	str	x9, [x20, x8, lsl #3]
	sub	x19, x19, #1
	cmp	x19, #1
	b.ne	LBB0_2
; %bb.3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
LBB0_4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_now_ns                         ; -- Begin function now_ns
	.p2align	2
_now_ns:                                ; @now_ns
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x1, sp
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	w8, #51712                      ; =0xca00
	movk	w8, #15258, lsl #16
	ldp	x9, x10, [sp]
	madd	x0, x9, x8, x10
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #48]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	x21, #0                         ; =0x0
	mov	w23, #51712                     ; =0xca00
	movk	w23, #15258, lsl #16
	mov	x8, #20684562497536             ; =0x12d000000000
	movk	x8, #16739, lsl #48
	fmov	d8, x8
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_2 Depth 2
                                        ;     Child Loop BB2_4 Depth 2
                                        ;     Child Loop BB2_9 Depth 2
                                        ;     Child Loop BB2_12 Depth 2
                                        ;     Child Loop BB2_14 Depth 2
                                        ;     Child Loop BB2_16 Depth 2
Lloh2:
	adrp	x8, l___const.main.sizes@PAGE
Lloh3:
	add	x8, x8, l___const.main.sizes@PAGEOFF
	ldr	x25, [x8, x21, lsl #3]
	lsr	x28, x25, #3
	and	x0, x25, #0xfffffffffffffff8
	bl	_malloc
	mov	x20, x0
	mov	x26, #0                         ; =0x0
	cmp	x28, #1
	csinc	x24, x28, xzr, hi
LBB2_2:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w0, #8                          ; =0x8
	bl	_malloc
	str	x0, [x20, x26, lsl #3]
	add	x26, x26, #1
	cmp	x24, x26
	b.ne	LBB2_2
; %bb.3:                                ;   in Loop: Header=BB2_1 Depth=1
	subs	x26, x28, #1
	mov	x27, x26
	b.eq	LBB2_7
LBB2_4:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x22, x27, #1
	bl	_rand
                                        ; kill: def $w0 killed $w0 def $x0
	sxtw	x8, w0
	udiv	x9, x8, x22
	msub	x8, x9, x22, x8
	ldr	x9, [x20, x27, lsl #3]
	ldr	x10, [x20, x8, lsl #3]
	str	x10, [x20, x27, lsl #3]
	str	x9, [x20, x8, lsl #3]
	subs	x27, x27, #1
	b.ne	LBB2_4
; %bb.5:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	x27, [x20]
	cmp	x26, #3
	b.hi	LBB2_8
; %bb.6:                                ;   in Loop: Header=BB2_1 Depth=1
	mov	x8, #0                          ; =0x0
	mov	x9, x27
	b	LBB2_11
LBB2_7:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	x27, [x20]
	b	LBB2_13
LBB2_8:                                 ;   in Loop: Header=BB2_1 Depth=1
	and	x8, x26, #0xfffffffffffffffc
	add	x10, x20, #32
	mov	x11, x8
	mov	x9, x27
LBB2_9:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	x12, x13, [x10, #-24]
	str	x12, [x9]
	ldp	x14, x9, [x10, #-8]
	str	x13, [x12]
	str	x14, [x13]
	str	x9, [x14]
	add	x10, x10, #32
	subs	x11, x11, #4
	b.ne	LBB2_9
; %bb.10:                               ;   in Loop: Header=BB2_1 Depth=1
	cmp	x26, x8
	b.eq	LBB2_13
LBB2_11:                                ;   in Loop: Header=BB2_1 Depth=1
	mvn	x10, x8
	add	x10, x10, x28
	add	x8, x20, x8, lsl #3
	add	x8, x8, #8
LBB2_12:                                ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x11, [x8], #8
	str	x11, [x9]
	mov	x9, x11
	subs	x10, x10, #1
	b.ne	LBB2_12
LBB2_13:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [x20, x26, lsl #3]
	str	x27, [x8]
	add	x1, sp, #16
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x26, x28, [sp, #16]
	mov	w8, #38528                      ; =0x9680
	movk	w8, #152, lsl #16
LBB2_14:                                ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x27, [x27]
	subs	x8, x8, #1
	b.ne	LBB2_14
; %bb.15:                               ;   in Loop: Header=BB2_1 Depth=1
	add	x1, sp, #16
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x8, x9, [sp, #16]
	sub	x8, x8, x26
	sub	x9, x9, x28
	madd	x8, x8, x23, x9
	ucvtf	d0, x8
	fdiv	d0, d0, d8
	lsr	x8, x25, #10
	str	x8, [sp]
	str	d0, [sp, #8]
	mov	x0, x19
	bl	_printf
	mov	x25, #0                         ; =0x0
LBB2_16:                                ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x0, [x20, x25, lsl #3]
	bl	_free
	add	x25, x25, #1
	cmp	x24, x25
	b.ne	LBB2_16
; %bb.17:                               ;   in Loop: Header=BB2_1 Depth=1
	mov	x0, x20
	bl	_free
	add	x21, x21, #1
	cmp	x21, #12
	b.ne	LBB2_1
; %bb.18:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	3, 0x0                          ; @__const.main.sizes
l___const.main.sizes:
	.quad	32768                           ; 0x8000
	.quad	65536                           ; 0x10000
	.quad	131072                          ; 0x20000
	.quad	262144                          ; 0x40000
	.quad	524288                          ; 0x80000
	.quad	1048576                         ; 0x100000
	.quad	2097152                         ; 0x200000
	.quad	4194304                         ; 0x400000
	.quad	8388608                         ; 0x800000
	.quad	16777216                        ; 0x1000000
	.quad	33554432                        ; 0x2000000
	.quad	1073741824                      ; 0x40000000

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Size: %zu KB, Average pointer chase latency: %.2f ns\n"

.subsections_via_symbols
