.syntax unified
.text
.global _start
_start:
	.code 32
	mov r0, #0x12
	mov r1, #0x14
	ldr r2, =greatest_plus_one
	add r2, #0x1
	blx r2

	mov r7, #0x1
	mov r0, #0
	svc 0

	.code 16
greatest_plus_one:
	cmp r0, r1
	ITEE GE
	addge r0, #0x1
	movlt r0, r1
	addlt r0, #0x1
	
	bx lr


