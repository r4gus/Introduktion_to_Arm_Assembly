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
next:
.set len, next - hello

.section .text
.global _start

_start:
	mov r0, #STDOUT   	@ r0 := stdout
	ldr r1, [pc, #0x14] 	@ r1 := &hello
	mov r2, #len	  	@ r2 := 13
	mov r7, #WRITE
	svc 0		  @ write(stdout, &hello, 13)
	
	eor r0, r0
	mov r7, #EXIT
	svc 0

pool:	.word hello
