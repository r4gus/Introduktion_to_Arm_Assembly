.equ STDIN, 0x0
.equ STDOUT, 0x1
.equ STDERR, 0x2

.equ EXIT, 0x1
.equ READ, 0x3
.equ WRITE, 0x4
.equ OPEN, 0x5
.equ CLOSE, 0x6

.equ EXECVE, 0xb


.section .data
hello:	.asciz "Hello, ARM!\n"

.section .text
.global _start

_start:
	ldr r4, [pc, #0x24]
	mov r0, r4
	bl strlen
	mov r2, r0
	mov r1, r4
	mov r0, #STDOUT
	mov r7, #WRITE
	svc 0
	
	eor r0, r0
	mov r7, #EXIT
	svc 0

pool:	.word hello

@ >>>>>>>>>>>>>>>>>>>>>>>>>> STRING FUNCTIONS <<<<<<<<<<<<<<<<<<<<<<<<<<<<

@ unsigned strlen(char* str)
@
@ Arguments: 	1. Address of NULL terminated string
@ Returns: 	the length of the string (number of bytes up to but not including '\0')
.global strlen
strlen:
	push {lr}
	base 	.req r0
	acc	.req r1
	char	.req r2

	eor acc, acc			@ acc := 0
	
	strlen_count_loop:
		ldrb char, [base],#0x1
		cmp char, #0x0
		beq strlen_count_break	@ if char = '\0': break
		add acc, #0x1		@ acc += 1
		b strlen_count_loop
	strlen_count_break:

	mov r0, acc			@ return acc

	.unreq base
	.unreq acc
	.unreq char
	pop {pc}

