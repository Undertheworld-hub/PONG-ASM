	.file	"pong.c"
	.text
	.globl	ball_x
	.data
	.align 4
	.type	ball_x, @object
	.size	ball_x, 4
ball_x:
	.long	40
	.globl	ball_y
	.align 4
	.type	ball_y, @object
	.size	ball_y, 4
ball_y:
	.long	12
	.globl	ball_dir_x
	.align 4
	.type	ball_dir_x, @object
	.size	ball_dir_x, 4
ball_dir_x:
	.long	1
	.globl	ball_dir_y
	.align 4
	.type	ball_dir_y, @object
	.size	ball_dir_y, 4
ball_dir_y:
	.long	1
	.globl	paddle1_y
	.align 4
	.type	paddle1_y, @object
	.size	paddle1_y, 4
paddle1_y:
	.long	10
	.globl	paddle2_y
	.align 4
	.type	paddle2_y, @object
	.size	paddle2_y, 4
paddle2_y:
	.long	10
	.globl	paddle_height
	.section	.rodata
	.align 4
	.type	paddle_height, @object
	.size	paddle_height, 4
paddle_height:
	.long	8
.LC0:
	.string	"BIENVENUE DANS MORPION"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	movl	$40, %esi
	movl	$12, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	call	initscr@PLT
	call	noecho@PLT
	movl	$0, %edi
	call	curs_set@PLT
	movq	stdscr(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	wtimeout@PLT
.L2:
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movl	$0, %eax
	call	input
	movl	$0, %eax
	call	update
	movl	paddle1_y(%rip), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	draw_paddle
	movl	paddle2_y(%rip), %eax
	movl	%eax, %esi
	movl	$78, %edi
	call	draw_paddle
	movl	ball_y(%rip), %edx
	movl	ball_x(%rip), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	draw_ball
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	$50000, %edi
	call	usleep@PLT
	jmp	.L2
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC1:
	.string	"|"
	.text
	.globl	draw_paddle
	.type	draw_paddle, @function
draw_paddle:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-24(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-20(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	movl	%eax, %esi
	movl	%ecx, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	addl	$1, -4(%rbp)
.L4:
	movl	$8, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L5
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	draw_paddle, .-draw_paddle
	.section	.rodata
.LC2:
	.string	"O"
	.text
	.globl	draw_ball
	.type	draw_ball, @function
draw_ball:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %eax
	leaq	.LC2(%rip), %rdx
	movl	%ecx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	draw_ball, .-draw_ball
	.section	.rodata
.LC3:
	.string	" "
	.text
	.globl	clear_ball
	.type	clear_ball, @function
clear_ball:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %eax
	leaq	.LC3(%rip), %rdx
	movl	%ecx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	clear_ball, .-clear_ball
	.globl	input
	.type	input, @function
input:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -4(%rbp)
	cmpl	$97, -4(%rbp)
	jne	.L9
	movl	paddle1_y(%rip), %eax
	testl	%eax, %eax
	jle	.L9
	movl	paddle1_y(%rip), %eax
	subl	$1, %eax
	movl	%eax, paddle1_y(%rip)
.L9:
	cmpl	$119, -4(%rbp)
	jne	.L10
	movl	$8, %ecx
	movl	$24, %eax
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	paddle1_y(%rip), %eax
	cmpl	%eax, %edx
	jle	.L10
	movl	paddle1_y(%rip), %eax
	addl	$1, %eax
	movl	%eax, paddle1_y(%rip)
.L10:
	cmpl	$121, -4(%rbp)
	jne	.L11
	movl	paddle2_y(%rip), %eax
	testl	%eax, %eax
	jle	.L11
	movl	paddle2_y(%rip), %eax
	subl	$1, %eax
	movl	%eax, paddle2_y(%rip)
.L11:
	cmpl	$110, -4(%rbp)
	jne	.L13
	movl	$8, %ecx
	movl	$24, %eax
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	paddle2_y(%rip), %eax
	cmpl	%eax, %edx
	jle	.L13
	movl	paddle2_y(%rip), %eax
	addl	$1, %eax
	movl	%eax, paddle2_y(%rip)
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	input, .-input
	.globl	update
	.type	update, @function
update:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	ball_y(%rip), %edx
	movl	ball_x(%rip), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	clear_ball
	movl	ball_x(%rip), %edx
	movl	ball_dir_x(%rip), %eax
	addl	%edx, %eax
	movl	%eax, ball_x(%rip)
	movl	ball_y(%rip), %edx
	movl	ball_dir_y(%rip), %eax
	addl	%edx, %eax
	movl	%eax, ball_y(%rip)
	movl	ball_y(%rip), %eax
	testl	%eax, %eax
	jle	.L15
	movl	ball_y(%rip), %eax
	cmpl	$22, %eax
	jle	.L16
.L15:
	movl	ball_dir_y(%rip), %eax
	negl	%eax
	movl	%eax, ball_dir_y(%rip)
.L16:
	movl	ball_x(%rip), %eax
	cmpl	$2, %eax
	jne	.L17
	movl	ball_y(%rip), %edx
	movl	paddle1_y(%rip), %eax
	cmpl	%eax, %edx
	jl	.L17
	movl	paddle1_y(%rip), %eax
	movl	$8, %edx
	addl	%eax, %edx
	movl	ball_y(%rip), %eax
	cmpl	%eax, %edx
	jle	.L17
	movl	ball_dir_x(%rip), %eax
	negl	%eax
	movl	%eax, ball_dir_x(%rip)
.L17:
	movl	ball_x(%rip), %eax
	cmpl	$77, %eax
	jne	.L18
	movl	ball_y(%rip), %edx
	movl	paddle2_y(%rip), %eax
	cmpl	%eax, %edx
	jl	.L18
	movl	paddle2_y(%rip), %eax
	movl	$8, %edx
	addl	%eax, %edx
	movl	ball_y(%rip), %eax
	cmpl	%eax, %edx
	jle	.L18
	movl	ball_dir_x(%rip), %eax
	negl	%eax
	movl	%eax, ball_dir_x(%rip)
.L18:
	movl	ball_x(%rip), %eax
	testl	%eax, %eax
	jle	.L19
	movl	ball_x(%rip), %eax
	cmpl	$78, %eax
	jle	.L21
.L19:
	movl	$40, ball_x(%rip)
	movl	$12, ball_y(%rip)
	movl	ball_dir_x(%rip), %eax
	negl	%eax
	movl	%eax, ball_dir_x(%rip)
.L21:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	update, .-update
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
