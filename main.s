	.file	"main.c"
	.text
	.type	_add, @function
_add:
.LFB0:
	.cfi_startproc
	pushl	%ebp                # ebpをスタックにpush.　espは+8バイト
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp          # ebp = esp
	.cfi_def_cfa_register 5
	movl	12(%ebp), %eax      # eax = x
	movl	8(%ebp), %edx       # edx = y
	addl	%edx, %eax          # x(eax) = x(eax) + y
	popl	%ebp                # スタックからebpをpop. ebpに代入される.
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE0:
	.size	_add, .-_add
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp           # ローカル変数のスタック領域確保
	movl	$0, -8(%ebp)        # _x の初期化
	movl	$1, -4(%ebp)        # _y の初期化
	movl	$2, -8(%ebp)        # _x の代入
	movl	$3, -4(%ebp)        # _y の代入
	movl	-4(%ebp), %eax      # eax = _y
	movl	%eax, 4(%esp)       # 4(esp) = _y
	movl	-8(%ebp), %eax      # eax = _x
	movl	%eax, (%esp)        # esp = _x
	call	_add                # _add()の呼び出し
	movl	$0, %eax            # main()の戻り値
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
