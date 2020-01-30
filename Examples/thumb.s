.section .text
.global _start
_start:
	.code 32	@ marks a ARM section (word alligned)
	mov r0, #3
	mov r1, #4
	ldr r2, =thumbAdd		@ load address
	add r2, #1			@ +1 to enter Thumb state
	blx r2				@ branch to Thumb code

	mov r7, #1
	mov r0, #0
	svc 0				@ exit(0)
	
	.code 16	@ marks a Thumb section (halfword alligned)
thumbAdd:
	add r0, r1			
	bx lr
