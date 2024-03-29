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
str:	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0

.section .text
.global _start

_start:
	ldr r0, =hello
	bl strlen
	mov r2, r0
	add r2, r2, #0x1
	ldr r0, =str
	ldr r1, =hello
	bl strncpy
	bl puts

	eor r0, r0
	mov r7, #EXIT
	svc 0

@ >>>>>>>>>>>>>>>>>>>>>>>>>> STRING FUNCTIONS <<<<<<<<<<<<<<<<<<<<<<<<<<<<

@ unsigned strlen(char* str)
@
@ Calculte the length of the string in bytes.
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


@ char* strncpy(char* dest, char* src, unsigned n)
@ 
@ Copy the first n characters from src to dest.
@
@ Arguments:	1. Pointer to destination string
@		2. Pointer to source string
@		3. number of bytes to copy
@ Returns:	pointer to the destination string
.global strncpy
strncpy:
	push {r4, r5, lr}
	dst .req r0
	src .req r1
	n   .req r2
	i   .req r3
	buf .req r4
	j   .req r5

	eor i, i		@ i := 0
	mov j, n, lsr #2	@ j := n / 4
	sub n, n, #0x1		@ n := n - 1
	
	@ copy word wise
	strncpy_cpy_loop1:
		cmp j, #0x0
		ble strncpy_cpy_break1

		ldr buf, [src, i]
		str buf, [dst, i]

		add i, i, #0x4
		sub j, j, #0x1
		b strncpy_cpy_loop1
	strncpy_cpy_break1:
	
	@ copy byte wise
	strncpy_cpy_loop2:
		cmp i, n
		bge strncpy_cpy_break2

		ldrb buf, [src, i]	
		strb buf, [dst, i]

		add i, i, #0x1
		b strncpy_cpy_loop2
	strncpy_cpy_break2:

	strb j, [dst, n]	@ dst[n] := '\0'

	.unreq dst
	.unreq src
	.unreq n
	.unreq i
	.unreq buf
	.unreq j
	pop {r4, r5, pc}



@ >>>>>>>>>>>>>>>>>>>>>>>>>> IO FUNCTIONS <<<<<<<<<<<<<<<<<<<<<<<<<<<<

@ void puts(char *str) 
@
@ Print the given string to standard out.
@
@ Arguments: 	1. Address of NULL terminated string
@ Returns: 	void	
.global puts
puts:
	push {r4, lr}
	mov r4, r0
	bl strlen
	mov r2, r0
	mov r1, r4
	mov r0, #STDOUT
	mov r7, #WRITE
	svc 0
	pop {r4, pc}












