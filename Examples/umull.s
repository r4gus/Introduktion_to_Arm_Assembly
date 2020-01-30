.section .data
x: .word 0x0FFFFFFF
y: .word 0x00012345

.section .text
.global _start
_start:
	ldr r0, pool	@ r0 := &x
	ldr r1, pool+4	@ r1 := &y
	ldr r0, [r0]	@ r0 := *x
	ldr r1, [r1]	@ r1 := *y
	
	umull r2, r3, r0, r1 	@ (r3, r2) := r0 * r1
				@ expected: 0x12344FFEDCBB
	mov r7, #1
	mov r0, #0
	svc 0

pool:	.word x
	.word y
